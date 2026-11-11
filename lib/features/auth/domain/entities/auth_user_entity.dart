import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_role.dart';

part 'auth_user_entity.freezed.dart';

@freezed
sealed class AuthUserEntity with _$AuthUserEntity {
  const factory AuthUserEntity({
    required String id,
    required String name,
    required String email,
    required AuthRole role,
    String? division,
  }) = _AuthUserEntity;
}
