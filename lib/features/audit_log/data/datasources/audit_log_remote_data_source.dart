import 'package:dio/dio.dart';

abstract interface class IAuditLogRemoteDataSource {
  Future<Map<String, dynamic>> fetchAuditLogs({
    required int page,
    required int limit,
  });
}

class AuditLogRemoteDataSource implements IAuditLogRemoteDataSource {
  AuditLogRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<Map<String, dynamic>> fetchAuditLogs({
    required int page,
    required int limit,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'audit-logs',
      queryParameters: {'page': page, 'limit': limit},
    );
    return response.data ?? const {};
  }
}
