import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/auth_role.dart';
import '../../domain/entities/managed_user_entity.dart';
import '../dto/managed_user_dto.dart';

part 'managed_user_model.freezed.dart';
part 'managed_user_model.g.dart';

@freezed
sealed class ManagedUserModel with _$ManagedUserModel {
  const ManagedUserModel._();

  const factory ManagedUserModel({
    required String id,
    required String name,
    required String email,
    required String role,
    String? division,
    required bool isActive,
    required DateTime createdAt,
  }) = _ManagedUserModel;

  factory ManagedUserModel.fromDto(ManagedUserDto dto) => ManagedUserModel(
    id: dto.id,
    name: dto.name,
    email: dto.email,
    role: dto.role,
    division: dto.division,
    isActive: dto.isActive,
    createdAt: dto.createdAt,
  );

  factory ManagedUserModel.fromJson(Map<String, dynamic> json) =>
      _$ManagedUserModelFromJson(json);

  ManagedUserEntity toEntity() => ManagedUserEntity(
    id: id,
    name: name,
    email: email,
    role: _roleFromApi(role),
    division: division,
    isActive: isActive,
    createdAt: createdAt,
  );
}

AuthRole _roleFromApi(String value) => switch (value.toLowerCase()) {
  'admin' => AuthRole.admin,
  'pm' => AuthRole.pm,
  'developer' => AuthRole.developer,
  'qa' => AuthRole.qa,
  'finance' => AuthRole.finance,
  _ => AuthRole.unknown,
};
