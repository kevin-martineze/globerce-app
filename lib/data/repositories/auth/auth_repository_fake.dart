import 'package:globerce_app/data/repositories/auth/auth_repository.dart';
import 'package:globerce_app/domain/models/session.dart';
import 'package:globerce_app/utils/result.dart';

/// Una cuenta de prueba del repositorio en memoria.
class FakeAccount {
  const FakeAccount({
    required this.user,
    required this.password,
    this.stores = const [],
    this.locked = false,
  });

  final User user;
  final String password;
  final List<Store> stores;

  /// Simula la cuenta bloqueada por intentos fallidos (`403` en la API).
  final bool locked;
}

/// La sesión en memoria, sin API.
///
/// Sirve para los tests y para correr la app con `config/fake.json`. Responde
/// con los mismos mensajes que la API, así que la pantalla se ve igual.
///
/// Cuentas de prueba (contraseña `globerce123` en todas):
/// - `duena@globerce.test`: dueña de dos tiendas → pasa por el selector.
/// - `equipo@globerce.test`: equipo de una tienda → entra directo.
/// - `sin-tienda@globerce.test`: sin tiendas.
/// - `bloqueada@globerce.test`: cuenta bloqueada.
class AuthRepositoryFake extends AuthRepository {
  AuthRepositoryFake({
    List<FakeAccount>? accounts,
    this.latency = const Duration(milliseconds: 700),
    Session? initialSession,
  }) : _accounts = accounts ?? demoAccounts,
       _savedSession = initialSession;

  final List<FakeAccount> _accounts;

  /// Espera antes de responder, para ver el estado de carga.
  final Duration latency;

  /// La sesión "guardada" que encuentra [restore].
  Session? _savedSession;

  AuthStatus _status = AuthStatus.unknown;
  Session? _session;

  static const demoPassword = 'globerce123';

  static const demoAccounts = [
    FakeAccount(
      user: User(
        id: 'u-owner',
        email: 'duena@globerce.test',
        fullName: 'Valentina Ruiz',
      ),
      password: demoPassword,
      stores: [
        Store(
          id: 's-lino',
          name: 'Lino & Algodón',
          slug: 'lino-algodon',
          role: StoreRole.owner,
        ),
        Store(
          id: 's-brisa',
          name: 'Brisa Caribe',
          slug: 'brisa-caribe',
          role: StoreRole.owner,
        ),
      ],
    ),
    FakeAccount(
      user: User(
        id: 'u-staff',
        email: 'equipo@globerce.test',
        fullName: 'Camilo Pérez',
      ),
      password: demoPassword,
      stores: [
        Store(
          id: 's-lino',
          name: 'Lino & Algodón',
          slug: 'lino-algodon',
          role: StoreRole.staff,
        ),
      ],
    ),
    FakeAccount(
      user: User(id: 'u-none', email: 'sin-tienda@globerce.test'),
      password: demoPassword,
    ),
    FakeAccount(
      user: User(id: 'u-locked', email: 'bloqueada@globerce.test'),
      password: demoPassword,
      locked: true,
    ),
  ];

  @override
  AuthStatus get status => _status;

  @override
  Session? get session => _session;

  @override
  Future<Result<void>> restore() async {
    await Future<void>.delayed(latency);
    _session = _savedSession;
    _setStatus(_session == null ? AuthStatus.signedOut : AuthStatus.signedIn);
    return const Result.ok(null);
  }

  @override
  Future<Result<Session>> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(latency);

    final normalized = email.trim().toLowerCase();
    FakeAccount? account;
    for (final candidate in _accounts) {
      if (candidate.user.email == normalized) account = candidate;
    }

    if (account == null || account.password != password) {
      return const Result.error(
        AppError(
          code: 'Unauthorized',
          message: 'Correo o contraseña incorrectos.',
          statusCode: 401,
        ),
      );
    }

    if (account.locked) {
      return const Result.error(
        AppError(
          code: 'Forbidden',
          message: 'La cuenta está bloqueada temporalmente por intentos fallidos. Intenta de nuevo en unos minutos.',
          statusCode: 403,
        ),
      );
    }

    if (account.stores.isEmpty) {
      return const Result.error(
        AppError(
          code: AuthErrorCode.noStores,
          message: 'Tu cuenta no tiene tiendas todavía.',
        ),
      );
    }

    final session = Session(
      user: account.user,
      stores: account.stores,
      activeStoreId: account.stores.first.id,
    );
    _session = session;
    _savedSession = session;
    _setStatus(
      session.stores.length > 1
          ? AuthStatus.choosingStore
          : AuthStatus.signedIn,
    );
    return Result.ok(session);
  }

  @override
  Future<Result<Session>> selectStore(String storeId) async {
    final current = _session;
    if (current == null ||
        !current.stores.any((store) => store.id == storeId)) {
      return const Result.error(
        AppError(
          code: AuthErrorCode.noSession,
          message: 'Tu sesión se cerró. Vuelve a entrar.',
        ),
      );
    }

    if (current.activeStoreId != storeId) await Future<void>.delayed(latency);

    final session = current.copyWith(activeStoreId: storeId);
    _session = session;
    _savedSession = session;
    _status = AuthStatus.signedIn;
    notifyListeners();
    return Result.ok(session);
  }

  @override
  Future<void> logout() async {
    _session = null;
    _savedSession = null;
    _setStatus(AuthStatus.signedOut);
  }

  void _setStatus(AuthStatus status) {
    _status = status;
    notifyListeners();
  }
}
