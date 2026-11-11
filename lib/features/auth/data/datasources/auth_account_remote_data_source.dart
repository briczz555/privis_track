import 'package:dio/dio.dart';

abstract interface class IAuthAccountRemoteDataSource {
  Future<Map<String, dynamic>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}

/// Endpoint akun yang butuh Bearer token (memakai Dio dengan AuthInterceptor).
class AuthAccountRemoteDataSource implements IAuthAccountRemoteDataSource {
  AuthAccountRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<Map<String, dynamic>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      'auth/change-password',
      data: {'current_password': currentPassword, 'new_password': newPassword},
    );
    return response.data ?? const {};
  }
}
