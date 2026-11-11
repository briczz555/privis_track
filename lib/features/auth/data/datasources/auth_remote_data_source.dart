import 'package:dio/dio.dart';

abstract interface class IAuthRemoteDataSource {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> refresh(String refreshToken);

  Future<void> logout(String refreshToken);
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  AuthRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      'auth/login',
      data: {'email': email, 'password': password},
    );
    return response.data ?? const {};
  }

  @override
  Future<Map<String, dynamic>> refresh(String refreshToken) async {
    final response = await _dio.post<Map<String, dynamic>>(
      'auth/refresh',
      data: {'refresh_token': refreshToken},
    );
    return response.data ?? const {};
  }

  @override
  Future<void> logout(String refreshToken) async {
    await _dio.post<void>('auth/logout', data: {'refresh_token': refreshToken});
  }
}
