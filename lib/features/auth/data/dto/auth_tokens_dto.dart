import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_user_dto.dart';

part 'auth_tokens_dto.freezed.dart';
part 'auth_tokens_dto.g.dart';

@freezed
sealed class AuthTokensDto with _$AuthTokensDto {
  const factory AuthTokensDto({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'token_type') @Default('Bearer') String tokenType,
    @JsonKey(name: 'expires_in') @Default(900) int expiresIn,
    required AuthUserDto user,
  }) = _AuthTokensDto;

  factory AuthTokensDto.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensDtoFromJson(json);
}
