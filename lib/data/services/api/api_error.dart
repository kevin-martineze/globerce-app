import 'package:dio/dio.dart';

import 'package:globerce_app/utils/result.dart';

/// Códigos que la app deriva de la respuesta de la API.
abstract final class ApiErrorCode {
  static const tooManyRequests = 'too_many_requests';
  static const invalidResponse = 'invalid_response';
}

/// Traduce cualquier fallo de Dio a un [AppError].
///
/// La API responde siempre `{ statusCode, message, error, details?, path,
/// timestamp }` (ver `all-exceptions.filter.ts`). `message` ya viene en
/// español y se usa tal cual. Los fallos sin respuesta —sin conexión, tiempo
/// agotado— se marcan con un código de la app, y la UI pone su propio texto.
AppError apiErrorFrom(Object error) {
  if (error is! DioException) {
    return const AppError(
      code: AppError.unknown,
      message: 'Algo salió mal. Intenta de nuevo.',
    );
  }

  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return const AppError(
        code: AppError.timeout,
        message: 'La conexión está muy lenta.',
      );
    case DioExceptionType.connectionError:
      return const AppError(
        code: AppError.network,
        message: 'No hay conexión.',
      );
    default:
      break;
  }

  final response = error.response;
  if (response == null) {
    return const AppError(code: AppError.network, message: 'No hay conexión.');
  }

  final status = response.statusCode;
  final body = response.data;

  String? message;
  String? code;
  if (body is Map<String, Object?>) {
    final rawMessage = body['message'];
    final rawCode = body['error'];
    if (rawMessage is String && rawMessage.isNotEmpty) message = rawMessage;
    if (rawCode is String && rawCode.isNotEmpty) code = rawCode;
  }

  if (status == 429) {
    return AppError(
      code: ApiErrorCode.tooManyRequests,
      message: message ?? 'Espera un momento antes de intentar de nuevo.',
      statusCode: status,
    );
  }

  if (status == 401) {
    return AppError(
      code: AppError.unauthorized,
      message: message ?? 'Tu sesión se cerró. Vuelve a entrar.',
      statusCode: status,
    );
  }

  return AppError(
    code: code ?? AppError.unknown,
    message: message ?? 'Algo salió mal. Intenta de nuevo.',
    statusCode: status,
  );
}
