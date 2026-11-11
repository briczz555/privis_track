import 'package:dio/dio.dart';

import '../../../../core/network/exceptions/network_exception.dart';
import '../../../auth/domain/entities/auth_role.dart';
import '../../domain/entities/managed_user_entity.dart';
import '../../domain/repositories/user_management_repository.dart';
import '../datasources/user_management_remote_data_source.dart';
import '../dto/managed_user_dto.dart';
import '../models/managed_user_model.dart';

class UserManagementRepositoryImpl implements UserManagementRepository {
  UserManagementRepositoryImpl(this._remote);

  final IUserManagementRemoteDataSource _remote;

  @override
  Future<List<ManagedUserEntity>> getUsers() async {
    try {
      final payload = await _remote.fetchUsers();
      return payload
          .map(
            (json) =>
                ManagedUserModel.fromDto(ManagedUserDto.fromJson(json))
                    .toEntity(),
          )
          .toList(growable: false);
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<ManagedUserEntity> createUser({
    required String name,
    required String email,
    required String password,
    required AuthRole role,
    String? division,
  }) async {
    try {
      final payload = await _remote.createUser(
        name: name,
        email: email,
        password: password,
        role: role,
        division: division,
      );
      return ManagedUserModel.fromDto(ManagedUserDto.fromJson(payload))
          .toEntity();
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<ManagedUserEntity> updateUser({
    required String id,
    required String name,
    required AuthRole role,
    String? division,
    required bool isActive,
  }) async {
    try {
      final payload = await _remote.updateUser(
        id: id,
        name: name,
        role: role,
        division: division,
        isActive: isActive,
      );
      return ManagedUserModel.fromDto(ManagedUserDto.fromJson(payload))
          .toEntity();
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<void> resetPassword({
    required String id,
    required String newPassword,
  }) async {
    try {
      await _remote.resetPassword(id: id, newPassword: newPassword);
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }
}
