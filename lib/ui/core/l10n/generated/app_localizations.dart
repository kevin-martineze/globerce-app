import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('es')];

  /// Nombre del producto. Único lugar donde se escribe.
  ///
  /// In es, this message translates to:
  /// **'Globerce'**
  String get appName;

  /// Antetítulo de las pantallas de acceso.
  ///
  /// In es, this message translates to:
  /// **'GLOBERCE'**
  String get brandEyebrow;

  /// No description provided for @brandMarkLabel.
  ///
  /// In es, this message translates to:
  /// **'Globerce'**
  String get brandMarkLabel;

  /// No description provided for @loginTitle.
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión'**
  String get loginTitle;

  /// No description provided for @loginEmailLabel.
  ///
  /// In es, this message translates to:
  /// **'Correo'**
  String get loginEmailLabel;

  /// No description provided for @loginEmailHint.
  ///
  /// In es, this message translates to:
  /// **'tu@correo.com'**
  String get loginEmailHint;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get loginPasswordLabel;

  /// No description provided for @loginForgotPassword.
  ///
  /// In es, this message translates to:
  /// **'¿La olvidaste?'**
  String get loginForgotPassword;

  /// No description provided for @loginSubmit.
  ///
  /// In es, this message translates to:
  /// **'Entrar'**
  String get loginSubmit;

  /// No description provided for @loginSubmitting.
  ///
  /// In es, this message translates to:
  /// **'Entrando…'**
  String get loginSubmitting;

  /// No description provided for @loginNoStoreQuestion.
  ///
  /// In es, this message translates to:
  /// **'¿No tienes tienda?'**
  String get loginNoStoreQuestion;

  /// No description provided for @loginCreateStore.
  ///
  /// In es, this message translates to:
  /// **'Créala'**
  String get loginCreateStore;

  /// No description provided for @validationEmailRequired.
  ///
  /// In es, this message translates to:
  /// **'Escribe tu correo.'**
  String get validationEmailRequired;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In es, this message translates to:
  /// **'Ese correo no se ve bien. Revísalo.'**
  String get validationEmailInvalid;

  /// No description provided for @validationPasswordRequired.
  ///
  /// In es, this message translates to:
  /// **'Escribe tu contraseña.'**
  String get validationPasswordRequired;

  /// No description provided for @passwordShow.
  ///
  /// In es, this message translates to:
  /// **'Mostrar contraseña'**
  String get passwordShow;

  /// No description provided for @passwordHide.
  ///
  /// In es, this message translates to:
  /// **'Ocultar contraseña'**
  String get passwordHide;

  /// No description provided for @errorNetwork.
  ///
  /// In es, this message translates to:
  /// **'No hay conexión. Revisa tu internet e intenta de nuevo.'**
  String get errorNetwork;

  /// No description provided for @errorTimeout.
  ///
  /// In es, this message translates to:
  /// **'La conexión está muy lenta. Intenta de nuevo.'**
  String get errorTimeout;

  /// No description provided for @errorTooManyAttempts.
  ///
  /// In es, this message translates to:
  /// **'Espera un momento antes de intentar de nuevo.'**
  String get errorTooManyAttempts;

  /// No description provided for @errorUnknown.
  ///
  /// In es, this message translates to:
  /// **'Algo salió mal. Intenta de nuevo.'**
  String get errorUnknown;

  /// No description provided for @errorSessionExpired.
  ///
  /// In es, this message translates to:
  /// **'Tu sesión se cerró. Vuelve a entrar.'**
  String get errorSessionExpired;

  /// No description provided for @errorOpenLink.
  ///
  /// In es, this message translates to:
  /// **'No pudimos abrir el enlace.'**
  String get errorOpenLink;

  /// No description provided for @retry.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get retry;

  /// No description provided for @splashRestoreFailed.
  ///
  /// In es, this message translates to:
  /// **'No pudimos revisar tu sesión.'**
  String get splashRestoreFailed;

  /// No description provided for @noStoresTitle.
  ///
  /// In es, this message translates to:
  /// **'Tu cuenta no tiene tiendas todavía'**
  String get noStoresTitle;

  /// No description provided for @noStoresBody.
  ///
  /// In es, this message translates to:
  /// **'Pídele a la dueña de la tienda que te invite, o crea la tuya desde la web.'**
  String get noStoresBody;

  /// No description provided for @storePickerEyebrow.
  ///
  /// In es, this message translates to:
  /// **'ELIGE TU TIENDA'**
  String get storePickerEyebrow;

  /// No description provided for @storePickerTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Con cuál tienda vas a trabajar?'**
  String get storePickerTitle;

  /// No description provided for @roleOwner.
  ///
  /// In es, this message translates to:
  /// **'Dueña'**
  String get roleOwner;

  /// No description provided for @roleStaff.
  ///
  /// In es, this message translates to:
  /// **'Equipo'**
  String get roleStaff;

  /// No description provided for @homeGreeting.
  ///
  /// In es, this message translates to:
  /// **'Hola, {name}'**
  String homeGreeting(String name);

  /// No description provided for @homeGreetingNoName.
  ///
  /// In es, this message translates to:
  /// **'Hola'**
  String get homeGreetingNoName;

  /// No description provided for @homeActiveStore.
  ///
  /// In es, this message translates to:
  /// **'Estás en {store}'**
  String homeActiveStore(String store);

  /// No description provided for @homeSwitchStore.
  ///
  /// In es, this message translates to:
  /// **'Cambiar de tienda'**
  String get homeSwitchStore;

  /// No description provided for @logout.
  ///
  /// In es, this message translates to:
  /// **'Cerrar sesión'**
  String get logout;

  /// No description provided for @loggingOut.
  ///
  /// In es, this message translates to:
  /// **'Cerrando sesión…'**
  String get loggingOut;

  /// No description provided for @navSummary.
  ///
  /// In es, this message translates to:
  /// **'Resumen'**
  String get navSummary;

  /// No description provided for @navOrders.
  ///
  /// In es, this message translates to:
  /// **'Pedidos'**
  String get navOrders;

  /// No description provided for @navProducts.
  ///
  /// In es, this message translates to:
  /// **'Productos'**
  String get navProducts;

  /// No description provided for @navInventory.
  ///
  /// In es, this message translates to:
  /// **'Inventario'**
  String get navInventory;

  /// No description provided for @navMore.
  ///
  /// In es, this message translates to:
  /// **'Más'**
  String get navMore;

  /// No description provided for @summaryTodayTitle.
  ///
  /// In es, this message translates to:
  /// **'Tu día en la tienda'**
  String get summaryTodayTitle;

  /// No description provided for @summaryTodayBody.
  ///
  /// In es, this message translates to:
  /// **'Aquí vas a ver cuánto vendiste hoy y los pedidos que esperan respuesta.'**
  String get summaryTodayBody;

  /// No description provided for @ordersComingTitle.
  ///
  /// In es, this message translates to:
  /// **'Muy pronto, tus pedidos aquí'**
  String get ordersComingTitle;

  /// No description provided for @ordersComingBody.
  ///
  /// In es, this message translates to:
  /// **'Vas a poder confirmarlos, despacharlos y avisarle a tu clienta desde el teléfono. Mientras tanto, están en el panel web.'**
  String get ordersComingBody;

  /// No description provided for @productsComingTitle.
  ///
  /// In es, this message translates to:
  /// **'Muy pronto, tus productos aquí'**
  String get productsComingTitle;

  /// No description provided for @productsComingBody.
  ///
  /// In es, this message translates to:
  /// **'Vas a poder crear productos y subir fotos con la cámara. Mientras tanto, están en el panel web.'**
  String get productsComingBody;

  /// No description provided for @inventoryComingTitle.
  ///
  /// In es, this message translates to:
  /// **'Muy pronto, tu inventario aquí'**
  String get inventoryComingTitle;

  /// No description provided for @inventoryComingBody.
  ///
  /// In es, this message translates to:
  /// **'Vas a poder ajustar existencias de cada talla y color. Mientras tanto, está en el panel web.'**
  String get inventoryComingBody;

  /// No description provided for @openOnWeb.
  ///
  /// In es, this message translates to:
  /// **'Abrir en la web'**
  String get openOnWeb;

  /// No description provided for @opensOnWeb.
  ///
  /// In es, this message translates to:
  /// **'Se abre en la web'**
  String get opensOnWeb;

  /// No description provided for @moreGroupStore.
  ///
  /// In es, this message translates to:
  /// **'Tienda'**
  String get moreGroupStore;

  /// No description provided for @moreGroupAccount.
  ///
  /// In es, this message translates to:
  /// **'Cuenta'**
  String get moreGroupAccount;

  /// No description provided for @linkCollections.
  ///
  /// In es, this message translates to:
  /// **'Colecciones'**
  String get linkCollections;

  /// No description provided for @linkDesign.
  ///
  /// In es, this message translates to:
  /// **'Diseño'**
  String get linkDesign;

  /// No description provided for @linkCatalogs.
  ///
  /// In es, this message translates to:
  /// **'Catálogos'**
  String get linkCatalogs;

  /// No description provided for @linkCoupons.
  ///
  /// In es, this message translates to:
  /// **'Cupones'**
  String get linkCoupons;

  /// No description provided for @linkShipping.
  ///
  /// In es, this message translates to:
  /// **'Envíos'**
  String get linkShipping;

  /// No description provided for @linkDomain.
  ///
  /// In es, this message translates to:
  /// **'Dominio'**
  String get linkDomain;

  /// No description provided for @linkRestockAlerts.
  ///
  /// In es, this message translates to:
  /// **'Avisos'**
  String get linkRestockAlerts;

  /// No description provided for @linkSupport.
  ///
  /// In es, this message translates to:
  /// **'Soporte'**
  String get linkSupport;

  /// No description provided for @linkSettings.
  ///
  /// In es, this message translates to:
  /// **'Ajustes'**
  String get linkSettings;

  /// No description provided for @linkTeam.
  ///
  /// In es, this message translates to:
  /// **'Equipo'**
  String get linkTeam;

  /// No description provided for @linkPayments.
  ///
  /// In es, this message translates to:
  /// **'Pagos'**
  String get linkPayments;

  /// No description provided for @linkPlan.
  ///
  /// In es, this message translates to:
  /// **'Plan'**
  String get linkPlan;

  /// No description provided for @linkAccount.
  ///
  /// In es, this message translates to:
  /// **'Mi cuenta'**
  String get linkAccount;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
