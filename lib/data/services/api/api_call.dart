import 'package:dio/dio.dart';

import 'package:globerce_app/data/services/api/api_error.dart';
import 'package:globerce_app/utils/result.dart';

/// Hace una petición y lee su cuerpo JSON con [parse].
///
/// Nunca lanza: un fallo de red o de la API vuelve como [AppError] con
/// [apiErrorFrom], y un cuerpo que no tiene la forma esperada vuelve como
/// [ApiErrorCode.invalidResponse]. Es mejor un error claro que una pantalla a
/// medias.
Future<Result<T>> apiCall<T>(
  Future<Response<Object?>> Function() request,
  T Function(Map<String, Object?> json) parse,
) async {
  final Response<Object?> response;
  try {
    response = await request();
  } on DioException catch (error) {
    return Result.error(apiErrorFrom(error));
  }

  final body = response.data;
  if (body is! Map<String, Object?>) return const Result.error(invalidResponse);

  try {
    return Result.ok(parse(body));
  } on Object {
    // La API cambió de forma.
    return const Result.error(invalidResponse);
  }
}

const invalidResponse = AppError(
  code: ApiErrorCode.invalidResponse,
  message: 'Algo salió mal. Intenta de nuevo.',
);
