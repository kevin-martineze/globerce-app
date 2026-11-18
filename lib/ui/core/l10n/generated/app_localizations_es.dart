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

  @override
  String get summaryLoadFailed => 'No pudimos cargar el resumen.';

  @override
  String get summaryPendingLabel => 'Por responder';

  @override
  String get summaryPendingNone => 'Estás al día';

  @override
  String summaryPendingStale(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count llevan más de un día',
      one: '1 lleva más de un día',
    );
    return '$_temp0';
  }

  @override
  String get summaryPendingFresh => 'Ninguno lleva más de un día';

  @override
  String get summaryMonthLabel => 'Ventas del mes';

  @override
  String summaryMonthOrders(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pedidos',
      one: '1 pedido',
      zero: 'Sin pedidos todavía',
    );
    return '$_temp0';
  }

  @override
  String get summaryLowStockTitle => 'Se está acabando';

  @override
  String summaryStockLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Quedan $count',
      one: 'Queda 1',
      zero: 'Agotado',
    );
    return '$_temp0';
  }

  @override
  String summaryRestock(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clientas esperan que vuelva algo',
      one: '1 clienta espera que vuelva algo',
    );
    return '$_temp0';
  }

  @override
  String ordersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pedidos',
      one: '1 pedido',
      zero: 'Sin pedidos',
    );
    return '$_temp0';
  }

  @override
  String get ordersSearchHint => 'Busca por número o nombre';

  @override
  String get ordersFilterAll => 'Todos';

  @override
  String get ordersFilterPending => 'Pendientes';

  @override
  String get ordersFilterConfirmed => 'Confirmados';

  @override
  String get ordersFilterShipped => 'Enviados';

  @override
  String get ordersFilterDelivered => 'Entregados';

  @override
  String get ordersFilterCancelled => 'Cancelados';

  @override
  String get ordersEmptyTitle => 'Todavía no hay pedidos';

  @override
  String get ordersEmptyBody =>
      'Cuando una clienta compre en tu tienda, su pedido aparece aquí.';

  @override
  String get ordersEmptyFilteredTitle => 'Nada por aquí';

  @override
  String get ordersEmptyFilteredBody =>
      'No hay pedidos con ese filtro. Prueba con otro estado o busca otro nombre.';

  @override
  String get ordersLoadMore => 'Ver más pedidos';

  @override
  String get ordersLoadFailed => 'No pudimos cargar los pedidos.';

  @override
  String get orderStatusPending => 'Pendiente';

  @override
  String get orderStatusConfirmed => 'Confirmado';

  @override
  String get orderStatusShipped => 'Enviado';

  @override
  String get orderStatusDelivered => 'Entregado';

  @override
  String get orderStatusCancelled => 'Cancelado';

  @override
  String get paymentUnpaid => 'Sin pagar';

  @override
  String get paymentPending => 'Pago en curso';

  @override
  String get paymentPaid => 'Pagado';

  @override
  String get paymentFailed => 'Pago fallido';

  @override
  String orderNumber(String number) {
    return 'Pedido #$number';
  }

  @override
  String orderNumberShort(String number) {
    return '#$number';
  }

  @override
  String get orderLoadFailed => 'No pudimos cargar el pedido.';

  @override
  String get orderChatOpened => 'Abrió el chat de WhatsApp';

  @override
  String get orderChatNotOpened => 'Todavía no abre el chat de WhatsApp';

  @override
  String get orderWriteWhatsApp => 'Escribirle por WhatsApp';

  @override
  String orderWhatsAppMessage(String name, String store, String number) {
    return 'Hola $name, te escribo de $store por tu pedido #$number.';
  }

  @override
  String get orderProductsTitle => 'Productos';

  @override
  String orderQtyTimesPrice(String qty, String price) {
    return '$qty × $price';
  }

  @override
  String get orderSubtotal => 'Subtotal';

  @override
  String get orderDiscount => 'Descuento';

  @override
  String orderDiscountWithCoupon(String code) {
    return 'Descuento ($code)';
  }

  @override
  String get orderShipping => 'Envío';

  @override
  String orderShippingZone(String zone) {
    return 'Envío · $zone';
  }

  @override
  String get orderShippingFree => 'Gratis';

  @override
  String get orderTotal => 'Total';

  @override
  String get orderCustomerTitle => 'Clienta';

  @override
  String get orderCustomerNotes => 'Nota de la clienta';

  @override
  String get orderStatusTitle => 'Estado';

  @override
  String get orderStatusBody =>
      'Cancelar devuelve el stock al inventario y libera el cupón.';

  @override
  String get orderStatusCancelledBody =>
      'Este pedido está cancelado: su stock ya volvió al inventario y no se puede reabrir.';

  @override
  String get orderSaving => 'Guardando…';

  @override
  String orderCancelConfirmTitle(String number) {
    return '¿Cancelar el pedido #$number?';
  }

  @override
  String get orderCancelConfirmBody =>
      'El stock vuelve al inventario y el cupón queda libre. Después no se puede reabrir.';

  @override
  String get orderCancelConfirm => 'Sí, cancelar pedido';

  @override
  String get orderCancelKeep => 'No, dejarlo así';

  @override
  String get orderNotesTitle => 'Nota interna';

  @override
  String get orderNotesBody =>
      'Solo la ve tu equipo. Sirve para acuerdos hechos por chat.';

  @override
  String get orderNotesHint => 'Escribe una nota';

  @override
  String get orderNotesSave => 'Guardar nota';

  @override
  String get orderNotesSaved => 'Nota guardada.';
}
