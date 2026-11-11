// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../auth/domain/entities/auth_role.dart';
import '../../data/datasources/user_management_remote_data_source.dart';
import '../../data/repositories/user_management_repository_impl.dart';
import '../../domain/entities/managed_user_entity.dart';
import '../../domain/repositories/user_management_repository.dart';
import '../../domain/usecases/create_user_usecase.dart';
import '../../domain/usecases/get_users_usecase.dart';
import '../../domain/usecases/reset_user_password_usecase.dart';
import '../../domain/usecases/update_user_usecase.dart';

part 'user_management_provider.g.dart';

@riverpod
UserManagementRepository userManagementRepository(Ref ref) {
  return UserManagementRepositoryImpl(
    UserManagementRemoteDataSource(ref.watch(dioProvider)),
  );
}

@riverpod
GetUsersUsecase getUsersUsecase(Ref ref) {
  return GetUsersUsecase(ref.watch(userManagementRepositoryProvider));
}

@riverpod
CreateUserUsecase createUserUsecase(Ref ref) {
  return CreateUserUsecase(ref.watch(userManagementRepositoryProvider));
}

@riverpod
UpdateUserUsecase updateUserUsecase(Ref ref) {
  return UpdateUserUsecase(ref.watch(userManagementRepositoryProvider));
}

@riverpod
ResetUserPasswordUsecase resetUserPasswordUsecase(Ref ref) {
  return ResetUserPasswordUsecase(ref.watch(userManagementRepositoryProvider));
}

@riverpod
class UserManagementNotifier extends _$UserManagementNotifier {
  @override
  Future<List<ManagedUserEntity>> build() {
    return ref.watch(getUsersUsecaseProvider).call();
  }

  Future<void> refresh() async {
    final result = await AsyncValue.guard<List<ManagedUserEntity>>(
      () => ref.read(getUsersUsecaseProvider).call(),
    );
    if (!ref.mounted) return;
    state = result;
  }

  Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required AuthRole role,
    String? division,
  }) async {
    await ref
        .read(createUserUsecaseProvider)
        .call(
          name: name,
          email: email,
          password: password,
          role: role,
          division: division,
        );
    await refresh();
  }

  Future<void> updateUser({
    required String id,
    required String name,
    required AuthRole role,
    String? division,
    required bool isActive,
  }) async {
    await ref
        .read(updateUserUsecaseProvider)
        .call(
          id: id,
          name: name,
          role: role,
          division: division,
          isActive: isActive,
        );
    await refresh();
  }

  Future<void> resetPassword({
    required String id,
    required String newPassword,
  }) async {
    await ref
        .read(resetUserPasswordUsecaseProvider)
        .call(id: id, newPassword: newPassword);
  }
}
