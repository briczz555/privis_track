import 'package:dio/dio.dart';

import '../../../auth/domain/entities/auth_role.dart';

abstract interface class IUserManagementRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchUsers();

  Future<Map<String, dynamic>> createUser({
    required String name,
    required String email,
    required String password,
    required AuthRole role,
    String? division,
  });

  Future<Map<String, dynamic>> updateUser({
    required String id,
    required String name,
    required AuthRole role,
    String? division,
    required bool isActive,
  });

  Future<void> resetPassword({required String id, required String newPassword});
}

class UserManagementRemoteDataSource
    implements IUserManagementRemoteDataSource {
  UserManagementRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final response = await _dio.get<Map<String, dynamic>>('users');
    final data = response.data?['data'];

    if (data is! List) return const [];
    return data
        .whereType<Map>()
        .map((item) => Map<String, dynamic>.from(item))
        .toList(growable: false);
  }

  @override
  Future<Map<String, dynamic>> createUser({
    required String name,
    required String email,
    required String password,
    required AuthRole role,
    String? division,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      'users',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'role': _roleToApi(role),
        if (division != null && division.trim().isNotEmpty)
          'division': division.trim(),
      },
    );
    return response.data ?? const {};
  }

  @override
  Future<Map<String, dynamic>> updateUser({
    required String id,
    required String name,
    required AuthRole role,
    String? division,
    required bool isActive,
  }) async {
    final trimmedDivision = division?.trim();
    final response = await _dio.patch<Map<String, dynamic>>(
      'users/$id',
      data: {
        'name': name,
        'role': _roleToApi(role),
        'division': (trimmedDivision == null || trimmedDivision.isEmpty)
            ? null
            : trimmedDivision,
        'is_active': isActive,
      },
    );
    return response.data ?? const {};
  }

  @override
  Future<void> resetPassword({
    required String id,
    required String newPassword,
  }) async {
    await _dio.post<void>(
      'users/$id/reset-password',
      data: {'new_password': newPassword},
    );
  }
}

String _roleToApi(AuthRole role) => switch (role) {
  AuthRole.admin => 'admin',
  AuthRole.pm => 'pm',
  AuthRole.developer => 'developer',
  AuthRole.qa => 'qa',
  AuthRole.finance => 'finance',
  AuthRole.unknown => throw ArgumentError('Role tidak valid.'),
};
