import 'dart:async';

import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/data/services/api/api_client.dart';
import 'package:globerce_app/data/services/api/auth_api.dart';
import 'package:globerce_app/data/services/api/models/session_response.dart';
import 'package:globerce_app/data/services/storage/session_storage.dart';
import 'package:globerce_app/domain/models/session.dart';
import 'package:globerce_app/utils/result.dart';

/// La sesión contra `ecommerce-api`.
///
/// El access token (15 min) vive solo en memoria. El refresh token (30 días)
/// vive en [SessionStorage] y rota en cada uso.
///
/// Todo lo que rota el refresh token —refrescar, cambiar de tienda, entrar,
/// salir— pasa por [_locked], de a uno. La API revoca todas las sesiones de la
/// cuenta si ve un refresh token ya usado, así que dos rotaciones en paralelo
/// con el mismo token pueden dejar a la dueña fuera de todos sus dispositivos.
/// Por la misma razón el token nuevo se guarda **antes** de devolver el
/// resultado: si la app se cierra justo después, al volver usa el bueno.
class AuthRepositoryRemote extends AuthRepository implements SessionTokens {
  AuthRepositoryRemote({
    required this._api,
    required this._storage,
    DateTime Function()? clock,
  }) : _now = clock ?? DateTime.now;

  final AuthApi _api;
  final SessionStorage _storage;
  final DateTime Function() _now;

  AuthStatus _status = AuthStatus.unknown;
  Session? _session;
  String? _accessToken;
  DateTime? _accessExpiresAt;

  Future<void>? _lock;
  Future<bool>? _refreshInFlight;

  /// Margen para refrescar antes de que el access token venza de verdad.
  static const _expiryMargin = Duration(seconds: 30);

  @override
  AuthStatus get status => _status;

  @override
  Session? get session => _session;

  @override
  String? get accessToken => _accessToken;

  @override
  Future<Result<void>> restore() async {
    await _storage.clearIfFreshInstall();

    final stored = await _storage.readRefreshToken();
    if (stored == null) {
      _setStatus(AuthStatus.signedOut);
      return const Result.ok(null);
    }

    final result = await _rotate(_api.refresh);
    switch (result) {
      case Ok():
        _setStatus(
          _session?.activeStoreId == null
              ? AuthStatus.signedOut
              : AuthStatus.signedIn,
        );
        return const Result.ok(null);
      case Error(:final error):
        return Result.error(error);
    }
  }

  @override
  Future<Result<Session>> login({
    required String email,
    required String password,
  }) {
    return _locked(() async {
      final result = await _api.login(email: email.trim(), password: password);

      switch (result) {
        case Error(:final error):
          return Result.error(error);
        case Ok(value: final response):
          if (response.stores.isEmpty) {
            // Sin tiendas no hay nada que hacer en la app. Se cierra la sesión
            // recién abierta para no dejar un refresh token vivo en la API.
            await _api.logout(response.refreshToken);
            return const Result.error(
              AppError(
                code: AuthErrorCode.noStores,
                message: 'Tu cuenta no tiene tiendas todavía.',
              ),
            );
          }

          await _storage.writeRefreshToken(response.refreshToken);
          final session = _apply(response);
          _setStatus(
            session.stores.length > 1
                ? AuthStatus.choosingStore
                : AuthStatus.signedIn,
          );
          return Result.ok(session);
      }
    });
  }

  @override
  Future<Result<Session>> selectStore(String storeId) async {
    final current = _session;
    if (current == null) {
      return const Result.error(
        AppError(
          code: AuthErrorCode.noSession,
          message: 'Tu sesión se cerró. Vuelve a entrar.',
        ),
      );
    }

    if (current.activeStoreId == storeId) {
      _setStatus(AuthStatus.signedIn);
      return Result.ok(current);
    }

    // `/auth/switch-store` pide un access token vigente además del refresh. Si
    // está por vencer se refresca antes: reintentar después de un `401`
    // mandaría un refresh token que ya rotó.
    if (_accessTokenExpiring) {
      final refreshed = await refreshAccessToken();
      if (!refreshed) {
        return const Result.error(
          AppError(
            code: AppError.unauthorized,
            message: 'Tu sesión se cerró. Vuelve a entrar.',
          ),
        );
      }
    }

    final result = await _rotate(
      (refreshToken) =>
          _api.switchStore(storeId: storeId, refreshToken: refreshToken),
    );

    switch (result) {
      case Error(:final error):
        return Result.error(error);
      case Ok():
        _setStatus(AuthStatus.signedIn);
        final session = _session;
        return session == null
            ? const Result.error(
                AppError(
                  code: AuthErrorCode.noSession,
                  message: 'Tu sesión se cerró. Vuelve a entrar.',
                ),
              )
            : Result.ok(session);
    }
  }

  @override
  Future<bool> refreshAccessToken() async {
    final inFlight = _refreshInFlight;
    if (inFlight != null) return inFlight;

    final future = _rotate(_api.refresh)
        .then((result) => result is Ok<SessionResponse>);
    _refreshInFlight = future;
    try {
      return await future;
    } finally {
      _refreshInFlight = null;
    }
  }

  @override
  Future<void> logout() {
    return _locked(() async {
      final stored = await _storage.readRefreshToken();
      // Se borra primero lo local: si la API no responde, la sesión igual se
      // cierra en este teléfono.
      await _storage.deleteRefreshToken();
      _clear();
      _setStatus(AuthStatus.signedOut);

      if (stored != null) await _api.logout(stored);
    });
  }

  bool get _accessTokenExpiring {
    final expiresAt = _accessExpiresAt;
    return expiresAt == null || !_now().add(_expiryMargin).isBefore(expiresAt);
  }

  /// Rota el refresh token guardado con [call] y aplica la sesión nueva.
  ///
  /// Lee el token dentro del candado, así que siempre usa el último. Si la API
  /// dice que la sesión ya no sirve, la borra y manda al login.
  Future<Result<SessionResponse>> _rotate(
    Future<Result<SessionResponse>> Function(String refreshToken) call,
  ) {
    return _locked(() async {
      final stored = await _storage.readRefreshToken();
      if (stored == null) {
        _clear();
        _setStatus(AuthStatus.signedOut);
        return const Result.error(
          AppError(
            code: AuthErrorCode.noSession,
            message: 'Tu sesión se cerró. Vuelve a entrar.',
          ),
        );
      }

      final result = await call(stored);
      switch (result) {
        case Ok(value: final response):
          await _storage.writeRefreshToken(response.refreshToken);
          _apply(response);
        case Error(:final error) when error.code == AppError.unauthorized:
          await _storage.deleteRefreshToken();
          _clear();
          _setStatus(AuthStatus.signedOut);
        case Error():
          // Sin conexión o error del servidor: la sesión puede seguir viva.
          break;
      }
      return result;
    });
  }

  /// Ejecuta [body] cuando termine lo que esté corriendo antes.
  Future<T> _locked<T>(Future<T> Function() body) {
    final previous = _lock ?? Future<void>.value();
    final done = Completer<void>();
    _lock = done.future;

    return previous.then((_) => body()).whenComplete(done.complete);
  }

  Session _apply(SessionResponse response) {
    _accessToken = response.accessToken;
    _accessExpiresAt = _now().add(Duration(seconds: response.expiresIn));

    final session = Session(
      user: User(
        id: response.user.id,
        email: response.user.email,
        fullName: response.user.fullName,
      ),
      stores: [
        for (final store in response.stores)
          Store(
            id: store.id,
            name: store.name,
            slug: store.slug,
            role: store.role == 'OWNER' ? StoreRole.owner : StoreRole.staff,
          ),
      ],
      activeStoreId: response.activeStoreId,
    );

    _session = session;
    notifyListeners();
    return session;
  }

  void _clear() {
    _accessToken = null;
    _accessExpiresAt = null;
    _session = null;
  }

  void _setStatus(AuthStatus status) {
    if (_status == status) return;
    _status = status;
    notifyListeners();
  }
}
