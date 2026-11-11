import 'package:dio/dio.dart';

import '../../../../core/constants/project_status.dart';

abstract interface class IDashboardRemoteDataSource {
  Future<Map<String, dynamic>> fetchDashboard();

  Future<Map<String, dynamic>> fetchProjects({
    int page = 1,
    int limit = 100,
    ProjectStatus? status,
    String? search,
  });
}

class DashboardRemoteDataSource implements IDashboardRemoteDataSource {
  DashboardRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<Map<String, dynamic>> fetchDashboard() async {
    final response = await _dio.get<Map<String, dynamic>>('dashboard');
    return response.data ?? const {};
  }

  @override
  Future<Map<String, dynamic>> fetchProjects({
    int page = 1,
    int limit = 100,
    ProjectStatus? status,
    String? search,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'projects',
      queryParameters: {
        'page': page,
        'limit': limit,
        if (status != null) 'status': projectStatusToApi(status),
        if (search != null && search.trim().isNotEmpty) 'search': search.trim(),
      },
    );
    return response.data ?? const {};
  }
}
