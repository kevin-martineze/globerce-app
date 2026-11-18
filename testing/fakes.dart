import 'package:globerce_app/data/services/api/auth_api.dart';
import 'package:globerce_app/data/services/api/models/session_response.dart';
import 'package:globerce_app/data/services/storage/session_storage.dart';
import 'package:globerce_app/utils/result.dart';

/// Refresh token en memoria.
class InMemorySessionStorage implements SessionStorage {
  InMemorySessionStorage([this.refreshToken]);

  String? refreshToken;
  int writes = 0;

  @override
  Future<String?> readRefreshToken() async => refreshToken;

  @override
  Future<void> writeRefreshToken(String token) async {
    writes++;
    refreshToken = token;
  }

  @override
  Future<void> deleteRefreshToken() async => refreshToken = null;

  @override
  Future<void> clearIfFreshInstall() async {}
}

/// `AuthApi` sin red. Cada prueba decide qué responde cada ruta.
class FakeAuthApi implements AuthApi {
  FakeAuthApi();

  Future<Result<SessionResponse>> Function(String email, String password)?
  onLogin;
  Future<Result<SessionResponse>> Function(String refreshToken)? onRefresh;
  Future<Result<SessionResponse>> Function(String storeId, String refreshToken)?
  onSwitchStore;

  final List<String> refreshCalls = [];
  final List<String> logoutCalls = [];

  @override
  Future<Result<SessionResponse>> login({
    required String email,
    required String password,
  }) => (onLogin ?? _unexpected2)(email, password);

  @override
  Future<Result<SessionResponse>> refresh(String refreshToken) {
    refreshCalls.add(refreshToken);
    return (onRefresh ?? _unexpected1)(refreshToken);
  }

  @override
  Future<Result<SessionResponse>> switchStore({
    required String storeId,
    required String refreshToken,
  }) => (onSwitchStore ?? _unexpected2)(storeId, refreshToken);

  @override
  Future<Result<void>> logout(String refreshToken) async {
    logoutCalls.add(refreshToken);
    return const Result.ok(null);
  }

  static Future<Result<SessionResponse>> _unexpected1(String _) =>
      throw StateError('Llamada inesperada a la API');
  static Future<Result<SessionResponse>> _unexpected2(String _, String _) =>
      throw StateError('Llamada inesperada a la API');
}

/// Una respuesta de sesión de prueba.
SessionResponse sessionResponse({
  String accessToken = 'access-1',
  String refreshToken = 'refresh-1',
  List<SessionStoreDto>? stores,
  String? activeStoreId = 's-lino',
}) {
  return SessionResponse(
    accessToken: accessToken,
    refreshToken: refreshToken,
    expiresIn: 900,
    user: const SessionUserDto(
      id: 'u-1',
      email: 'duena@globerce.test',
      fullName: 'Valentina Ruiz',
    ),
    stores:
        stores ??
        const [
          SessionStoreDto(
            id: 's-lino',
            name: 'Lino & Algodón',
            slug: 'lino-algodon',
            role: 'OWNER',
          ),
        ],
    activeStoreId: activeStoreId,
  );
}

const unauthorized = AppError(
  code: AppError.unauthorized,
  message: 'La sesión expiró.',
  statusCode: 401,
);
const offline = AppError(code: AppError.network, message: 'No hay conexión.');
