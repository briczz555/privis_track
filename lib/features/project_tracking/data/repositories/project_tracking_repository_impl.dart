import 'package:dio/dio.dart';

import '../../../../core/network/exceptions/network_exception.dart';
import '../../domain/entities/project_tracking_entity.dart';
import '../../domain/entities/stage_document_entity.dart';
import '../../domain/repositories/project_tracking_repository.dart';
import '../datasources/project_tracking_remote_data_source.dart';
import '../dto/project_tracking_dto.dart';
import '../dto/stage_document_dto.dart';
import '../models/project_tracking_model.dart';
import '../models/stage_document_model.dart';

class ProjectTrackingRepositoryImpl implements ProjectTrackingRepository {
  ProjectTrackingRepositoryImpl(this._remote);

  final IProjectTrackingRemoteDataSource _remote;

  @override
  Future<ProjectTrackingEntity> getProject(String projectId) async {
    try {
      final payload = await _remote.fetchProject(projectId);
      return ProjectTrackingModel.fromDto(ProjectTrackingDto.fromJson(payload))
          .toEntity();
    } on DioException catch (error) {
      // Fase 1 belum memakai HTTP, tapi jalur error sudah disiapkan supaya
      // Fase 2 tinggal mengganti isi data source tanpa menyentuh layer ini.
      throw mapDioException(error);
    }
  }

  @override
  Future<StageDocumentEntity> uploadDocument({
    required String projectId,
    required int stageId,
    required String fileName,
  }) async {
    try {
      final payload = await _remote.uploadDocument(
        projectId: projectId,
        stageId: stageId,
        fileName: fileName,
      );
      return StageDocumentModel.fromDto(StageDocumentDto.fromJson(payload))
          .toEntity();
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }
}
