import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_response.freezed.dart';
part 'session_response.g.dart';

/// Lo que devuelven `/auth/login`, `/auth/refresh` y `/auth/switch-store`.
///
/// Es la forma de `SessionResponseDto` en
/// `ecommerce-api/src/shared/dtos/auth/session-response.dto.ts`. Solo la
/// conoce la capa de datos: el repositorio la traduce a `Session`.
@freezed
abstract class SessionResponse with _$SessionResponse {
  const factory SessionResponse({
    required String accessToken,
    required String refreshToken,

    /// Segundos de validez del access token.
    required int expiresIn,
    required SessionUserDto user,
    required List<SessionStoreDto> stores,
    String? activeStoreId,
  }) = _SessionResponse;

  factory SessionResponse.fromJson(Map<String, Object?> json) =>
      _$SessionResponseFromJson(json);
}

@freezed
abstract class SessionUserDto with _$SessionUserDto {
  const factory SessionUserDto({
    required String id,
    required String email,
    String? fullName,
  }) = _SessionUserDto;

  factory SessionUserDto.fromJson(Map<String, Object?> json) =>
      _$SessionUserDtoFromJson(json);
}

@freezed
abstract class SessionStoreDto with _$SessionStoreDto {
  const factory SessionStoreDto({
    required String id,
    required String name,
    required String slug,

    /// `OWNER` o `STAFF`.
    required String role,
  }) = _SessionStoreDto;

  factory SessionStoreDto.fromJson(Map<String, Object?> json) =>
      _$SessionStoreDtoFromJson(json);
}
