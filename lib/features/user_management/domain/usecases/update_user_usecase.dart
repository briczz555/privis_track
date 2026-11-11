import '../../../auth/domain/entities/auth_role.dart';
import '../entities/managed_user_entity.dart';
import '../repositories/user_management_repository.dart';

class UpdateUserUsecase {
  const UpdateUserUsecase(this._repository);

  final UserManagementRepository _repository;

  Future<ManagedUserEntity> call({
    required String id,
    required String name,
    required AuthRole role,
    String? division,
    required bool isActive,
  }) => _repository.updateUser(
    id: id,
    name: name,
    role: role,
    division: division,
    isActive: isActive,
  );
}
