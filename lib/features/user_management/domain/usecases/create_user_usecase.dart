import '../../../auth/domain/entities/auth_role.dart';
import '../entities/managed_user_entity.dart';
import '../repositories/user_management_repository.dart';

class CreateUserUsecase {
  const CreateUserUsecase(this._repository);

  final UserManagementRepository _repository;

  Future<ManagedUserEntity> call({
    required String name,
    required String email,
    required String password,
    required AuthRole role,
    String? division,
  }) => _repository.createUser(
    name: name,
    email: email,
    password: password,
    role: role,
    division: division,
  );
}
