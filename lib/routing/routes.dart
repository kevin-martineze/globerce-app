/// Las rutas de la app. Se navega solo con estas constantes.
abstract final class Routes {
  /// Arranque: se restaura la sesión guardada.
  static const splash = '/';
  static const login = '/login';

  /// Selector de tienda.
  static const stores = '/stores';

  // Pestañas del panel, en el orden de la barra inferior.
  static const summary = '/summary';
  static const orders = '/orders';
  static const products = '/products';
  static const inventory = '/inventory';
  static const more = '/more';
}
