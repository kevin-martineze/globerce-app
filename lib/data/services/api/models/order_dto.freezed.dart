// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDto {

 String get id; int get number; String get status; String get paymentStatus; String get customerName; String get customerPhone; String? get customerCity; String? get customerAddress; String? get customerNotes; String? get shippingZoneName; int get shippingCost; String? get couponCode; int get subtotal; int get discount; int get total; DateTime? get whatsappOpenedAt; String? get adminNotes; DateTime get createdAt; List<OrderItemDto> get items;
/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDtoCopyWith<OrderDto> get copyWith => _$OrderDtoCopyWithImpl<OrderDto>(this as OrderDto, _$identity);

  /// Serializes this OrderDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.paymentStatus, _this.paymentStatus) || other.paymentStatus == _this.paymentStatus)&&(identical(other.customerName, _this.customerName) || other.customerName == _this.customerName)&&(identical(other.customerPhone, _this.customerPhone) || other.customerPhone == _this.customerPhone)&&(identical(other.customerCity, _this.customerCity) || other.customerCity == _this.customerCity)&&(identical(other.customerAddress, _this.customerAddress) || other.customerAddress == _this.customerAddress)&&(identical(other.customerNotes, _this.customerNotes) || other.customerNotes == _this.customerNotes)&&(identical(other.shippingZoneName, _this.shippingZoneName) || other.shippingZoneName == _this.shippingZoneName)&&(identical(other.shippingCost, _this.shippingCost) || other.shippingCost == _this.shippingCost)&&(identical(other.couponCode, _this.couponCode) || other.couponCode == _this.couponCode)&&(identical(other.subtotal, _this.subtotal) || other.subtotal == _this.subtotal)&&(identical(other.discount, _this.discount) || other.discount == _this.discount)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.whatsappOpenedAt, _this.whatsappOpenedAt) || other.whatsappOpenedAt == _this.whatsappOpenedAt)&&(identical(other.adminNotes, _this.adminNotes) || other.adminNotes == _this.adminNotes)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderDto;
  return Object.hashAll([runtimeType,_this.id,_this.number,_this.status,_this.paymentStatus,_this.customerName,_this.customerPhone,_this.customerCity,_this.customerAddress,_this.customerNotes,_this.shippingZoneName,_this.shippingCost,_this.couponCode,_this.subtotal,_this.discount,_this.total,_this.whatsappOpenedAt,_this.adminNotes,_this.createdAt,const DeepCollectionEquality().hash(_this.items)]);
}

@override
String toString() {
  final _this = this as OrderDto;
  return 'OrderDto(id: ${_this.id}, number: ${_this.number}, status: ${_this.status}, paymentStatus: ${_this.paymentStatus}, customerName: ${_this.customerName}, customerPhone: ${_this.customerPhone}, customerCity: ${_this.customerCity}, customerAddress: ${_this.customerAddress}, customerNotes: ${_this.customerNotes}, shippingZoneName: ${_this.shippingZoneName}, shippingCost: ${_this.shippingCost}, couponCode: ${_this.couponCode}, subtotal: ${_this.subtotal}, discount: ${_this.discount}, total: ${_this.total}, whatsappOpenedAt: ${_this.whatsappOpenedAt}, adminNotes: ${_this.adminNotes}, createdAt: ${_this.createdAt}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $OrderDtoCopyWith<$Res>  {
  factory $OrderDtoCopyWith(OrderDto value, $Res Function(OrderDto) _then) = _$OrderDtoCopyWithImpl;
@useResult
$Res call({
 String id, int number, String status, String paymentStatus, String customerName, String customerPhone, String? customerCity, String? customerAddress, String? customerNotes, String? shippingZoneName, int shippingCost, String? couponCode, int subtotal, int discount, int total, DateTime? whatsappOpenedAt, String? adminNotes, DateTime createdAt, List<OrderItemDto> items
});




}
/// @nodoc
class _$OrderDtoCopyWithImpl<$Res>
    implements $OrderDtoCopyWith<$Res> {
  _$OrderDtoCopyWithImpl(this._self, this._then);

  final OrderDto _self;
  final $Res Function(OrderDto) _then;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? number = null,Object? status = null,Object? paymentStatus = null,Object? customerName = null,Object? customerPhone = null,Object? customerCity = freezed,Object? customerAddress = freezed,Object? customerNotes = freezed,Object? shippingZoneName = freezed,Object? shippingCost = null,Object? couponCode = freezed,Object? subtotal = null,Object? discount = null,Object? total = null,Object? whatsappOpenedAt = freezed,Object? adminNotes = freezed,Object? createdAt = null,Object? items = null,}) {
  return _then(OrderDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
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
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDto].
extension OrderDtoPatterns on OrderDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int number,  String status,  String paymentStatus,  String customerName,  String customerPhone,  String? customerCity,  String? customerAddress,  String? customerNotes,  String? shippingZoneName,  int shippingCost,  String? couponCode,  int subtotal,  int discount,  int total,  DateTime? whatsappOpenedAt,  String? adminNotes,  DateTime createdAt,  List<OrderItemDto> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
return $default(_that.id,_that.number,_that.status,_that.paymentStatus,_that.customerName,_that.customerPhone,_that.customerCity,_that.customerAddress,_that.customerNotes,_that.shippingZoneName,_that.shippingCost,_that.couponCode,_that.subtotal,_that.discount,_that.total,_that.whatsappOpenedAt,_that.adminNotes,_that.createdAt,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int number,  String status,  String paymentStatus,  String customerName,  String customerPhone,  String? customerCity,  String? customerAddress,  String? customerNotes,  String? shippingZoneName,  int shippingCost,  String? couponCode,  int subtotal,  int discount,  int total,  DateTime? whatsappOpenedAt,  String? adminNotes,  DateTime createdAt,  List<OrderItemDto> items)  $default,) {final _that = this;
switch (_that) {
case _OrderDto():
return $default(_that.id,_that.number,_that.status,_that.paymentStatus,_that.customerName,_that.customerPhone,_that.customerCity,_that.customerAddress,_that.customerNotes,_that.shippingZoneName,_that.shippingCost,_that.couponCode,_that.subtotal,_that.discount,_that.total,_that.whatsappOpenedAt,_that.adminNotes,_that.createdAt,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int number,  String status,  String paymentStatus,  String customerName,  String customerPhone,  String? customerCity,  String? customerAddress,  String? customerNotes,  String? shippingZoneName,  int shippingCost,  String? couponCode,  int subtotal,  int discount,  int total,  DateTime? whatsappOpenedAt,  String? adminNotes,  DateTime createdAt,  List<OrderItemDto> items)?  $default,) {final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
return $default(_that.id,_that.number,_that.status,_that.paymentStatus,_that.customerName,_that.customerPhone,_that.customerCity,_that.customerAddress,_that.customerNotes,_that.shippingZoneName,_that.shippingCost,_that.couponCode,_that.subtotal,_that.discount,_that.total,_that.whatsappOpenedAt,_that.adminNotes,_that.createdAt,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDto implements OrderDto {
  const _OrderDto({required this.id, required this.number, required this.status, required this.paymentStatus, required this.customerName, required this.customerPhone, this.customerCity, this.customerAddress, this.customerNotes, this.shippingZoneName, required this.shippingCost, this.couponCode, required this.subtotal, required this.discount, required this.total, this.whatsappOpenedAt, this.adminNotes, required this.createdAt,  List<OrderItemDto> items = const <OrderItemDto>[]}): _items = items;
  factory _OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

@override final  String id;
@override final  int number;
@override final  String status;
@override final  String paymentStatus;
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
@override final  DateTime? whatsappOpenedAt;
@override final  String? adminNotes;
@override final  DateTime createdAt;
 final  List<OrderItemDto> _items;
@override@JsonKey() List<OrderItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDtoCopyWith<_OrderDto> get copyWith => __$OrderDtoCopyWithImpl<_OrderDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDto&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.customerCity, customerCity) || other.customerCity == customerCity)&&(identical(other.customerAddress, customerAddress) || other.customerAddress == customerAddress)&&(identical(other.customerNotes, customerNotes) || other.customerNotes == customerNotes)&&(identical(other.shippingZoneName, shippingZoneName) || other.shippingZoneName == shippingZoneName)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.couponCode, couponCode) || other.couponCode == couponCode)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.total, total) || other.total == total)&&(identical(other.whatsappOpenedAt, whatsappOpenedAt) || other.whatsappOpenedAt == whatsappOpenedAt)&&(identical(other.adminNotes, adminNotes) || other.adminNotes == adminNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,number,status,paymentStatus,customerName,customerPhone,customerCity,customerAddress,customerNotes,shippingZoneName,shippingCost,couponCode,subtotal,discount,total,whatsappOpenedAt,adminNotes,createdAt,const DeepCollectionEquality().hash(_items)]);
}

@override
String toString() {
    return 'OrderDto(id: $id, number: $number, status: $status, paymentStatus: $paymentStatus, customerName: $customerName, customerPhone: $customerPhone, customerCity: $customerCity, customerAddress: $customerAddress, customerNotes: $customerNotes, shippingZoneName: $shippingZoneName, shippingCost: $shippingCost, couponCode: $couponCode, subtotal: $subtotal, discount: $discount, total: $total, whatsappOpenedAt: $whatsappOpenedAt, adminNotes: $adminNotes, createdAt: $createdAt, items: $items)';
}


}

/// @nodoc
abstract mixin class _$OrderDtoCopyWith<$Res> implements $OrderDtoCopyWith<$Res> {
  factory _$OrderDtoCopyWith(_OrderDto value, $Res Function(_OrderDto) _then) = __$OrderDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, int number, String status, String paymentStatus, String customerName, String customerPhone, String? customerCity, String? customerAddress, String? customerNotes, String? shippingZoneName, int shippingCost, String? couponCode, int subtotal, int discount, int total, DateTime? whatsappOpenedAt, String? adminNotes, DateTime createdAt, List<OrderItemDto> items
});




}
/// @nodoc
class __$OrderDtoCopyWithImpl<$Res>
    implements _$OrderDtoCopyWith<$Res> {
  __$OrderDtoCopyWithImpl(this._self, this._then);

  final _OrderDto _self;
  final $Res Function(_OrderDto) _then;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? number = null,Object? status = null,Object? paymentStatus = null,Object? customerName = null,Object? customerPhone = null,Object? customerCity = freezed,Object? customerAddress = freezed,Object? customerNotes = freezed,Object? shippingZoneName = freezed,Object? shippingCost = null,Object? couponCode = freezed,Object? subtotal = null,Object? discount = null,Object? total = null,Object? whatsappOpenedAt = freezed,Object? adminNotes = freezed,Object? createdAt = null,Object? items = null,}) {
  return _then(_OrderDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
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
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemDto>,
  ));
}


}


/// @nodoc
mixin _$OrderItemDto {

 String get id; String get productName; String get variantLabel; String? get sku; int get unitPrice; int get qty; int get lineTotal;
/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemDtoCopyWith<OrderItemDto> get copyWith => _$OrderItemDtoCopyWithImpl<OrderItemDto>(this as OrderItemDto, _$identity);

  /// Serializes this OrderItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderItemDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.productName, _this.productName) || other.productName == _this.productName)&&(identical(other.variantLabel, _this.variantLabel) || other.variantLabel == _this.variantLabel)&&(identical(other.sku, _this.sku) || other.sku == _this.sku)&&(identical(other.unitPrice, _this.unitPrice) || other.unitPrice == _this.unitPrice)&&(identical(other.qty, _this.qty) || other.qty == _this.qty)&&(identical(other.lineTotal, _this.lineTotal) || other.lineTotal == _this.lineTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderItemDto;
  return Object.hash(runtimeType,_this.id,_this.productName,_this.variantLabel,_this.sku,_this.unitPrice,_this.qty,_this.lineTotal);
}

@override
String toString() {
  final _this = this as OrderItemDto;
  return 'OrderItemDto(id: ${_this.id}, productName: ${_this.productName}, variantLabel: ${_this.variantLabel}, sku: ${_this.sku}, unitPrice: ${_this.unitPrice}, qty: ${_this.qty}, lineTotal: ${_this.lineTotal})';
}


}

/// @nodoc
abstract mixin class $OrderItemDtoCopyWith<$Res>  {
  factory $OrderItemDtoCopyWith(OrderItemDto value, $Res Function(OrderItemDto) _then) = _$OrderItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String productName, String variantLabel, String? sku, int unitPrice, int qty, int lineTotal
});




}
/// @nodoc
class _$OrderItemDtoCopyWithImpl<$Res>
    implements $OrderItemDtoCopyWith<$Res> {
  _$OrderItemDtoCopyWithImpl(this._self, this._then);

  final OrderItemDto _self;
  final $Res Function(OrderItemDto) _then;

/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productName = null,Object? variantLabel = null,Object? sku = freezed,Object? unitPrice = null,Object? qty = null,Object? lineTotal = null,}) {
  return _then(OrderItemDto(
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


/// Adds pattern-matching-related methods to [OrderItemDto].
extension OrderItemDtoPatterns on OrderItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemDto() when $default != null:
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
case _OrderItemDto() when $default != null:
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
case _OrderItemDto():
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
case _OrderItemDto() when $default != null:
return $default(_that.id,_that.productName,_that.variantLabel,_that.sku,_that.unitPrice,_that.qty,_that.lineTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemDto implements OrderItemDto {
  const _OrderItemDto({required this.id, required this.productName, required this.variantLabel, this.sku, required this.unitPrice, required this.qty, required this.lineTotal});
  factory _OrderItemDto.fromJson(Map<String, dynamic> json) => _$OrderItemDtoFromJson(json);

@override final  String id;
@override final  String productName;
@override final  String variantLabel;
@override final  String? sku;
@override final  int unitPrice;
@override final  int qty;
@override final  int lineTotal;

/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemDtoCopyWith<_OrderItemDto> get copyWith => __$OrderItemDtoCopyWithImpl<_OrderItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,productName,variantLabel,sku,unitPrice,qty,lineTotal);
}

@override
String toString() {
    return 'OrderItemDto(id: $id, productName: $productName, variantLabel: $variantLabel, sku: $sku, unitPrice: $unitPrice, qty: $qty, lineTotal: $lineTotal)';
}


}

/// @nodoc
abstract mixin class _$OrderItemDtoCopyWith<$Res> implements $OrderItemDtoCopyWith<$Res> {
  factory _$OrderItemDtoCopyWith(_OrderItemDto value, $Res Function(_OrderItemDto) _then) = __$OrderItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String productName, String variantLabel, String? sku, int unitPrice, int qty, int lineTotal
});




}
/// @nodoc
class __$OrderItemDtoCopyWithImpl<$Res>
    implements _$OrderItemDtoCopyWith<$Res> {
  __$OrderItemDtoCopyWithImpl(this._self, this._then);

  final _OrderItemDto _self;
  final $Res Function(_OrderItemDto) _then;

/// Create a copy of OrderItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productName = null,Object? variantLabel = null,Object? sku = freezed,Object? unitPrice = null,Object? qty = null,Object? lineTotal = null,}) {
  return _then(_OrderItemDto(
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
mixin _$OrderPageDto {

 List<OrderDto> get orders; int get total; int get page; int get pageCount;
/// Create a copy of OrderPageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderPageDtoCopyWith<OrderPageDto> get copyWith => _$OrderPageDtoCopyWithImpl<OrderPageDto>(this as OrderPageDto, _$identity);

  /// Serializes this OrderPageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderPageDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderPageDto&&const DeepCollectionEquality().equals(other.orders, _this.orders)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.pageCount, _this.pageCount) || other.pageCount == _this.pageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderPageDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.orders),_this.total,_this.page,_this.pageCount);
}

@override
String toString() {
  final _this = this as OrderPageDto;
  return 'OrderPageDto(orders: ${_this.orders}, total: ${_this.total}, page: ${_this.page}, pageCount: ${_this.pageCount})';
}


}

/// @nodoc
abstract mixin class $OrderPageDtoCopyWith<$Res>  {
  factory $OrderPageDtoCopyWith(OrderPageDto value, $Res Function(OrderPageDto) _then) = _$OrderPageDtoCopyWithImpl;
@useResult
$Res call({
 List<OrderDto> orders, int total, int page, int pageCount
});




}
/// @nodoc
class _$OrderPageDtoCopyWithImpl<$Res>
    implements $OrderPageDtoCopyWith<$Res> {
  _$OrderPageDtoCopyWithImpl(this._self, this._then);

  final OrderPageDto _self;
  final $Res Function(OrderPageDto) _then;

/// Create a copy of OrderPageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orders = null,Object? total = null,Object? page = null,Object? pageCount = null,}) {
  return _then(OrderPageDto(
orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderPageDto].
extension OrderPageDtoPatterns on OrderPageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderPageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderPageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderPageDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderPageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderPageDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderPageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OrderDto> orders,  int total,  int page,  int pageCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderPageDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OrderDto> orders,  int total,  int page,  int pageCount)  $default,) {final _that = this;
switch (_that) {
case _OrderPageDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OrderDto> orders,  int total,  int page,  int pageCount)?  $default,) {final _that = this;
switch (_that) {
case _OrderPageDto() when $default != null:
return $default(_that.orders,_that.total,_that.page,_that.pageCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderPageDto implements OrderPageDto {
  const _OrderPageDto({required  List<OrderDto> orders, required this.total, required this.page, required this.pageCount}): _orders = orders;
  factory _OrderPageDto.fromJson(Map<String, dynamic> json) => _$OrderPageDtoFromJson(json);

 final  List<OrderDto> _orders;
@override List<OrderDto> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

@override final  int total;
@override final  int page;
@override final  int pageCount;

/// Create a copy of OrderPageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderPageDtoCopyWith<_OrderPageDto> get copyWith => __$OrderPageDtoCopyWithImpl<_OrderPageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderPageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderPageDto&&const DeepCollectionEquality().equals(other.orders, _orders)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders),total,page,pageCount);
}

@override
String toString() {
    return 'OrderPageDto(orders: $orders, total: $total, page: $page, pageCount: $pageCount)';
}


}

/// @nodoc
abstract mixin class _$OrderPageDtoCopyWith<$Res> implements $OrderPageDtoCopyWith<$Res> {
  factory _$OrderPageDtoCopyWith(_OrderPageDto value, $Res Function(_OrderPageDto) _then) = __$OrderPageDtoCopyWithImpl;
@override @useResult
$Res call({
 List<OrderDto> orders, int total, int page, int pageCount
});




}
/// @nodoc
class __$OrderPageDtoCopyWithImpl<$Res>
    implements _$OrderPageDtoCopyWith<$Res> {
  __$OrderPageDtoCopyWithImpl(this._self, this._then);

  final _OrderPageDto _self;
  final $Res Function(_OrderPageDto) _then;

/// Create a copy of OrderPageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orders = null,Object? total = null,Object? page = null,Object? pageCount = null,}) {
  return _then(_OrderPageDto(
orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DashboardDto {

 int get pendingOrders; int get stalePendingOrders; int get monthRevenue; int get monthOrders; List<LowStockDto> get lowStock; int get pendingRestock;
/// Create a copy of DashboardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardDtoCopyWith<DashboardDto> get copyWith => _$DashboardDtoCopyWithImpl<DashboardDto>(this as DashboardDto, _$identity);

  /// Serializes this DashboardDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DashboardDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardDto&&(identical(other.pendingOrders, _this.pendingOrders) || other.pendingOrders == _this.pendingOrders)&&(identical(other.stalePendingOrders, _this.stalePendingOrders) || other.stalePendingOrders == _this.stalePendingOrders)&&(identical(other.monthRevenue, _this.monthRevenue) || other.monthRevenue == _this.monthRevenue)&&(identical(other.monthOrders, _this.monthOrders) || other.monthOrders == _this.monthOrders)&&const DeepCollectionEquality().equals(other.lowStock, _this.lowStock)&&(identical(other.pendingRestock, _this.pendingRestock) || other.pendingRestock == _this.pendingRestock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardDto;
  return Object.hash(runtimeType,_this.pendingOrders,_this.stalePendingOrders,_this.monthRevenue,_this.monthOrders,const DeepCollectionEquality().hash(_this.lowStock),_this.pendingRestock);
}

@override
String toString() {
  final _this = this as DashboardDto;
  return 'DashboardDto(pendingOrders: ${_this.pendingOrders}, stalePendingOrders: ${_this.stalePendingOrders}, monthRevenue: ${_this.monthRevenue}, monthOrders: ${_this.monthOrders}, lowStock: ${_this.lowStock}, pendingRestock: ${_this.pendingRestock})';
}


}

/// @nodoc
abstract mixin class $DashboardDtoCopyWith<$Res>  {
  factory $DashboardDtoCopyWith(DashboardDto value, $Res Function(DashboardDto) _then) = _$DashboardDtoCopyWithImpl;
@useResult
$Res call({
 int pendingOrders, int stalePendingOrders, int monthRevenue, int monthOrders, List<LowStockDto> lowStock, int pendingRestock
});




}
/// @nodoc
class _$DashboardDtoCopyWithImpl<$Res>
    implements $DashboardDtoCopyWith<$Res> {
  _$DashboardDtoCopyWithImpl(this._self, this._then);

  final DashboardDto _self;
  final $Res Function(DashboardDto) _then;

/// Create a copy of DashboardDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pendingOrders = null,Object? stalePendingOrders = null,Object? monthRevenue = null,Object? monthOrders = null,Object? lowStock = null,Object? pendingRestock = null,}) {
  return _then(DashboardDto(
pendingOrders: null == pendingOrders ? _self.pendingOrders : pendingOrders // ignore: cast_nullable_to_non_nullable
as int,stalePendingOrders: null == stalePendingOrders ? _self.stalePendingOrders : stalePendingOrders // ignore: cast_nullable_to_non_nullable
as int,monthRevenue: null == monthRevenue ? _self.monthRevenue : monthRevenue // ignore: cast_nullable_to_non_nullable
as int,monthOrders: null == monthOrders ? _self.monthOrders : monthOrders // ignore: cast_nullable_to_non_nullable
as int,lowStock: null == lowStock ? _self.lowStock : lowStock // ignore: cast_nullable_to_non_nullable
as List<LowStockDto>,pendingRestock: null == pendingRestock ? _self.pendingRestock : pendingRestock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardDto].
extension DashboardDtoPatterns on DashboardDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardDto value)  $default,){
final _that = this;
switch (_that) {
case _DashboardDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardDto value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pendingOrders,  int stalePendingOrders,  int monthRevenue,  int monthOrders,  List<LowStockDto> lowStock,  int pendingRestock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pendingOrders,  int stalePendingOrders,  int monthRevenue,  int monthOrders,  List<LowStockDto> lowStock,  int pendingRestock)  $default,) {final _that = this;
switch (_that) {
case _DashboardDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pendingOrders,  int stalePendingOrders,  int monthRevenue,  int monthOrders,  List<LowStockDto> lowStock,  int pendingRestock)?  $default,) {final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
return $default(_that.pendingOrders,_that.stalePendingOrders,_that.monthRevenue,_that.monthOrders,_that.lowStock,_that.pendingRestock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardDto implements DashboardDto {
  const _DashboardDto({required this.pendingOrders, required this.stalePendingOrders, required this.monthRevenue, required this.monthOrders, required  List<LowStockDto> lowStock, required this.pendingRestock}): _lowStock = lowStock;
  factory _DashboardDto.fromJson(Map<String, dynamic> json) => _$DashboardDtoFromJson(json);

@override final  int pendingOrders;
@override final  int stalePendingOrders;
@override final  int monthRevenue;
@override final  int monthOrders;
 final  List<LowStockDto> _lowStock;
@override List<LowStockDto> get lowStock {
  if (_lowStock is EqualUnmodifiableListView) return _lowStock;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lowStock);
}

@override final  int pendingRestock;

/// Create a copy of DashboardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardDtoCopyWith<_DashboardDto> get copyWith => __$DashboardDtoCopyWithImpl<_DashboardDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardDto&&(identical(other.pendingOrders, pendingOrders) || other.pendingOrders == pendingOrders)&&(identical(other.stalePendingOrders, stalePendingOrders) || other.stalePendingOrders == stalePendingOrders)&&(identical(other.monthRevenue, monthRevenue) || other.monthRevenue == monthRevenue)&&(identical(other.monthOrders, monthOrders) || other.monthOrders == monthOrders)&&const DeepCollectionEquality().equals(other.lowStock, _lowStock)&&(identical(other.pendingRestock, pendingRestock) || other.pendingRestock == pendingRestock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,pendingOrders,stalePendingOrders,monthRevenue,monthOrders,const DeepCollectionEquality().hash(_lowStock),pendingRestock);
}

@override
String toString() {
    return 'DashboardDto(pendingOrders: $pendingOrders, stalePendingOrders: $stalePendingOrders, monthRevenue: $monthRevenue, monthOrders: $monthOrders, lowStock: $lowStock, pendingRestock: $pendingRestock)';
}


}

/// @nodoc
abstract mixin class _$DashboardDtoCopyWith<$Res> implements $DashboardDtoCopyWith<$Res> {
  factory _$DashboardDtoCopyWith(_DashboardDto value, $Res Function(_DashboardDto) _then) = __$DashboardDtoCopyWithImpl;
@override @useResult
$Res call({
 int pendingOrders, int stalePendingOrders, int monthRevenue, int monthOrders, List<LowStockDto> lowStock, int pendingRestock
});




}
/// @nodoc
class __$DashboardDtoCopyWithImpl<$Res>
    implements _$DashboardDtoCopyWith<$Res> {
  __$DashboardDtoCopyWithImpl(this._self, this._then);

  final _DashboardDto _self;
  final $Res Function(_DashboardDto) _then;

/// Create a copy of DashboardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pendingOrders = null,Object? stalePendingOrders = null,Object? monthRevenue = null,Object? monthOrders = null,Object? lowStock = null,Object? pendingRestock = null,}) {
  return _then(_DashboardDto(
pendingOrders: null == pendingOrders ? _self.pendingOrders : pendingOrders // ignore: cast_nullable_to_non_nullable
as int,stalePendingOrders: null == stalePendingOrders ? _self.stalePendingOrders : stalePendingOrders // ignore: cast_nullable_to_non_nullable
as int,monthRevenue: null == monthRevenue ? _self.monthRevenue : monthRevenue // ignore: cast_nullable_to_non_nullable
as int,monthOrders: null == monthOrders ? _self.monthOrders : monthOrders // ignore: cast_nullable_to_non_nullable
as int,lowStock: null == lowStock ? _self._lowStock : lowStock // ignore: cast_nullable_to_non_nullable
as List<LowStockDto>,pendingRestock: null == pendingRestock ? _self.pendingRestock : pendingRestock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$LowStockDto {

 String get variantId; int get stock; String get productName; String get variantLabel;
/// Create a copy of LowStockDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockDtoCopyWith<LowStockDto> get copyWith => _$LowStockDtoCopyWithImpl<LowStockDto>(this as LowStockDto, _$identity);

  /// Serializes this LowStockDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LowStockDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockDto&&(identical(other.variantId, _this.variantId) || other.variantId == _this.variantId)&&(identical(other.stock, _this.stock) || other.stock == _this.stock)&&(identical(other.productName, _this.productName) || other.productName == _this.productName)&&(identical(other.variantLabel, _this.variantLabel) || other.variantLabel == _this.variantLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LowStockDto;
  return Object.hash(runtimeType,_this.variantId,_this.stock,_this.productName,_this.variantLabel);
}

@override
String toString() {
  final _this = this as LowStockDto;
  return 'LowStockDto(variantId: ${_this.variantId}, stock: ${_this.stock}, productName: ${_this.productName}, variantLabel: ${_this.variantLabel})';
}


}

/// @nodoc
abstract mixin class $LowStockDtoCopyWith<$Res>  {
  factory $LowStockDtoCopyWith(LowStockDto value, $Res Function(LowStockDto) _then) = _$LowStockDtoCopyWithImpl;
@useResult
$Res call({
 String variantId, int stock, String productName, String variantLabel
});




}
/// @nodoc
class _$LowStockDtoCopyWithImpl<$Res>
    implements $LowStockDtoCopyWith<$Res> {
  _$LowStockDtoCopyWithImpl(this._self, this._then);

  final LowStockDto _self;
  final $Res Function(LowStockDto) _then;

/// Create a copy of LowStockDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? stock = null,Object? productName = null,Object? variantLabel = null,}) {
  return _then(LowStockDto(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LowStockDto].
extension LowStockDtoPatterns on LowStockDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockDto value)  $default,){
final _that = this;
switch (_that) {
case _LowStockDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockDto value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String variantId,  int stock,  String productName,  String variantLabel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockDto() when $default != null:
return $default(_that.variantId,_that.stock,_that.productName,_that.variantLabel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String variantId,  int stock,  String productName,  String variantLabel)  $default,) {final _that = this;
switch (_that) {
case _LowStockDto():
return $default(_that.variantId,_that.stock,_that.productName,_that.variantLabel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String variantId,  int stock,  String productName,  String variantLabel)?  $default,) {final _that = this;
switch (_that) {
case _LowStockDto() when $default != null:
return $default(_that.variantId,_that.stock,_that.productName,_that.variantLabel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LowStockDto implements LowStockDto {
  const _LowStockDto({required this.variantId, required this.stock, required this.productName, required this.variantLabel});
  factory _LowStockDto.fromJson(Map<String, dynamic> json) => _$LowStockDtoFromJson(json);

@override final  String variantId;
@override final  int stock;
@override final  String productName;
@override final  String variantLabel;

/// Create a copy of LowStockDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockDtoCopyWith<_LowStockDto> get copyWith => __$LowStockDtoCopyWithImpl<_LowStockDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LowStockDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockDto&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,variantId,stock,productName,variantLabel);
}

@override
String toString() {
    return 'LowStockDto(variantId: $variantId, stock: $stock, productName: $productName, variantLabel: $variantLabel)';
}


}

/// @nodoc
abstract mixin class _$LowStockDtoCopyWith<$Res> implements $LowStockDtoCopyWith<$Res> {
  factory _$LowStockDtoCopyWith(_LowStockDto value, $Res Function(_LowStockDto) _then) = __$LowStockDtoCopyWithImpl;
@override @useResult
$Res call({
 String variantId, int stock, String productName, String variantLabel
});




}
/// @nodoc
class __$LowStockDtoCopyWithImpl<$Res>
    implements _$LowStockDtoCopyWith<$Res> {
  __$LowStockDtoCopyWithImpl(this._self, this._then);

  final _LowStockDto _self;
  final $Res Function(_LowStockDto) _then;

/// Create a copy of LowStockDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? stock = null,Object? productName = null,Object? variantLabel = null,}) {
  return _then(_LowStockDto(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
