import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_dto.freezed.dart';
part 'order_dto.g.dart';

/// Un pedido del panel: `OrderAdminDto` y `OrderDetailAdminDto` en
/// `ecommerce-api/src/shared/dtos/orders/order-admin.dto.ts`.
///
/// La lista no trae líneas y el detalle sí: por eso [items] tiene valor por
/// defecto. Los estados llegan en mayúsculas (`PENDING`) y el repositorio los
/// traduce.
@freezed
abstract class OrderDto with _$OrderDto {
  const factory OrderDto({
    required String id,
    required int number,
    required String status,
    required String paymentStatus,
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
    DateTime? whatsappOpenedAt,
    String? adminNotes,
    required DateTime createdAt,
    @Default(<OrderItemDto>[]) List<OrderItemDto> items,
  }) = _OrderDto;

  factory OrderDto.fromJson(Map<String, Object?> json) =>
      _$OrderDtoFromJson(json);
}

@freezed
abstract class OrderItemDto with _$OrderItemDto {
  const factory OrderItemDto({
    required String id,
    required String productName,
    required String variantLabel,
    String? sku,
    required int unitPrice,
    required int qty,
    required int lineTotal,
  }) = _OrderItemDto;

  factory OrderItemDto.fromJson(Map<String, Object?> json) =>
      _$OrderItemDtoFromJson(json);
}

/// `OrderPageDto`.
@freezed
abstract class OrderPageDto with _$OrderPageDto {
  const factory OrderPageDto({
    required List<OrderDto> orders,
    required int total,
    required int page,
    required int pageCount,
  }) = _OrderPageDto;

  factory OrderPageDto.fromJson(Map<String, Object?> json) =>
      _$OrderPageDtoFromJson(json);
}

/// `DashboardDto`.
@freezed
abstract class DashboardDto with _$DashboardDto {
  const factory DashboardDto({
    required int pendingOrders,
    required int stalePendingOrders,
    required int monthRevenue,
    required int monthOrders,
    required List<LowStockDto> lowStock,
    required int pendingRestock,
  }) = _DashboardDto;

  factory DashboardDto.fromJson(Map<String, Object?> json) =>
      _$DashboardDtoFromJson(json);
}

@freezed
abstract class LowStockDto with _$LowStockDto {
  const factory LowStockDto({
    required String variantId,
    required int stock,
    required String productName,
    required String variantLabel,
  }) = _LowStockDto;

  factory LowStockDto.fromJson(Map<String, Object?> json) =>
      _$LowStockDtoFromJson(json);
}
