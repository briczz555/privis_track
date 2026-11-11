import '../../../auth/domain/entities/auth_role.dart';
import '../entities/managed_user_entity.dart';

abstract interface class UserManagementRepository {
  Future<List<ManagedUserEntity>> getUsers();

  Future<ManagedUserEntity> createUser({
    required String name,
    required String email,
    required String password,
    required AuthRole role,
    String? division,
  });

  Future<ManagedUserEntity> updateUser({
    required String id,
    required String name,
    required AuthRole role,
    String? division,
    required bool isActive,
  });

  Future<void> resetPassword({required String id, required String newPassword});
}
