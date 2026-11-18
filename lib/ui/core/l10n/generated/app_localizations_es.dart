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
  String get homeComingSoon =>
      'Aquí vas a ver tus pedidos, productos y tu tienda.';

  @override
  String get homeSwitchStore => 'Cambiar de tienda';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get loggingOut => 'Cerrando sesión…';
}
