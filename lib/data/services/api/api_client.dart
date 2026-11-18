import 'package:dio/dio.dart';

/// Quien tiene los tokens de la sesión. Lo implementa el repositorio de
/// autenticación; el cliente HTTP solo los pide.
abstract interface class SessionTokens {
  /// El access token vigente, o null si no hay sesión.
  String? get accessToken;

  /// Pide un access token nuevo.
  ///
  /// Tiene que ser single-flight: si varias peticiones reciben `401` a la vez,
  /// todas esperan el mismo refresh. La API revoca todas las sesiones de la
  /// cuenta si ve un refresh token reusado (`ROTATION_GRACE_MS` en
  /// `token.service.ts`). Devuelve true si hay un token nuevo.
  Future<bool> refreshAccessToken();
}

/// Claves de `RequestOptions.extra` que entiende el interceptor de sesión.
abstract final class ApiExtra {
  /// La petición maneja su propio `401`: el interceptor no refresca. Es para
  /// las rutas de `/auth` que ya mandan o rotan el refresh token.
  static const skipSessionRefresh = 'skipSessionRefresh';

  /// La petición ya se reintentó una vez después de refrescar.
  static const retried = 'retried';
}

/// El cliente HTTP de la API de Globerce.
///
/// Pone el `Authorization` en cada petición y, si la API responde `401`,
/// refresca la sesión una vez y reintenta la petición original.
class ApiClient {
  ApiClient({required String baseUrl, Dio? dio})
    : dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 20),
              sendTimeout: const Duration(seconds: 20),
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
            ),
          ) {
    this.dio.interceptors.add(_SessionInterceptor(this));
  }

  final Dio dio;

  /// Se conecta después de crear el repositorio de autenticación, que a su vez
  /// necesita este cliente.
  SessionTokens? sessionTokens;
}

class _SessionInterceptor extends Interceptor {
  _SessionInterceptor(this._client);

  final ApiClient _client;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _client.sessionTokens?.accessToken;
    if (token != null && !options.headers.containsKey('Authorization')) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final tokens = _client.sessionTokens;

    final shouldRefresh =
        err.response?.statusCode == 401 &&
        tokens != null &&
        options.extra[ApiExtra.skipSessionRefresh] != true &&
        options.extra[ApiExtra.retried] != true;

    if (!shouldRefresh) {
      handler.next(err);
      return;
    }

    final refreshed = await tokens.refreshAccessToken();
    final token = tokens.accessToken;
    if (!refreshed || token == null) {
      handler.next(err);
      return;
    }

    options.headers['Authorization'] = 'Bearer $token';
    options.extra[ApiExtra.retried] = true;

    try {
      handler.resolve(await _client.dio.fetch<Object?>(options));
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }
}
