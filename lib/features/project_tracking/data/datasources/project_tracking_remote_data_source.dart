import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../../../core/constants/project_status.dart';

abstract interface class IProjectTrackingRemoteDataSource {
  Future<Map<String, dynamic>> fetchProject(String projectCode);

  Future<Map<String, dynamic>> uploadDocument({
    required String projectCode,
    required int stageId,
    required String fileName,
    required Uint8List bytes,
  });

  Future<Uint8List> downloadDocument(String documentId);

  Future<void> updateStage({
    required String projectCode,
    required int stageId,
    required bool isCompleted,
  });

  Future<void> updateProjectStatus({
    required String projectCode,
    required ProjectStatus status,
  });
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

  @override
  Future<Map<String, dynamic>> uploadDocument({
    required String projectCode,
    required int stageId,
    required String fileName,
    required Uint8List bytes,
  }) async {
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        bytes,
        filename: fileName,
        contentType: _contentTypeFor(fileName),
      ),
      'name': fileName,
    });

    final response = await _dio.post<Map<String, dynamic>>(
      'projects/$projectCode/stages/$stageId/documents',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return response.data ?? const {};
  }

  @override
  Future<Uint8List> downloadDocument(String documentId) async {
    final response = await _dio.get<List<int>>(
      'documents/$documentId/download',
      options: Options(responseType: ResponseType.bytes),
    );

    return Uint8List.fromList(response.data ?? const []);
  }

  @override
  Future<void> updateStage({
    required String projectCode,
    required int stageId,
    required bool isCompleted,
  }) async {
    await _dio.patch<void>(
      'projects/$projectCode/stages/$stageId',
      data: {'is_completed': isCompleted},
    );
  }

  @override
  Future<void> updateProjectStatus({
    required String projectCode,
    required ProjectStatus status,
  }) async {
    await _dio.patch<void>(
      'projects/$projectCode',
      data: {'status': projectStatusToApi(status)},
    );
  }
}

DioMediaType _contentTypeFor(String fileName) {
  final extension = fileName.split('.').last.toLowerCase();

  return switch (extension) {
    'pdf' => DioMediaType('application', 'pdf'),
    'doc' => DioMediaType('application', 'msword'),
    'docx' => DioMediaType(
      'application',
      'vnd.openxmlformats-officedocument.wordprocessingml.document',
    ),
    'xls' => DioMediaType('application', 'vnd.ms-excel'),
    'xlsx' => DioMediaType(
      'application',
      'vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    ),
    'csv' => DioMediaType('text', 'csv'),
    'png' => DioMediaType('image', 'png'),
    'jpg' || 'jpeg' => DioMediaType('image', 'jpeg'),
    _ => DioMediaType('application', 'octet-stream'),
  };
}
