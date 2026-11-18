// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Order {

 String get id; int get number; OrderStatus get status; PaymentStatus get paymentStatus; String get customerName; String get customerPhone; String? get customerCity; String? get customerAddress; String? get customerNotes; String? get shippingZoneName; int get shippingCost; String? get couponCode; int get subtotal; int get discount; int get total;/// Cuándo la clienta abrió el chat de WhatsApp con el pedido. Null si
/// todavía no.
 DateTime? get whatsappOpenedAt;/// Nota interna: solo la ve el equipo de la tienda.
 String? get adminNotes; DateTime get createdAt;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Order;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.paymentStatus, _this.paymentStatus) || other.paymentStatus == _this.paymentStatus)&&(identical(other.customerName, _this.customerName) || other.customerName == _this.customerName)&&(identical(other.customerPhone, _this.customerPhone) || other.customerPhone == _this.customerPhone)&&(identical(other.customerCity, _this.customerCity) || other.customerCity == _this.customerCity)&&(identical(other.customerAddress, _this.customerAddress) || other.customerAddress == _this.customerAddress)&&(identical(other.customerNotes, _this.customerNotes) || other.customerNotes == _this.customerNotes)&&(identical(other.shippingZoneName, _this.shippingZoneName) || other.shippingZoneName == _this.shippingZoneName)&&(identical(other.shippingCost, _this.shippingCost) || other.shippingCost == _this.shippingCost)&&(identical(other.couponCode, _this.couponCode) || other.couponCode == _this.couponCode)&&(identical(other.subtotal, _this.subtotal) || other.subtotal == _this.subtotal)&&(identical(other.discount, _this.discount) || other.discount == _this.discount)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.whatsappOpenedAt, _this.whatsappOpenedAt) || other.whatsappOpenedAt == _this.whatsappOpenedAt)&&(identical(other.adminNotes, _this.adminNotes) || other.adminNotes == _this.adminNotes)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as Order;
  return Object.hash(runtimeType,_this.id,_this.number,_this.status,_this.paymentStatus,_this.customerName,_this.customerPhone,_this.customerCity,_this.customerAddress,_this.customerNotes,_this.shippingZoneName,_this.shippingCost,_this.couponCode,_this.subtotal,_this.discount,_this.total,_this.whatsappOpenedAt,_this.adminNotes,_this.createdAt);
}

@override
String toString() {
  final _this = this as Order;
  return 'Order(id: ${_this.id}, number: ${_this.number}, status: ${_this.status}, paymentStatus: ${_this.paymentStatus}, customerName: ${_this.customerName}, customerPhone: ${_this.customerPhone}, customerCity: ${_this.customerCity}, customerAddress: ${_this.customerAddress}, customerNotes: ${_this.customerNotes}, shippingZoneName: ${_this.shippingZoneName}, shippingCost: ${_this.shippingCost}, couponCode: ${_this.couponCode}, subtotal: ${_this.subtotal}, discount: ${_this.discount}, total: ${_this.total}, whatsappOpenedAt: ${_this.whatsappOpenedAt}, adminNotes: ${_this.adminNotes}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id, int number, OrderStatus status, PaymentStatus paymentStatus, String customerName, String customerPhone, String? customerCity, String? customerAddress, String? customerNotes, String? shippingZoneName, int shippingCost, String? couponCode, int subtotal, int discount, int total, DateTime? whatsappOpenedAt, String? adminNotes, DateTime createdAt
});




}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? number = null,Object? status = null,Object? paymentStatus = null,Object? customerName = null,Object? customerPhone = null,Object? customerCity = freezed,Object? customerAddress = freezed,Object? customerNotes = freezed,Object? shippingZoneName = freezed,Object? shippingCost = null,Object? couponCode = freezed,Object? subtotal = null,Object? discount = null,Object? total = null,Object? whatsappOpenedAt = freezed,Object? adminNotes = freezed,Object? createdAt = null,}) {
  return _then(Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: null == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String,customerCity: freezed == customerCity ? _self.customerCity : customerCity // ignore: cast_nullable_to_non_nullable
as String?,customerAddress: freezed == customerAddress ? _self.customerAddress : customerAddress // ignore: cast_nullable_to_non_nullable
as String?,customerNotes: freezed == customerNotes ? _self.customerNotes : customerNotes // ignore: cast_nullable_to_non_nullable
as String?,shippingZoneName: freezed == shippingZoneName ? _self.shippingZoneName : shippingZoneName // ignore: cast_nullable_to_non_nullable
as String?,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int,couponCode: freezed == couponCode ? _self.couponCode : couponCode // ignore: cast_nullable_to_non_nullable
as String?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,whatsappOpenedAt: freezed == whatsappOpenedAt ? _self.whatsappOpenedAt : whatsappOpenedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,adminNotes: freezed == adminNotes ? _self.adminNotes : adminNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int number,  OrderStatus status,  PaymentStatus paymentStatus,  String customerName,  String customerPhone,  String? customerCity,  String? customerAddress,  String? customerNotes,  String? shippingZoneName,  int shippingCost,  String? couponCode,  int subtotal,  int discount,  int total,  DateTime? whatsappOpenedAt,  String? adminNotes,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.number,_that.status,_that.paymentStatus,_that.customerName,_that.customerPhone,_that.customerCity,_that.customerAddress,_that.customerNotes,_that.shippingZoneName,_that.shippingCost,_that.couponCode,_that.subtotal,_that.discount,_that.total,_that.whatsappOpenedAt,_that.adminNotes,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int number,  OrderStatus status,  PaymentStatus paymentStatus,  String customerName,  String customerPhone,  String? customerCity,  String? customerAddress,  String? customerNotes,  String? shippingZoneName,  int shippingCost,  String? couponCode,  int subtotal,  int discount,  int total,  DateTime? whatsappOpenedAt,  String? adminNotes,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.number,_that.status,_that.paymentStatus,_that.customerName,_that.customerPhone,_that.customerCity,_that.customerAddress,_that.customerNotes,_that.shippingZoneName,_that.shippingCost,_that.couponCode,_that.subtotal,_that.discount,_that.total,_that.whatsappOpenedAt,_that.adminNotes,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int number,  OrderStatus status,  PaymentStatus paymentStatus,  String customerName,  String customerPhone,  String? customerCity,  String? customerAddress,  String? customerNotes,  String? shippingZoneName,  int shippingCost,  String? couponCode,  int subtotal,  int discount,  int total,  DateTime? whatsappOpenedAt,  String? adminNotes,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.number,_that.status,_that.paymentStatus,_that.customerName,_that.customerPhone,_that.customerCity,_that.customerAddress,_that.customerNotes,_that.shippingZoneName,_that.shippingCost,_that.couponCode,_that.subtotal,_that.discount,_that.total,_that.whatsappOpenedAt,_that.adminNotes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _Order implements Order {
  const _Order({required this.id, required this.number, required this.status, required this.paymentStatus, required this.customerName, required this.customerPhone, this.customerCity, this.customerAddress, this.customerNotes, this.shippingZoneName, required this.shippingCost, this.couponCode, required this.subtotal, required this.discount, required this.total, this.whatsappOpenedAt, this.adminNotes, required this.createdAt});
  

@override final  String id;
@override final  int number;
@override final  OrderStatus status;
@override final  PaymentStatus paymentStatus;
@override final  String customerName;
@override final  String customerPhone;
@override final  String? customerCity;
@override final  String? customerAddress;
@override final  String? customerNotes;
@override final  String? shippingZoneName;
@override final  int shippingCost;
@override final  String? couponCode;
@override final  int subtotal;
@override final  int discount;
@override final  int total;
/// Cuándo la clienta abrió el chat de WhatsApp con el pedido. Null si
/// todavía no.
@override final  DateTime? whatsappOpenedAt;
/// Nota interna: solo la ve el equipo de la tienda.
@override final  String? adminNotes;
@override final  DateTime createdAt;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.customerCity, customerCity) || other.customerCity == customerCity)&&(identical(other.customerAddress, customerAddress) || other.customerAddress == customerAddress)&&(identical(other.customerNotes, customerNotes) || other.customerNotes == customerNotes)&&(identical(other.shippingZoneName, shippingZoneName) || other.shippingZoneName == shippingZoneName)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.couponCode, couponCode) || other.couponCode == couponCode)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.total, total) || other.total == total)&&(identical(other.whatsappOpenedAt, whatsappOpenedAt) || other.whatsappOpenedAt == whatsappOpenedAt)&&(identical(other.adminNotes, adminNotes) || other.adminNotes == adminNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,number,status,paymentStatus,customerName,customerPhone,customerCity,customerAddress,customerNotes,shippingZoneName,shippingCost,couponCode,subtotal,discount,total,whatsappOpenedAt,adminNotes,createdAt);
}

@override
String toString() {
    return 'Order(id: $id, number: $number, status: $status, paymentStatus: $paymentStatus, customerName: $customerName, customerPhone: $customerPhone, customerCity: $customerCity, customerAddress: $customerAddress, customerNotes: $customerNotes, shippingZoneName: $shippingZoneName, shippingCost: $shippingCost, couponCode: $couponCode, subtotal: $subtotal, discount: $discount, total: $total, whatsappOpenedAt: $whatsappOpenedAt, adminNotes: $adminNotes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id, int number, OrderStatus status, PaymentStatus paymentStatus, String customerName, String customerPhone, String? customerCity, String? customerAddress, String? customerNotes, String? shippingZoneName, int shippingCost, String? couponCode, int subtotal, int discount, int total, DateTime? whatsappOpenedAt, String? adminNotes, DateTime createdAt
});




}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? number = null,Object? status = null,Object? paymentStatus = null,Object? customerName = null,Object? customerPhone = null,Object? customerCity = freezed,Object? customerAddress = freezed,Object? customerNotes = freezed,Object? shippingZoneName = freezed,Object? shippingCost = null,Object? couponCode = freezed,Object? subtotal = null,Object? discount = null,Object? total = null,Object? whatsappOpenedAt = freezed,Object? adminNotes = freezed,Object? createdAt = null,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: null == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String,customerCity: freezed == customerCity ? _self.customerCity : customerCity // ignore: cast_nullable_to_non_nullable
as String?,customerAddress: freezed == customerAddress ? _self.customerAddress : customerAddress // ignore: cast_nullable_to_non_nullable
as String?,customerNotes: freezed == customerNotes ? _self.customerNotes : customerNotes // ignore: cast_nullable_to_non_nullable
as String?,shippingZoneName: freezed == shippingZoneName ? _self.shippingZoneName : shippingZoneName // ignore: cast_nullable_to_non_nullable
as String?,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int,couponCode: freezed == couponCode ? _self.couponCode : couponCode // ignore: cast_nullable_to_non_nullable
as String?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,whatsappOpenedAt: freezed == whatsappOpenedAt ? _self.whatsappOpenedAt : whatsappOpenedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,adminNotes: freezed == adminNotes ? _self.adminNotes : adminNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$OrderItem {

 String get id; String get productName;/// "Rojo · M". Vacío si el producto no tiene variantes.
 String get variantLabel; String? get sku; int get unitPrice; int get qty; int get lineTotal;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OrderItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.productName, _this.productName) || other.productName == _this.productName)&&(identical(other.variantLabel, _this.variantLabel) || other.variantLabel == _this.variantLabel)&&(identical(other.sku, _this.sku) || other.sku == _this.sku)&&(identical(other.unitPrice, _this.unitPrice) || other.unitPrice == _this.unitPrice)&&(identical(other.qty, _this.qty) || other.qty == _this.qty)&&(identical(other.lineTotal, _this.lineTotal) || other.lineTotal == _this.lineTotal));
}


@override
int get hashCode {
  final _this = this as OrderItem;
  return Object.hash(runtimeType,_this.id,_this.productName,_this.variantLabel,_this.sku,_this.unitPrice,_this.qty,_this.lineTotal);
}

@override
String toString() {
  final _this = this as OrderItem;
  return 'OrderItem(id: ${_this.id}, productName: ${_this.productName}, variantLabel: ${_this.variantLabel}, sku: ${_this.sku}, unitPrice: ${_this.unitPrice}, qty: ${_this.qty}, lineTotal: ${_this.lineTotal})';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
 String id, String productName, String variantLabel, String? sku, int unitPrice, int qty, int lineTotal
});




}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productName = null,Object? variantLabel = null,Object? sku = freezed,Object? unitPrice = null,Object? qty = null,Object? lineTotal = null,}) {
  return _then(OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productName,  String variantLabel,  String? sku,  int unitPrice,  int qty,  int lineTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.productName,_that.variantLabel,_that.sku,_that.unitPrice,_that.qty,_that.lineTotal);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productName,  String variantLabel,  String? sku,  int unitPrice,  int qty,  int lineTotal)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that.id,_that.productName,_that.variantLabel,_that.sku,_that.unitPrice,_that.qty,_that.lineTotal);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productName,  String variantLabel,  String? sku,  int unitPrice,  int qty,  int lineTotal)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.productName,_that.variantLabel,_that.sku,_that.unitPrice,_that.qty,_that.lineTotal);case _:
  return null;

}
}

}

/// @nodoc


class _OrderItem implements OrderItem {
  const _OrderItem({required this.id, required this.productName, required this.variantLabel, this.sku, required this.unitPrice, required this.qty, required this.lineTotal});
  

@override final  String id;
@override final  String productName;
/// "Rojo · M". Vacío si el producto no tiene variantes.
@override final  String variantLabel;
@override final  String? sku;
@override final  int unitPrice;
@override final  int qty;
@override final  int lineTotal;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,productName,variantLabel,sku,unitPrice,qty,lineTotal);
}

@override
String toString() {
    return 'OrderItem(id: $id, productName: $productName, variantLabel: $variantLabel, sku: $sku, unitPrice: $unitPrice, qty: $qty, lineTotal: $lineTotal)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String productName, String variantLabel, String? sku, int unitPrice, int qty, int lineTotal
});




}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productName = null,Object? variantLabel = null,Object? sku = freezed,Object? unitPrice = null,Object? qty = null,Object? lineTotal = null,}) {
  return _then(_OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$OrderDetail {

 Order get order; List<OrderItem> get items;
/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailCopyWith<OrderDetail> get copyWith => _$OrderDetailCopyWithImpl<OrderDetail>(this as OrderDetail, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OrderDetail;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetail&&(identical(other.order, _this.order) || other.order == _this.order)&&const DeepCollectionEquality().equals(other.items, _this.items));
}


@override
int get hashCode {
  final _this = this as OrderDetail;
  return Object.hash(runtimeType,_this.order,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as OrderDetail;
  return 'OrderDetail(order: ${_this.order}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $OrderDetailCopyWith<$Res>  {
  factory $OrderDetailCopyWith(OrderDetail value, $Res Function(OrderDetail) _then) = _$OrderDetailCopyWithImpl;
@useResult
$Res call({
 Order order, List<OrderItem> items
});


$OrderCopyWith<$Res> get order;

}
/// @nodoc
class _$OrderDetailCopyWithImpl<$Res>
    implements $OrderDetailCopyWith<$Res> {
  _$OrderDetailCopyWithImpl(this._self, this._then);

  final OrderDetail _self;
  final $Res Function(OrderDetail) _then;

/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? items = null,}) {
  return _then(OrderDetail(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,
  ));
}
/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderDetail].
extension OrderDetailPatterns on OrderDetail {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetail() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetail value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetail():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetail value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetail() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Order order,  List<OrderItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetail() when $default != null:
return $default(_that.order,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Order order,  List<OrderItem> items)  $default,) {final _that = this;
switch (_that) {
case _OrderDetail():
return $default(_that.order,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Order order,  List<OrderItem> items)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetail() when $default != null:
return $default(_that.order,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _OrderDetail implements OrderDetail {
  const _OrderDetail({required this.order, required  List<OrderItem> items}): _items = items;
  

@override final  Order order;
 final  List<OrderItem> _items;
@override List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailCopyWith<_OrderDetail> get copyWith => __$OrderDetailCopyWithImpl<_OrderDetail>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetail&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other.items, _items));
}


@override
int get hashCode {
    return Object.hash(runtimeType,order,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'OrderDetail(order: $order, items: $items)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailCopyWith<$Res> implements $OrderDetailCopyWith<$Res> {
  factory _$OrderDetailCopyWith(_OrderDetail value, $Res Function(_OrderDetail) _then) = __$OrderDetailCopyWithImpl;
@override @useResult
$Res call({
 Order order, List<OrderItem> items
});


@override $OrderCopyWith<$Res> get order;

}
/// @nodoc
class __$OrderDetailCopyWithImpl<$Res>
    implements _$OrderDetailCopyWith<$Res> {
  __$OrderDetailCopyWithImpl(this._self, this._then);

  final _OrderDetail _self;
  final $Res Function(_OrderDetail) _then;

/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? items = null,}) {
  return _then(_OrderDetail(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,
  ));
}

/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}

/// @nodoc
mixin _$OrderPage {

 List<Order> get orders;/// Pedidos que cumplen el filtro, en todas las páginas.
 int get total; int get page; int get pageCount;
/// Create a copy of OrderPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderPageCopyWith<OrderPage> get copyWith => _$OrderPageCopyWithImpl<OrderPage>(this as OrderPage, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OrderPage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderPage&&const DeepCollectionEquality().equals(other.orders, _this.orders)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.pageCount, _this.pageCount) || other.pageCount == _this.pageCount));
}


@override
int get hashCode {
  final _this = this as OrderPage;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.orders),_this.total,_this.page,_this.pageCount);
}

@override
String toString() {
  final _this = this as OrderPage;
  return 'OrderPage(orders: ${_this.orders}, total: ${_this.total}, page: ${_this.page}, pageCount: ${_this.pageCount})';
}


}

/// @nodoc
abstract mixin class $OrderPageCopyWith<$Res>  {
  factory $OrderPageCopyWith(OrderPage value, $Res Function(OrderPage) _then) = _$OrderPageCopyWithImpl;
@useResult
$Res call({
 List<Order> orders, int total, int page, int pageCount
});




}
/// @nodoc
class _$OrderPageCopyWithImpl<$Res>
    implements $OrderPageCopyWith<$Res> {
  _$OrderPageCopyWithImpl(this._self, this._then);

  final OrderPage _self;
  final $Res Function(OrderPage) _then;

/// Create a copy of OrderPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orders = null,Object? total = null,Object? page = null,Object? pageCount = null,}) {
  return _then(OrderPage(
orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<Order>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderPage].
extension OrderPagePatterns on OrderPage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderPage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderPage value)  $default,){
final _that = this;
switch (_that) {
case _OrderPage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderPage value)?  $default,){
final _that = this;
switch (_that) {
case _OrderPage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Order> orders,  int total,  int page,  int pageCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderPage() when $default != null:
return $default(_that.orders,_that.total,_that.page,_that.pageCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Order> orders,  int total,  int page,  int pageCount)  $default,) {final _that = this;
switch (_that) {
case _OrderPage():
return $default(_that.orders,_that.total,_that.page,_that.pageCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Order> orders,  int total,  int page,  int pageCount)?  $default,) {final _that = this;
switch (_that) {
case _OrderPage() when $default != null:
return $default(_that.orders,_that.total,_that.page,_that.pageCount);case _:
  return null;

}
}

}

/// @nodoc


class _OrderPage extends OrderPage {
  const _OrderPage({required  List<Order> orders, required this.total, required this.page, required this.pageCount}): _orders = orders,super._();
  

 final  List<Order> _orders;
@override List<Order> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

/// Pedidos que cumplen el filtro, en todas las páginas.
@override final  int total;
@override final  int page;
@override final  int pageCount;

/// Create a copy of OrderPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderPageCopyWith<_OrderPage> get copyWith => __$OrderPageCopyWithImpl<_OrderPage>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderPage&&const DeepCollectionEquality().equals(other.orders, _orders)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders),total,page,pageCount);
}

@override
String toString() {
    return 'OrderPage(orders: $orders, total: $total, page: $page, pageCount: $pageCount)';
}


}

/// @nodoc
abstract mixin class _$OrderPageCopyWith<$Res> implements $OrderPageCopyWith<$Res> {
  factory _$OrderPageCopyWith(_OrderPage value, $Res Function(_OrderPage) _then) = __$OrderPageCopyWithImpl;
@override @useResult
$Res call({
 List<Order> orders, int total, int page, int pageCount
});




}
/// @nodoc
class __$OrderPageCopyWithImpl<$Res>
    implements _$OrderPageCopyWith<$Res> {
  __$OrderPageCopyWithImpl(this._self, this._then);

  final _OrderPage _self;
  final $Res Function(_OrderPage) _then;

/// Create a copy of OrderPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orders = null,Object? total = null,Object? page = null,Object? pageCount = null,}) {
  return _then(_OrderPage(
orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<Order>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$LowStockItem {

 String get variantId; String get productName; String get variantLabel; int get stock;
/// Create a copy of LowStockItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockItemCopyWith<LowStockItem> get copyWith => _$LowStockItemCopyWithImpl<LowStockItem>(this as LowStockItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LowStockItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockItem&&(identical(other.variantId, _this.variantId) || other.variantId == _this.variantId)&&(identical(other.productName, _this.productName) || other.productName == _this.productName)&&(identical(other.variantLabel, _this.variantLabel) || other.variantLabel == _this.variantLabel)&&(identical(other.stock, _this.stock) || other.stock == _this.stock));
}


@override
int get hashCode {
  final _this = this as LowStockItem;
  return Object.hash(runtimeType,_this.variantId,_this.productName,_this.variantLabel,_this.stock);
}

@override
String toString() {
  final _this = this as LowStockItem;
  return 'LowStockItem(variantId: ${_this.variantId}, productName: ${_this.productName}, variantLabel: ${_this.variantLabel}, stock: ${_this.stock})';
}


}

/// @nodoc
abstract mixin class $LowStockItemCopyWith<$Res>  {
  factory $LowStockItemCopyWith(LowStockItem value, $Res Function(LowStockItem) _then) = _$LowStockItemCopyWithImpl;
@useResult
$Res call({
 String variantId, String productName, String variantLabel, int stock
});




}
/// @nodoc
class _$LowStockItemCopyWithImpl<$Res>
    implements $LowStockItemCopyWith<$Res> {
  _$LowStockItemCopyWithImpl(this._self, this._then);

  final LowStockItem _self;
  final $Res Function(LowStockItem) _then;

/// Create a copy of LowStockItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? productName = null,Object? variantLabel = null,Object? stock = null,}) {
  return _then(LowStockItem(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LowStockItem].
extension LowStockItemPatterns on LowStockItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockItem value)  $default,){
final _that = this;
switch (_that) {
case _LowStockItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockItem value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String variantId,  String productName,  String variantLabel,  int stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockItem() when $default != null:
return $default(_that.variantId,_that.productName,_that.variantLabel,_that.stock);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String variantId,  String productName,  String variantLabel,  int stock)  $default,) {final _that = this;
switch (_that) {
case _LowStockItem():
return $default(_that.variantId,_that.productName,_that.variantLabel,_that.stock);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String variantId,  String productName,  String variantLabel,  int stock)?  $default,) {final _that = this;
switch (_that) {
case _LowStockItem() when $default != null:
return $default(_that.variantId,_that.productName,_that.variantLabel,_that.stock);case _:
  return null;

}
}

}

/// @nodoc


class _LowStockItem implements LowStockItem {
  const _LowStockItem({required this.variantId, required this.productName, required this.variantLabel, required this.stock});
  

@override final  String variantId;
@override final  String productName;
@override final  String variantLabel;
@override final  int stock;

/// Create a copy of LowStockItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockItemCopyWith<_LowStockItem> get copyWith => __$LowStockItemCopyWithImpl<_LowStockItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockItem&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode {
    return Object.hash(runtimeType,variantId,productName,variantLabel,stock);
}

@override
String toString() {
    return 'LowStockItem(variantId: $variantId, productName: $productName, variantLabel: $variantLabel, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$LowStockItemCopyWith<$Res> implements $LowStockItemCopyWith<$Res> {
  factory _$LowStockItemCopyWith(_LowStockItem value, $Res Function(_LowStockItem) _then) = __$LowStockItemCopyWithImpl;
@override @useResult
$Res call({
 String variantId, String productName, String variantLabel, int stock
});




}
/// @nodoc
class __$LowStockItemCopyWithImpl<$Res>
    implements _$LowStockItemCopyWith<$Res> {
  __$LowStockItemCopyWithImpl(this._self, this._then);

  final _LowStockItem _self;
  final $Res Function(_LowStockItem) _then;

/// Create a copy of LowStockItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? productName = null,Object? variantLabel = null,Object? stock = null,}) {
  return _then(_LowStockItem(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Dashboard {

 int get pendingOrders;/// Pendientes con más de 24 horas: retienen stock sin avanzar.
 int get stalePendingOrders;/// Ventas no canceladas desde el día 1 del mes, hora de Colombia.
 int get monthRevenue; int get monthOrders; List<LowStockItem> get lowStock;/// Clientas esperando que vuelva algo a tener existencias.
 int get pendingRestock;
/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardCopyWith<Dashboard> get copyWith => _$DashboardCopyWithImpl<Dashboard>(this as Dashboard, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Dashboard;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dashboard&&(identical(other.pendingOrders, _this.pendingOrders) || other.pendingOrders == _this.pendingOrders)&&(identical(other.stalePendingOrders, _this.stalePendingOrders) || other.stalePendingOrders == _this.stalePendingOrders)&&(identical(other.monthRevenue, _this.monthRevenue) || other.monthRevenue == _this.monthRevenue)&&(identical(other.monthOrders, _this.monthOrders) || other.monthOrders == _this.monthOrders)&&const DeepCollectionEquality().equals(other.lowStock, _this.lowStock)&&(identical(other.pendingRestock, _this.pendingRestock) || other.pendingRestock == _this.pendingRestock));
}


@override
int get hashCode {
  final _this = this as Dashboard;
  return Object.hash(runtimeType,_this.pendingOrders,_this.stalePendingOrders,_this.monthRevenue,_this.monthOrders,const DeepCollectionEquality().hash(_this.lowStock),_this.pendingRestock);
}

@override
String toString() {
  final _this = this as Dashboard;
  return 'Dashboard(pendingOrders: ${_this.pendingOrders}, stalePendingOrders: ${_this.stalePendingOrders}, monthRevenue: ${_this.monthRevenue}, monthOrders: ${_this.monthOrders}, lowStock: ${_this.lowStock}, pendingRestock: ${_this.pendingRestock})';
}


}

/// @nodoc
abstract mixin class $DashboardCopyWith<$Res>  {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) _then) = _$DashboardCopyWithImpl;
@useResult
$Res call({
 int pendingOrders, int stalePendingOrders, int monthRevenue, int monthOrders, List<LowStockItem> lowStock, int pendingRestock
});




}
/// @nodoc
class _$DashboardCopyWithImpl<$Res>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._self, this._then);

  final Dashboard _self;
  final $Res Function(Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pendingOrders = null,Object? stalePendingOrders = null,Object? monthRevenue = null,Object? monthOrders = null,Object? lowStock = null,Object? pendingRestock = null,}) {
  return _then(Dashboard(
pendingOrders: null == pendingOrders ? _self.pendingOrders : pendingOrders // ignore: cast_nullable_to_non_nullable
as int,stalePendingOrders: null == stalePendingOrders ? _self.stalePendingOrders : stalePendingOrders // ignore: cast_nullable_to_non_nullable
as int,monthRevenue: null == monthRevenue ? _self.monthRevenue : monthRevenue // ignore: cast_nullable_to_non_nullable
as int,monthOrders: null == monthOrders ? _self.monthOrders : monthOrders // ignore: cast_nullable_to_non_nullable
as int,lowStock: null == lowStock ? _self.lowStock : lowStock // ignore: cast_nullable_to_non_nullable
as List<LowStockItem>,pendingRestock: null == pendingRestock ? _self.pendingRestock : pendingRestock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Dashboard].
extension DashboardPatterns on Dashboard {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dashboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dashboard value)  $default,){
final _that = this;
switch (_that) {
case _Dashboard():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dashboard value)?  $default,){
final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pendingOrders,  int stalePendingOrders,  int monthRevenue,  int monthOrders,  List<LowStockItem> lowStock,  int pendingRestock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that.pendingOrders,_that.stalePendingOrders,_that.monthRevenue,_that.monthOrders,_that.lowStock,_that.pendingRestock);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pendingOrders,  int stalePendingOrders,  int monthRevenue,  int monthOrders,  List<LowStockItem> lowStock,  int pendingRestock)  $default,) {final _that = this;
switch (_that) {
case _Dashboard():
return $default(_that.pendingOrders,_that.stalePendingOrders,_that.monthRevenue,_that.monthOrders,_that.lowStock,_that.pendingRestock);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pendingOrders,  int stalePendingOrders,  int monthRevenue,  int monthOrders,  List<LowStockItem> lowStock,  int pendingRestock)?  $default,) {final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that.pendingOrders,_that.stalePendingOrders,_that.monthRevenue,_that.monthOrders,_that.lowStock,_that.pendingRestock);case _:
  return null;

}
}

}

/// @nodoc


class _Dashboard implements Dashboard {
  const _Dashboard({required this.pendingOrders, required this.stalePendingOrders, required this.monthRevenue, required this.monthOrders, required  List<LowStockItem> lowStock, required this.pendingRestock}): _lowStock = lowStock;
  

@override final  int pendingOrders;
/// Pendientes con más de 24 horas: retienen stock sin avanzar.
@override final  int stalePendingOrders;
/// Ventas no canceladas desde el día 1 del mes, hora de Colombia.
@override final  int monthRevenue;
@override final  int monthOrders;
 final  List<LowStockItem> _lowStock;
@override List<LowStockItem> get lowStock {
  if (_lowStock is EqualUnmodifiableListView) return _lowStock;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lowStock);
}

/// Clientas esperando que vuelva algo a tener existencias.
@override final  int pendingRestock;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardCopyWith<_Dashboard> get copyWith => __$DashboardCopyWithImpl<_Dashboard>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dashboard&&(identical(other.pendingOrders, pendingOrders) || other.pendingOrders == pendingOrders)&&(identical(other.stalePendingOrders, stalePendingOrders) || other.stalePendingOrders == stalePendingOrders)&&(identical(other.monthRevenue, monthRevenue) || other.monthRevenue == monthRevenue)&&(identical(other.monthOrders, monthOrders) || other.monthOrders == monthOrders)&&const DeepCollectionEquality().equals(other.lowStock, _lowStock)&&(identical(other.pendingRestock, pendingRestock) || other.pendingRestock == pendingRestock));
}


@override
int get hashCode {
    return Object.hash(runtimeType,pendingOrders,stalePendingOrders,monthRevenue,monthOrders,const DeepCollectionEquality().hash(_lowStock),pendingRestock);
}

@override
String toString() {
    return 'Dashboard(pendingOrders: $pendingOrders, stalePendingOrders: $stalePendingOrders, monthRevenue: $monthRevenue, monthOrders: $monthOrders, lowStock: $lowStock, pendingRestock: $pendingRestock)';
}


}

/// @nodoc
abstract mixin class _$DashboardCopyWith<$Res> implements $DashboardCopyWith<$Res> {
  factory _$DashboardCopyWith(_Dashboard value, $Res Function(_Dashboard) _then) = __$DashboardCopyWithImpl;
@override @useResult
$Res call({
 int pendingOrders, int stalePendingOrders, int monthRevenue, int monthOrders, List<LowStockItem> lowStock, int pendingRestock
});




}
/// @nodoc
class __$DashboardCopyWithImpl<$Res>
    implements _$DashboardCopyWith<$Res> {
  __$DashboardCopyWithImpl(this._self, this._then);

  final _Dashboard _self;
  final $Res Function(_Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pendingOrders = null,Object? stalePendingOrders = null,Object? monthRevenue = null,Object? monthOrders = null,Object? lowStock = null,Object? pendingRestock = null,}) {
  return _then(_Dashboard(
pendingOrders: null == pendingOrders ? _self.pendingOrders : pendingOrders // ignore: cast_nullable_to_non_nullable
as int,stalePendingOrders: null == stalePendingOrders ? _self.stalePendingOrders : stalePendingOrders // ignore: cast_nullable_to_non_nullable
as int,monthRevenue: null == monthRevenue ? _self.monthRevenue : monthRevenue // ignore: cast_nullable_to_non_nullable
as int,monthOrders: null == monthOrders ? _self.monthOrders : monthOrders // ignore: cast_nullable_to_non_nullable
as int,lowStock: null == lowStock ? _self._lowStock : lowStock // ignore: cast_nullable_to_non_nullable
as List<LowStockItem>,pendingRestock: null == pendingRestock ? _self.pendingRestock : pendingRestock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
