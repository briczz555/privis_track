import '../entities/managed_user_entity.dart';
import '../repositories/user_management_repository.dart';

class GetUsersUsecase {
  const GetUsersUsecase(this._repository);

  final UserManagementRepository _repository;

  Future<List<ManagedUserEntity>> call() => _repository.getUsers();
}
