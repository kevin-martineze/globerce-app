// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Globerce';

  @override
  String get brandEyebrow => 'GLOBERCE';

  @override
  String get brandMarkLabel => 'Globerce';

  @override
  String get loginTitle => 'Iniciar sesión';

  @override
  String get loginEmailLabel => 'Correo';

  @override
  String get loginEmailHint => 'tu@correo.com';

  @override
  String get loginPasswordLabel => 'Contraseña';

  @override
  String get loginForgotPassword => '¿La olvidaste?';

  @override
  String get loginSubmit => 'Entrar';

  @override
  String get loginSubmitting => 'Entrando…';

  @override
  String get loginNoStoreQuestion => '¿No tienes tienda?';

  @override
  String get loginCreateStore => 'Créala';

  @override
  String get validationEmailRequired => 'Escribe tu correo.';

  @override
  String get validationEmailInvalid => 'Ese correo no se ve bien. Revísalo.';

  @override
  String get validationPasswordRequired => 'Escribe tu contraseña.';

  @override
  String get passwordShow => 'Mostrar contraseña';

  @override
  String get passwordHide => 'Ocultar contraseña';

  @override
  String get errorNetwork =>
      'No hay conexión. Revisa tu internet e intenta de nuevo.';

  @override
  String get errorTimeout => 'La conexión está muy lenta. Intenta de nuevo.';

  @override
  String get errorTooManyAttempts =>
      'Espera un momento antes de intentar de nuevo.';

  @override
  String get errorUnknown => 'Algo salió mal. Intenta de nuevo.';

  @override
  String get errorSessionExpired => 'Tu sesión se cerró. Vuelve a entrar.';

  @override
  String get errorOpenLink => 'No pudimos abrir el enlace.';

  @override
  String get retry => 'Reintentar';

  @override
  String get splashRestoreFailed => 'No pudimos revisar tu sesión.';

  @override
  String get noStoresTitle => 'Tu cuenta no tiene tiendas todavía';

  @override
  String get noStoresBody =>
      'Pídele a la dueña de la tienda que te invite, o crea la tuya desde la web.';

  @override
  String get storePickerEyebrow => 'ELIGE TU TIENDA';

  @override
  String get storePickerTitle => '¿Con cuál tienda vas a trabajar?';

  @override
  String get roleOwner => 'Dueña';

  @override
  String get roleStaff => 'Equipo';

  @override
  String homeGreeting(String name) {
    return 'Hola, $name';
  }

  @override
  String get homeGreetingNoName => 'Hola';

  @override
  String homeActiveStore(String store) {
    return 'Estás en $store';
  }

  @override
  String get homeSwitchStore => 'Cambiar de tienda';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get loggingOut => 'Cerrando sesión…';

  @override
  String get navSummary => 'Resumen';

  @override
  String get navOrders => 'Pedidos';

  @override
  String get navProducts => 'Productos';

  @override
  String get navInventory => 'Inventario';

  @override
  String get navMore => 'Más';

  @override
  String get summaryTodayTitle => 'Tu día en la tienda';

  @override
  String get summaryTodayBody =>
      'Aquí vas a ver cuánto vendiste hoy y los pedidos que esperan respuesta.';

  @override
  String get ordersComingTitle => 'Muy pronto, tus pedidos aquí';

  @override
  String get ordersComingBody =>
      'Vas a poder confirmarlos, despacharlos y avisarle a tu clienta desde el teléfono. Mientras tanto, están en el panel web.';

  @override
  String get productsComingTitle => 'Muy pronto, tus productos aquí';

  @override
  String get productsComingBody =>
      'Vas a poder crear productos y subir fotos con la cámara. Mientras tanto, están en el panel web.';

  @override
  String get inventoryComingTitle => 'Muy pronto, tu inventario aquí';

  @override
  String get inventoryComingBody =>
      'Vas a poder ajustar existencias de cada talla y color. Mientras tanto, está en el panel web.';

  @override
  String get openOnWeb => 'Abrir en la web';

  @override
  String get opensOnWeb => 'Se abre en la web';

  @override
  String get moreGroupStore => 'Tienda';

  @override
  String get moreGroupAccount => 'Cuenta';

  @override
  String get linkCollections => 'Colecciones';

  @override
  String get linkDesign => 'Diseño';

  @override
  String get linkCatalogs => 'Catálogos';

  @override
  String get linkCoupons => 'Cupones';

  @override
  String get linkShipping => 'Envíos';

  @override
  String get linkDomain => 'Dominio';

  @override
  String get linkRestockAlerts => 'Avisos';

  @override
  String get linkSupport => 'Soporte';

  @override
  String get linkSettings => 'Ajustes';

  @override
  String get linkTeam => 'Equipo';

  @override
  String get linkPayments => 'Pagos';

  @override
  String get linkPlan => 'Plan';

  @override
  String get linkAccount => 'Mi cuenta';
}
