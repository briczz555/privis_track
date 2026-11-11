import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/auth_session_entity.dart';
import '../dto/auth_tokens_dto.dart';
import 'auth_user_model.dart';

part 'auth_session_model.freezed.dart';
part 'auth_session_model.g.dart';

@freezed
sealed class AuthSessionModel with _$AuthSessionModel {
  const AuthSessionModel._();

  const factory AuthSessionModel({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'token_type') @Default('Bearer') String tokenType,
    @JsonKey(name: 'expires_in') @Default(900) int expiresIn,
    @JsonKey(name: 'expires_at') required DateTime expiresAt,
    required AuthUserModel user,
  }) = _AuthSessionModel;

  factory AuthSessionModel.fromDto(AuthTokensDto dto) => AuthSessionModel(
    accessToken: dto.accessToken,
    refreshToken: dto.refreshToken,
    tokenType: dto.tokenType,
    expiresIn: dto.expiresIn,
    expiresAt: DateTime.now().add(Duration(seconds: dto.expiresIn)),
    user: AuthUserModel.fromDto(dto.user),
  );

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);

  AuthSessionEntity toEntity() => AuthSessionEntity(
    accessToken: accessToken,
    refreshToken: refreshToken,
    expiresAt: expiresAt,
    user: user.toEntity(),
  );
}
