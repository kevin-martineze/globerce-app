// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => _OrderDto(
  id: json['id'] as String,
  number: (json['number'] as num).toInt(),
  status: json['status'] as String,
  paymentStatus: json['paymentStatus'] as String,
  customerName: json['customerName'] as String,
  customerPhone: json['customerPhone'] as String,
  customerCity: json['customerCity'] as String?,
  customerAddress: json['customerAddress'] as String?,
  customerNotes: json['customerNotes'] as String?,
  shippingZoneName: json['shippingZoneName'] as String?,
  shippingCost: (json['shippingCost'] as num).toInt(),
  couponCode: json['couponCode'] as String?,
  subtotal: (json['subtotal'] as num).toInt(),
  discount: (json['discount'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  whatsappOpenedAt: json['whatsappOpenedAt'] == null
      ? null
      : DateTime.parse(json['whatsappOpenedAt'] as String),
  adminNotes: json['adminNotes'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OrderItemDto>[],
);

Map<String, dynamic> _$OrderDtoToJson(_OrderDto instance) => <String, dynamic>{
  'id': instance.id,
  'number': instance.number,
  'status': instance.status,
  'paymentStatus': instance.paymentStatus,
  'customerName': instance.customerName,
  'customerPhone': instance.customerPhone,
  'customerCity': instance.customerCity,
  'customerAddress': instance.customerAddress,
  'customerNotes': instance.customerNotes,
  'shippingZoneName': instance.shippingZoneName,
  'shippingCost': instance.shippingCost,
  'couponCode': instance.couponCode,
  'subtotal': instance.subtotal,
  'discount': instance.discount,
  'total': instance.total,
  'whatsappOpenedAt': instance.whatsappOpenedAt?.toIso8601String(),
  'adminNotes': instance.adminNotes,
  'createdAt': instance.createdAt.toIso8601String(),
  'items': instance.items,
};

_OrderItemDto _$OrderItemDtoFromJson(Map<String, dynamic> json) =>
    _OrderItemDto(
      id: json['id'] as String,
      productName: json['productName'] as String,
      variantLabel: json['variantLabel'] as String,
      sku: json['sku'] as String?,
      unitPrice: (json['unitPrice'] as num).toInt(),
      qty: (json['qty'] as num).toInt(),
      lineTotal: (json['lineTotal'] as num).toInt(),
    );

Map<String, dynamic> _$OrderItemDtoToJson(_OrderItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'variantLabel': instance.variantLabel,
      'sku': instance.sku,
      'unitPrice': instance.unitPrice,
      'qty': instance.qty,
      'lineTotal': instance.lineTotal,
    };

_OrderPageDto _$OrderPageDtoFromJson(Map<String, dynamic> json) =>
    _OrderPageDto(
      orders: (json['orders'] as List<dynamic>)
          .map((e) => OrderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pageCount: (json['pageCount'] as num).toInt(),
    );

Map<String, dynamic> _$OrderPageDtoToJson(_OrderPageDto instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'total': instance.total,
      'page': instance.page,
      'pageCount': instance.pageCount,
    };

_DashboardDto _$DashboardDtoFromJson(Map<String, dynamic> json) =>
    _DashboardDto(
      pendingOrders: (json['pendingOrders'] as num).toInt(),
      stalePendingOrders: (json['stalePendingOrders'] as num).toInt(),
      monthRevenue: (json['monthRevenue'] as num).toInt(),
      monthOrders: (json['monthOrders'] as num).toInt(),
      lowStock: (json['lowStock'] as List<dynamic>)
          .map((e) => LowStockDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingRestock: (json['pendingRestock'] as num).toInt(),
    );

Map<String, dynamic> _$DashboardDtoToJson(_DashboardDto instance) =>
    <String, dynamic>{
      'pendingOrders': instance.pendingOrders,
      'stalePendingOrders': instance.stalePendingOrders,
      'monthRevenue': instance.monthRevenue,
      'monthOrders': instance.monthOrders,
      'lowStock': instance.lowStock,
      'pendingRestock': instance.pendingRestock,
    };

_LowStockDto _$LowStockDtoFromJson(Map<String, dynamic> json) => _LowStockDto(
  variantId: json['variantId'] as String,
  stock: (json['stock'] as num).toInt(),
  productName: json['productName'] as String,
  variantLabel: json['variantLabel'] as String,
);

Map<String, dynamic> _$LowStockDtoToJson(_LowStockDto instance) =>
    <String, dynamic>{
      'variantId': instance.variantId,
      'stock': instance.stock,
      'productName': instance.productName,
      'variantLabel': instance.variantLabel,
    };
