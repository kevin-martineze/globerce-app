import 'package:dio/dio.dart';

import 'package:globerce_app/data/services/api/api_client.dart';
import 'package:globerce_app/data/services/api/api_error.dart';
import 'package:globerce_app/data/services/api/models/session_response.dart';
import 'package:globerce_app/utils/result.dart';

/// Las rutas de `/auth` de la API. No guarda nada ni decide nada: solo
/// traduce llamadas. La sesión la maneja `AuthRepositoryRemote`.
class AuthApi {
  AuthApi(this._client);

  final ApiClient _client;

  /// Las rutas que mandan el refresh token manejan su propio `401`.
  static final _noRefresh = Options(extra: {ApiExtra.skipSessionRefresh: true});

  Future<Result<SessionResponse>> login({
    required String email,
    required String password,
  }) {
    return _session(
      () => _client.dio.post<Object?>(
        '/auth/login',
        data: {'email': email, 'password': password},
        options: _noRefresh,
      ),
    );
  }

  /// Canjea el refresh token por una sesión nueva. El anterior queda anulado.
  Future<Result<SessionResponse>> refresh(String refreshToken) {
    return _session(
      () => _client.dio.post<Object?>(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
        options: _noRefresh,
      ),
    );
  }

  /// Cambia la tienda activa. Rota el refresh token igual que [refresh].
  Future<Result<SessionResponse>> switchStore({
    required String storeId,
    required String refreshToken,
  }) {
    return _session(
      () => _client.dio.post<Object?>(
        '/auth/switch-store',
        data: {'storeId': storeId, 'refreshToken': refreshToken},
        options: _noRefresh,
      ),
    );
  }

  /// Cierra esta sesión en la API. Las de otros dispositivos siguen vivas.
  Future<Result<void>> logout(String refreshToken) async {
    try {
      await _client.dio.post<Object?>(
        '/auth/logout',
        data: {'refreshToken': refreshToken},
        options: _noRefresh,
      );
      return const Result.ok(null);
    } on DioException catch (error) {
      return Result.error(apiErrorFrom(error));
    }
  }

  Future<Result<SessionResponse>> _session(
    Future<Response<Object?>> Function() request,
  ) async {
    final Response<Object?> response;
    try {
      response = await request();
    } on DioException catch (error) {
      return Result.error(apiErrorFrom(error));
    }

    final body = response.data;
    if (body is! Map<String, Object?>) {
      return const Result.error(_invalidResponse);
    }

    try {
      return Result.ok(SessionResponse.fromJson(body));
    } on Object {
      // La API cambió de forma: mejor un error claro que una sesión a medias.
      return const Result.error(_invalidResponse);
    }
  }

  static const _invalidResponse = AppError(
    code: ApiErrorCode.invalidResponse,
    message: 'Algo salió mal. Intenta de nuevo.',
  );
}
