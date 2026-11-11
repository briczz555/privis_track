import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/auth_role.dart';

part 'managed_user_entity.freezed.dart';

/// User internal yang dikelola admin (daftar, status, role, divisi).
@freezed
sealed class ManagedUserEntity with _$ManagedUserEntity {
  const factory ManagedUserEntity({
    required String id,
    required String name,
    required String email,
    required AuthRole role,
    String? division,
    required bool isActive,
    required DateTime createdAt,
  }) = _ManagedUserEntity;
}
