// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionResponse {

 String get accessToken; String get refreshToken;/// Segundos de validez del access token.
 int get expiresIn; SessionUserDto get user; List<SessionStoreDto> get stores; String? get activeStoreId;
/// Create a copy of SessionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionResponseCopyWith<SessionResponse> get copyWith => _$SessionResponseCopyWithImpl<SessionResponse>(this as SessionResponse, _$identity);

  /// Serializes this SessionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SessionResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionResponse&&(identical(other.accessToken, _this.accessToken) || other.accessToken == _this.accessToken)&&(identical(other.refreshToken, _this.refreshToken) || other.refreshToken == _this.refreshToken)&&(identical(other.expiresIn, _this.expiresIn) || other.expiresIn == _this.expiresIn)&&(identical(other.user, _this.user) || other.user == _this.user)&&const DeepCollectionEquality().equals(other.stores, _this.stores)&&(identical(other.activeStoreId, _this.activeStoreId) || other.activeStoreId == _this.activeStoreId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SessionResponse;
  return Object.hash(runtimeType,_this.accessToken,_this.refreshToken,_this.expiresIn,_this.user,const DeepCollectionEquality().hash(_this.stores),_this.activeStoreId);
}

@override
String toString() {
  final _this = this as SessionResponse;
  return 'SessionResponse(accessToken: ${_this.accessToken}, refreshToken: ${_this.refreshToken}, expiresIn: ${_this.expiresIn}, user: ${_this.user}, stores: ${_this.stores}, activeStoreId: ${_this.activeStoreId})';
}


}

/// @nodoc
abstract mixin class $SessionResponseCopyWith<$Res>  {
  factory $SessionResponseCopyWith(SessionResponse value, $Res Function(SessionResponse) _then) = _$SessionResponseCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken, int expiresIn, SessionUserDto user, List<SessionStoreDto> stores, String? activeStoreId
});


$SessionUserDtoCopyWith<$Res> get user;

}
/// @nodoc
class _$SessionResponseCopyWithImpl<$Res>
    implements $SessionResponseCopyWith<$Res> {
  _$SessionResponseCopyWithImpl(this._self, this._then);

  final SessionResponse _self;
  final $Res Function(SessionResponse) _then;

/// Create a copy of SessionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = null,Object? user = null,Object? stores = null,Object? activeStoreId = freezed,}) {
  return _then(SessionResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as SessionUserDto,stores: null == stores ? _self.stores : stores // ignore: cast_nullable_to_non_nullable
as List<SessionStoreDto>,activeStoreId: freezed == activeStoreId ? _self.activeStoreId : activeStoreId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SessionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionUserDtoCopyWith<$Res> get user {
  
  return $SessionUserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionResponse].
extension SessionResponsePatterns on SessionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionResponse value)  $default,){
final _that = this;
switch (_that) {
case _SessionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SessionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  int expiresIn,  SessionUserDto user,  List<SessionStoreDto> stores,  String? activeStoreId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.user,_that.stores,_that.activeStoreId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  int expiresIn,  SessionUserDto user,  List<SessionStoreDto> stores,  String? activeStoreId)  $default,) {final _that = this;
switch (_that) {
case _SessionResponse():
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.user,_that.stores,_that.activeStoreId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken,  int expiresIn,  SessionUserDto user,  List<SessionStoreDto> stores,  String? activeStoreId)?  $default,) {final _that = this;
switch (_that) {
case _SessionResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.user,_that.stores,_that.activeStoreId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionResponse implements SessionResponse {
  const _SessionResponse({required this.accessToken, required this.refreshToken, required this.expiresIn, required this.user, required  List<SessionStoreDto> stores, this.activeStoreId}): _stores = stores;
  factory _SessionResponse.fromJson(Map<String, dynamic> json) => _$SessionResponseFromJson(json);

@override final  String accessToken;
@override final  String refreshToken;
/// Segundos de validez del access token.
@override final  int expiresIn;
@override final  SessionUserDto user;
 final  List<SessionStoreDto> _stores;
@override List<SessionStoreDto> get stores {
  if (_stores is EqualUnmodifiableListView) return _stores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stores);
}

@override final  String? activeStoreId;

/// Create a copy of SessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionResponseCopyWith<_SessionResponse> get copyWith => __$SessionResponseCopyWithImpl<_SessionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.stores, _stores)&&(identical(other.activeStoreId, activeStoreId) || other.activeStoreId == activeStoreId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,accessToken,refreshToken,expiresIn,user,const DeepCollectionEquality().hash(_stores),activeStoreId);
}

@override
String toString() {
    return 'SessionResponse(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, user: $user, stores: $stores, activeStoreId: $activeStoreId)';
}


}

/// @nodoc
abstract mixin class _$SessionResponseCopyWith<$Res> implements $SessionResponseCopyWith<$Res> {
  factory _$SessionResponseCopyWith(_SessionResponse value, $Res Function(_SessionResponse) _then) = __$SessionResponseCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken, int expiresIn, SessionUserDto user, List<SessionStoreDto> stores, String? activeStoreId
});


@override $SessionUserDtoCopyWith<$Res> get user;

}
/// @nodoc
class __$SessionResponseCopyWithImpl<$Res>
    implements _$SessionResponseCopyWith<$Res> {
  __$SessionResponseCopyWithImpl(this._self, this._then);

  final _SessionResponse _self;
  final $Res Function(_SessionResponse) _then;

/// Create a copy of SessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = null,Object? user = null,Object? stores = null,Object? activeStoreId = freezed,}) {
  return _then(_SessionResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as SessionUserDto,stores: null == stores ? _self._stores : stores // ignore: cast_nullable_to_non_nullable
as List<SessionStoreDto>,activeStoreId: freezed == activeStoreId ? _self.activeStoreId : activeStoreId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SessionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionUserDtoCopyWith<$Res> get user {
  
  return $SessionUserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$SessionUserDto {

 String get id; String get email; String? get fullName;
/// Create a copy of SessionUserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionUserDtoCopyWith<SessionUserDto> get copyWith => _$SessionUserDtoCopyWithImpl<SessionUserDto>(this as SessionUserDto, _$identity);

  /// Serializes this SessionUserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SessionUserDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionUserDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SessionUserDto;
  return Object.hash(runtimeType,_this.id,_this.email,_this.fullName);
}

@override
String toString() {
  final _this = this as SessionUserDto;
  return 'SessionUserDto(id: ${_this.id}, email: ${_this.email}, fullName: ${_this.fullName})';
}


}

/// @nodoc
abstract mixin class $SessionUserDtoCopyWith<$Res>  {
  factory $SessionUserDtoCopyWith(SessionUserDto value, $Res Function(SessionUserDto) _then) = _$SessionUserDtoCopyWithImpl;
@useResult
$Res call({
 String id, String email, String? fullName
});




}
/// @nodoc
class _$SessionUserDtoCopyWithImpl<$Res>
    implements $SessionUserDtoCopyWith<$Res> {
  _$SessionUserDtoCopyWithImpl(this._self, this._then);

  final SessionUserDto _self;
  final $Res Function(SessionUserDto) _then;

/// Create a copy of SessionUserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? fullName = freezed,}) {
  return _then(SessionUserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionUserDto].
extension SessionUserDtoPatterns on SessionUserDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionUserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionUserDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionUserDto value)  $default,){
final _that = this;
switch (_that) {
case _SessionUserDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionUserDto value)?  $default,){
final _that = this;
switch (_that) {
case _SessionUserDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String? fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionUserDto() when $default != null:
return $default(_that.id,_that.email,_that.fullName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String? fullName)  $default,) {final _that = this;
switch (_that) {
case _SessionUserDto():
return $default(_that.id,_that.email,_that.fullName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String? fullName)?  $default,) {final _that = this;
switch (_that) {
case _SessionUserDto() when $default != null:
return $default(_that.id,_that.email,_that.fullName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionUserDto implements SessionUserDto {
  const _SessionUserDto({required this.id, required this.email, this.fullName});
  factory _SessionUserDto.fromJson(Map<String, dynamic> json) => _$SessionUserDtoFromJson(json);

@override final  String id;
@override final  String email;
@override final  String? fullName;

/// Create a copy of SessionUserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionUserDtoCopyWith<_SessionUserDto> get copyWith => __$SessionUserDtoCopyWithImpl<_SessionUserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionUserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionUserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,email,fullName);
}

@override
String toString() {
    return 'SessionUserDto(id: $id, email: $email, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$SessionUserDtoCopyWith<$Res> implements $SessionUserDtoCopyWith<$Res> {
  factory _$SessionUserDtoCopyWith(_SessionUserDto value, $Res Function(_SessionUserDto) _then) = __$SessionUserDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String? fullName
});




}
/// @nodoc
class __$SessionUserDtoCopyWithImpl<$Res>
    implements _$SessionUserDtoCopyWith<$Res> {
  __$SessionUserDtoCopyWithImpl(this._self, this._then);

  final _SessionUserDto _self;
  final $Res Function(_SessionUserDto) _then;

/// Create a copy of SessionUserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? fullName = freezed,}) {
  return _then(_SessionUserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SessionStoreDto {

 String get id; String get name; String get slug;/// `OWNER` o `STAFF`.
 String get role;
/// Create a copy of SessionStoreDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionStoreDtoCopyWith<SessionStoreDto> get copyWith => _$SessionStoreDtoCopyWithImpl<SessionStoreDto>(this as SessionStoreDto, _$identity);

  /// Serializes this SessionStoreDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SessionStoreDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionStoreDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.role, _this.role) || other.role == _this.role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SessionStoreDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.slug,_this.role);
}

@override
String toString() {
  final _this = this as SessionStoreDto;
  return 'SessionStoreDto(id: ${_this.id}, name: ${_this.name}, slug: ${_this.slug}, role: ${_this.role})';
}


}

/// @nodoc
abstract mixin class $SessionStoreDtoCopyWith<$Res>  {
  factory $SessionStoreDtoCopyWith(SessionStoreDto value, $Res Function(SessionStoreDto) _then) = _$SessionStoreDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String role
});




}
/// @nodoc
class _$SessionStoreDtoCopyWithImpl<$Res>
    implements $SessionStoreDtoCopyWith<$Res> {
  _$SessionStoreDtoCopyWithImpl(this._self, this._then);

  final SessionStoreDto _self;
  final $Res Function(SessionStoreDto) _then;

/// Create a copy of SessionStoreDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? role = null,}) {
  return _then(SessionStoreDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionStoreDto].
extension SessionStoreDtoPatterns on SessionStoreDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionStoreDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionStoreDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionStoreDto value)  $default,){
final _that = this;
switch (_that) {
case _SessionStoreDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionStoreDto value)?  $default,){
final _that = this;
switch (_that) {
case _SessionStoreDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionStoreDto() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String role)  $default,) {final _that = this;
switch (_that) {
case _SessionStoreDto():
return $default(_that.id,_that.name,_that.slug,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String role)?  $default,) {final _that = this;
switch (_that) {
case _SessionStoreDto() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionStoreDto implements SessionStoreDto {
  const _SessionStoreDto({required this.id, required this.name, required this.slug, required this.role});
  factory _SessionStoreDto.fromJson(Map<String, dynamic> json) => _$SessionStoreDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
/// `OWNER` o `STAFF`.
@override final  String role;

/// Create a copy of SessionStoreDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionStoreDtoCopyWith<_SessionStoreDto> get copyWith => __$SessionStoreDtoCopyWithImpl<_SessionStoreDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionStoreDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionStoreDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,slug,role);
}

@override
String toString() {
    return 'SessionStoreDto(id: $id, name: $name, slug: $slug, role: $role)';
}


}

/// @nodoc
abstract mixin class _$SessionStoreDtoCopyWith<$Res> implements $SessionStoreDtoCopyWith<$Res> {
  factory _$SessionStoreDtoCopyWith(_SessionStoreDto value, $Res Function(_SessionStoreDto) _then) = __$SessionStoreDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String role
});




}
/// @nodoc
class __$SessionStoreDtoCopyWithImpl<$Res>
    implements _$SessionStoreDtoCopyWith<$Res> {
  __$SessionStoreDtoCopyWithImpl(this._self, this._then);

  final _SessionStoreDto _self;
  final $Res Function(_SessionStoreDto) _then;

/// Create a copy of SessionStoreDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? role = null,}) {
  return _then(_SessionStoreDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
