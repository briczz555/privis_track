import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/auth_role.dart';

part 'user_option_entity.freezed.dart';

@freezed
sealed class UserOptionEntity with _$UserOptionEntity {
  const factory UserOptionEntity({
    required String id,
    required String name,
    required AuthRole role,
    String? division,
  }) = _UserOptionEntity;
}
