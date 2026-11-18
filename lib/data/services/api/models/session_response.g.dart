// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) =>
    _SessionResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
      user: SessionUserDto.fromJson(json['user'] as Map<String, dynamic>),
      stores: (json['stores'] as List<dynamic>)
          .map((e) => SessionStoreDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      activeStoreId: json['activeStoreId'] as String?,
    );

Map<String, dynamic> _$SessionResponseToJson(_SessionResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'user': instance.user,
      'stores': instance.stores,
      'activeStoreId': instance.activeStoreId,
    };

_SessionUserDto _$SessionUserDtoFromJson(Map<String, dynamic> json) =>
    _SessionUserDto(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String?,
    );

Map<String, dynamic> _$SessionUserDtoToJson(_SessionUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
    };

_SessionStoreDto _$SessionStoreDtoFromJson(Map<String, dynamic> json) =>
    _SessionStoreDto(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$SessionStoreDtoToJson(_SessionStoreDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'role': instance.role,
    };
