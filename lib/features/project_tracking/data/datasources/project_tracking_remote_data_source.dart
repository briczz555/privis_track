import 'package:dio/dio.dart';

abstract interface class IProjectTrackingRemoteDataSource {
  Future<Map<String, dynamic>> fetchProject(String projectCode);
}

class ProjectTrackingRemoteDataSource
    implements IProjectTrackingRemoteDataSource {
  ProjectTrackingRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<Map<String, dynamic>> fetchProject(String projectCode) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'projects/$projectCode',
    );
    return response.data ?? const {};
  }
}
