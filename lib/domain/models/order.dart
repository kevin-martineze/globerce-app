import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

/// En qué va el pedido. Es independiente del cobro: una venta contra entrega
/// va confirmada y sin pagar.
enum OrderStatus {
  pending,
  confirmed,
  shipped,
  delivered,

  /// Cancelar devuelve el stock y el uso del cupón. No se puede reabrir.
  cancelled,
}

/// Cómo va el cobro del pedido.
enum PaymentStatus { unpaid, pending, paid, failed }

/// Un pedido como lo ve el panel, sin sus líneas.
@freezed
abstract class Order with _$Order {
  const factory Order({
    required String id,
    required int number,
    required OrderStatus status,
    required PaymentStatus paymentStatus,
    required String customerName,
    required String customerPhone,
    String? customerCity,
    String? customerAddress,
    String? customerNotes,
    String? shippingZoneName,
    required int shippingCost,
    String? couponCode,
    required int subtotal,
    required int discount,
    required int total,

    /// Cuándo la clienta abrió el chat de WhatsApp con el pedido. Null si
    /// todavía no.
    DateTime? whatsappOpenedAt,

    /// Nota interna: solo la ve el equipo de la tienda.
    String? adminNotes,
    required DateTime createdAt,
  }) = _Order;
}

/// Una línea del pedido, como se vendió ese día.
@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String id,
    required String productName,

    /// "Rojo · M". Vacío si el producto no tiene variantes.
    required String variantLabel,
    String? sku,
    required int unitPrice,
    required int qty,
    required int lineTotal,
  }) = _OrderItem;
}

/// Un pedido con sus líneas.
@freezed
abstract class OrderDetail with _$OrderDetail {
  const factory OrderDetail({
    required Order order,
    required List<OrderItem> items,
  }) = _OrderDetail;
}

/// Una página de pedidos, los más nuevos primero.
@freezed
abstract class OrderPage with _$OrderPage {
  const OrderPage._();

  const factory OrderPage({
    required List<Order> orders,

    /// Pedidos que cumplen el filtro, en todas las páginas.
    required int total,
    required int page,
    required int pageCount,
  }) = _OrderPage;

  bool get hasMore => page < pageCount;
}

/// Una variante que se está quedando sin existencias.
@freezed
abstract class LowStockItem with _$LowStockItem {
  const factory LowStockItem({
    required String variantId,
    required String productName,
    required String variantLabel,
    required int stock,
  }) = _LowStockItem;
}

/// Las cifras del resumen.
@freezed
abstract class Dashboard with _$Dashboard {
  const factory Dashboard({
    required int pendingOrders,

    /// Pendientes con más de 24 horas: retienen stock sin avanzar.
    required int stalePendingOrders,

    /// Ventas no canceladas desde el día 1 del mes, hora de Colombia.
    required int monthRevenue,
    required int monthOrders,
    required List<LowStockItem> lowStock,

    /// Clientas esperando que vuelva algo a tener existencias.
    required int pendingRestock,
  }) = _Dashboard;
}
