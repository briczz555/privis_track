import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/auth_role.dart';
import '../../domain/entities/auth_user_entity.dart';
import '../dto/auth_user_dto.dart';

part 'auth_user_model.freezed.dart';
part 'auth_user_model.g.dart';

@freezed
sealed class AuthUserModel with _$AuthUserModel {
  const AuthUserModel._();

  const factory AuthUserModel({
    required String id,
    required String name,
    required String email,
    required String role,
    String? division,
  }) = _AuthUserModel;

  factory AuthUserModel.fromDto(AuthUserDto dto) => AuthUserModel(
    id: dto.id,
    name: dto.name,
    email: dto.email,
    role: dto.role,
    division: dto.division,
  );

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);

  AuthUserEntity toEntity() => AuthUserEntity(
    id: id,
    name: name,
    email: email,
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
