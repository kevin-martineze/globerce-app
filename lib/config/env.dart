/// Configuración del entorno, leída en compilación.
///
/// Se pasa con `--dart-define-from-file=config/<entorno>.json`. Los valores
/// por defecto son los del simulador de iOS contra la API local.
abstract final class Env {
  /// Base de la API, con el prefijo de versión: `http://localhost:3000/v1`.
  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:3000/v1',
  );

  /// Base del sitio web, para los enlaces que la app abre en el navegador
  /// (recuperar contraseña, crear una tienda).
  static const webBaseUrl = String.fromEnvironment(
    'WEB_BASE_URL',
    defaultValue: 'https://globerce.store',
  );

  /// Corre la app contra los repositorios en memoria, sin API.
  static const useFakeApi = bool.fromEnvironment('USE_FAKE_API');
}
