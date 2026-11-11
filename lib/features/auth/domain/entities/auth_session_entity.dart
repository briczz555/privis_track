import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_user_entity.dart';

part 'auth_session_entity.freezed.dart';

@freezed
sealed class AuthSessionEntity with _$AuthSessionEntity {
  const factory AuthSessionEntity({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
    required AuthUserEntity user,
  }) = _AuthSessionEntity;
}
