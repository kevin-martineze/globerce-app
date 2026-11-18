import 'package:globerce_app/data/services/api/models/order_dto.dart';
import 'package:globerce_app/domain/models/order.dart';

/// Traduce los pedidos de la API al dominio.
///
/// Los estados llegan en mayúsculas (`PENDING`). Un estado que la app no
/// conoce lanza [FormatException]: el repositorio lo convierte en un error de
/// respuesta inválida en vez de pintarlo mal.
extension OrderDtoMapping on OrderDto {
  Order toDomain() {
    return Order(
      id: id,
      number: number,
      status: orderStatusFromApi(status),
      paymentStatus: paymentStatusFromApi(paymentStatus),
      customerName: customerName,
      customerPhone: customerPhone,
      customerCity: customerCity,
      customerAddress: customerAddress,
      customerNotes: customerNotes,
      shippingZoneName: shippingZoneName,
      shippingCost: shippingCost,
      couponCode: couponCode,
      subtotal: subtotal,
      discount: discount,
      total: total,
      whatsappOpenedAt: whatsappOpenedAt,
      adminNotes: adminNotes,
      createdAt: createdAt,
    );
  }

  OrderDetail toDetail() {
    return OrderDetail(
      order: toDomain(),
      items: [
        for (final item in items)
          OrderItem(
            id: item.id,
            productName: item.productName,
            variantLabel: item.variantLabel,
            sku: item.sku,
            unitPrice: item.unitPrice,
            qty: item.qty,
            lineTotal: item.lineTotal,
          ),
      ],
    );
  }
}

extension OrderPageDtoMapping on OrderPageDto {
  OrderPage toDomain() {
    return OrderPage(
      orders: [for (final order in orders) order.toDomain()],
      total: total,
      page: page,
      pageCount: pageCount,
    );
  }
}

extension DashboardDtoMapping on DashboardDto {
  Dashboard toDomain() {
    return Dashboard(
      pendingOrders: pendingOrders,
      stalePendingOrders: stalePendingOrders,
      monthRevenue: monthRevenue,
      monthOrders: monthOrders,
      lowStock: [
        for (final item in lowStock)
          LowStockItem(
            variantId: item.variantId,
            productName: item.productName,
            variantLabel: item.variantLabel,
            stock: item.stock,
          ),
      ],
      pendingRestock: pendingRestock,
    );
  }
}

OrderStatus orderStatusFromApi(String value) {
  return switch (value) {
    'PENDING' => OrderStatus.pending,
    'CONFIRMED' => OrderStatus.confirmed,
    'SHIPPED' => OrderStatus.shipped,
    'DELIVERED' => OrderStatus.delivered,
    'CANCELLED' => OrderStatus.cancelled,
    _ => throw FormatException('Estado de pedido desconocido: $value'),
  };
}

String orderStatusToApi(OrderStatus status) => status.name.toUpperCase();

PaymentStatus paymentStatusFromApi(String value) {
  return switch (value) {
    'UNPAID' => PaymentStatus.unpaid,
    'PENDING' => PaymentStatus.pending,
    'PAID' => PaymentStatus.paid,
    'FAILED' => PaymentStatus.failed,
    _ => throw FormatException('Estado de pago desconocido: $value'),
  };
}
