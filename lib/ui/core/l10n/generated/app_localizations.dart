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

  /// No description provided for @summaryLoadFailed.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar el resumen.'**
  String get summaryLoadFailed;

  /// No description provided for @summaryPendingLabel.
  ///
  /// In es, this message translates to:
  /// **'Por responder'**
  String get summaryPendingLabel;

  /// No description provided for @summaryPendingNone.
  ///
  /// In es, this message translates to:
  /// **'Estás al día'**
  String get summaryPendingNone;

  /// No description provided for @summaryPendingStale.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 lleva más de un día} other{{count} llevan más de un día}}'**
  String summaryPendingStale(int count);

  /// No description provided for @summaryPendingFresh.
  ///
  /// In es, this message translates to:
  /// **'Ninguno lleva más de un día'**
  String get summaryPendingFresh;

  /// No description provided for @summaryMonthLabel.
  ///
  /// In es, this message translates to:
  /// **'Ventas del mes'**
  String get summaryMonthLabel;

  /// No description provided for @summaryMonthOrders.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =0{Sin pedidos todavía} =1{1 pedido} other{{count} pedidos}}'**
  String summaryMonthOrders(int count);

  /// No description provided for @summaryLowStockTitle.
  ///
  /// In es, this message translates to:
  /// **'Se está acabando'**
  String get summaryLowStockTitle;

  /// No description provided for @summaryStockLeft.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =0{Agotado} =1{Queda 1} other{Quedan {count}}}'**
  String summaryStockLeft(int count);

  /// No description provided for @summaryRestock.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 clienta espera que vuelva algo} other{{count} clientas esperan que vuelva algo}}'**
  String summaryRestock(int count);

  /// No description provided for @ordersCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =0{Sin pedidos} =1{1 pedido} other{{count} pedidos}}'**
  String ordersCount(int count);

  /// No description provided for @ordersSearchHint.
  ///
  /// In es, this message translates to:
  /// **'Busca por número o nombre'**
  String get ordersSearchHint;

  /// No description provided for @ordersFilterAll.
  ///
  /// In es, this message translates to:
  /// **'Todos'**
  String get ordersFilterAll;

  /// No description provided for @ordersFilterPending.
  ///
  /// In es, this message translates to:
  /// **'Pendientes'**
  String get ordersFilterPending;

  /// No description provided for @ordersFilterConfirmed.
  ///
  /// In es, this message translates to:
  /// **'Confirmados'**
  String get ordersFilterConfirmed;

  /// No description provided for @ordersFilterShipped.
  ///
  /// In es, this message translates to:
  /// **'Enviados'**
  String get ordersFilterShipped;

  /// No description provided for @ordersFilterDelivered.
  ///
  /// In es, this message translates to:
  /// **'Entregados'**
  String get ordersFilterDelivered;

  /// No description provided for @ordersFilterCancelled.
  ///
  /// In es, this message translates to:
  /// **'Cancelados'**
  String get ordersFilterCancelled;

  /// No description provided for @ordersEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'Todavía no hay pedidos'**
  String get ordersEmptyTitle;

  /// No description provided for @ordersEmptyBody.
  ///
  /// In es, this message translates to:
  /// **'Cuando una clienta compre en tu tienda, su pedido aparece aquí.'**
  String get ordersEmptyBody;

  /// No description provided for @ordersEmptyFilteredTitle.
  ///
  /// In es, this message translates to:
  /// **'Nada por aquí'**
  String get ordersEmptyFilteredTitle;

  /// No description provided for @ordersEmptyFilteredBody.
  ///
  /// In es, this message translates to:
  /// **'No hay pedidos con ese filtro. Prueba con otro estado o busca otro nombre.'**
  String get ordersEmptyFilteredBody;

  /// No description provided for @ordersLoadMore.
  ///
  /// In es, this message translates to:
  /// **'Ver más pedidos'**
  String get ordersLoadMore;

  /// No description provided for @ordersLoadFailed.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar los pedidos.'**
  String get ordersLoadFailed;

  /// No description provided for @orderStatusPending.
  ///
  /// In es, this message translates to:
  /// **'Pendiente'**
  String get orderStatusPending;

  /// No description provided for @orderStatusConfirmed.
  ///
  /// In es, this message translates to:
  /// **'Confirmado'**
  String get orderStatusConfirmed;

  /// No description provided for @orderStatusShipped.
  ///
  /// In es, this message translates to:
  /// **'Enviado'**
  String get orderStatusShipped;

  /// No description provided for @orderStatusDelivered.
  ///
  /// In es, this message translates to:
  /// **'Entregado'**
  String get orderStatusDelivered;

  /// No description provided for @orderStatusCancelled.
  ///
  /// In es, this message translates to:
  /// **'Cancelado'**
  String get orderStatusCancelled;

  /// No description provided for @paymentUnpaid.
  ///
  /// In es, this message translates to:
  /// **'Sin pagar'**
  String get paymentUnpaid;

  /// No description provided for @paymentPending.
  ///
  /// In es, this message translates to:
  /// **'Pago en curso'**
  String get paymentPending;

  /// No description provided for @paymentPaid.
  ///
  /// In es, this message translates to:
  /// **'Pagado'**
  String get paymentPaid;

  /// No description provided for @paymentFailed.
  ///
  /// In es, this message translates to:
  /// **'Pago fallido'**
  String get paymentFailed;

  /// No description provided for @orderNumber.
  ///
  /// In es, this message translates to:
  /// **'Pedido #{number}'**
  String orderNumber(String number);

  /// No description provided for @orderNumberShort.
  ///
  /// In es, this message translates to:
  /// **'#{number}'**
  String orderNumberShort(String number);

  /// No description provided for @orderLoadFailed.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar el pedido.'**
  String get orderLoadFailed;

  /// No description provided for @orderChatOpened.
  ///
  /// In es, this message translates to:
  /// **'Abrió el chat de WhatsApp'**
  String get orderChatOpened;

  /// No description provided for @orderChatNotOpened.
  ///
  /// In es, this message translates to:
  /// **'Todavía no abre el chat de WhatsApp'**
  String get orderChatNotOpened;

  /// No description provided for @orderWriteWhatsApp.
  ///
  /// In es, this message translates to:
  /// **'Escribirle por WhatsApp'**
  String get orderWriteWhatsApp;

  /// No description provided for @orderWhatsAppMessage.
  ///
  /// In es, this message translates to:
  /// **'Hola {name}, te escribo de {store} por tu pedido #{number}.'**
  String orderWhatsAppMessage(String name, String store, String number);

  /// No description provided for @orderProductsTitle.
  ///
  /// In es, this message translates to:
  /// **'Productos'**
  String get orderProductsTitle;

  /// No description provided for @orderQtyTimesPrice.
  ///
  /// In es, this message translates to:
  /// **'{qty} × {price}'**
  String orderQtyTimesPrice(String qty, String price);

  /// No description provided for @orderSubtotal.
  ///
  /// In es, this message translates to:
  /// **'Subtotal'**
  String get orderSubtotal;

  /// No description provided for @orderDiscount.
  ///
  /// In es, this message translates to:
  /// **'Descuento'**
  String get orderDiscount;

  /// No description provided for @orderDiscountWithCoupon.
  ///
  /// In es, this message translates to:
  /// **'Descuento ({code})'**
  String orderDiscountWithCoupon(String code);

  /// No description provided for @orderShipping.
  ///
  /// In es, this message translates to:
  /// **'Envío'**
  String get orderShipping;

  /// No description provided for @orderShippingZone.
  ///
  /// In es, this message translates to:
  /// **'Envío · {zone}'**
  String orderShippingZone(String zone);

  /// No description provided for @orderShippingFree.
  ///
  /// In es, this message translates to:
  /// **'Gratis'**
  String get orderShippingFree;

  /// No description provided for @orderTotal.
  ///
  /// In es, this message translates to:
  /// **'Total'**
  String get orderTotal;

  /// No description provided for @orderCustomerTitle.
  ///
  /// In es, this message translates to:
  /// **'Clienta'**
  String get orderCustomerTitle;

  /// No description provided for @orderCustomerNotes.
  ///
  /// In es, this message translates to:
  /// **'Nota de la clienta'**
  String get orderCustomerNotes;

  /// No description provided for @orderStatusTitle.
  ///
  /// In es, this message translates to:
  /// **'Estado'**
  String get orderStatusTitle;

  /// No description provided for @orderStatusBody.
  ///
  /// In es, this message translates to:
  /// **'Cancelar devuelve el stock al inventario y libera el cupón.'**
  String get orderStatusBody;

  /// No description provided for @orderStatusCancelledBody.
  ///
  /// In es, this message translates to:
  /// **'Este pedido está cancelado: su stock ya volvió al inventario y no se puede reabrir.'**
  String get orderStatusCancelledBody;

  /// No description provided for @orderSaving.
  ///
  /// In es, this message translates to:
  /// **'Guardando…'**
  String get orderSaving;

  /// No description provided for @orderCancelConfirmTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Cancelar el pedido #{number}?'**
  String orderCancelConfirmTitle(String number);

  /// No description provided for @orderCancelConfirmBody.
  ///
  /// In es, this message translates to:
  /// **'El stock vuelve al inventario y el cupón queda libre. Después no se puede reabrir.'**
  String get orderCancelConfirmBody;

  /// No description provided for @orderCancelConfirm.
  ///
  /// In es, this message translates to:
  /// **'Sí, cancelar pedido'**
  String get orderCancelConfirm;

  /// No description provided for @orderCancelKeep.
  ///
  /// In es, this message translates to:
  /// **'No, dejarlo así'**
  String get orderCancelKeep;

  /// No description provided for @orderNotesTitle.
  ///
  /// In es, this message translates to:
  /// **'Nota interna'**
  String get orderNotesTitle;

  /// No description provided for @orderNotesBody.
  ///
  /// In es, this message translates to:
  /// **'Solo la ve tu equipo. Sirve para acuerdos hechos por chat.'**
  String get orderNotesBody;

  /// No description provided for @orderNotesHint.
  ///
  /// In es, this message translates to:
  /// **'Escribe una nota'**
  String get orderNotesHint;

  /// No description provided for @orderNotesSave.
  ///
  /// In es, this message translates to:
  /// **'Guardar nota'**
  String get orderNotesSave;

  /// No description provided for @orderNotesSaved.
  ///
  /// In es, this message translates to:
  /// **'Nota guardada.'**
  String get orderNotesSaved;
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
