/// Resultado de una operación de la capa de datos.
///
/// La capa de datos nunca lanza hacia arriba: devuelve un [Result]. Con un
/// `switch` exhaustivo el compilador obliga a manejar el error, que es lo que
/// hace `ApiResult<T>` en la web.
sealed class Result<T> {
  const Result();

  const factory Result.ok(T value) = Ok<T>;
  const factory Result.error(AppError error) = Error<T>;
}

final class Ok<T> extends Result<T> {
  const Ok(this.value);

  final T value;
}

final class Error<T> extends Result<T> {
  const Error(this.error);

  final AppError error;
}

/// Un error listo para mostrar.
///
/// [message] ya está en español y se puede pintar tal cual. Las decisiones se
/// toman con [code], nunca leyendo el texto: el texto puede cambiar, el código
/// no.
final class AppError {
  const AppError({required this.code, required this.message, this.statusCode});

  /// Código estable. El de la API (`error` en su cuerpo) o uno de la app.
  final String code;

  /// Texto en español de Colombia, listo para mostrar.
  final String message;

  /// Estado HTTP, cuando el error vino de la API.
  final int? statusCode;

  /// Códigos que genera la app, no la API.
  static const network = 'network';
  static const timeout = 'timeout';
  static const unknown = 'unknown';
  static const unauthorized = 'unauthorized';

  @override
  String toString() => 'AppError($code, $statusCode)';
}
