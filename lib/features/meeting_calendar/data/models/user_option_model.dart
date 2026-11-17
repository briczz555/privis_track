import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/auth_role.dart';
import '../../domain/entities/user_option_entity.dart';
import '../dto/user_option_dto.dart';

part 'user_option_model.freezed.dart';

@freezed
sealed class UserOptionModel with _$UserOptionModel {
  const UserOptionModel._();

  const factory UserOptionModel({
    required String id,
    required String name,
    required String role,
    String? division,
  }) = _UserOptionModel;

  factory UserOptionModel.fromDto(UserOptionDto dto) => UserOptionModel(
    id: dto.id,
    name: dto.name,
    role: dto.role,
    division: dto.division,
  );

  UserOptionEntity toEntity() => UserOptionEntity(
    id: id,
    name: name,
    role: _roleFromApi(role),
    division: division,
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
