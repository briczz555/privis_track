import 'dart:typed_data';

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
  Future<ProjectTrackingEntity> getProject(String projectCode) async {
    try {
      final payload = await _remote.fetchProject(projectCode);
      return ProjectTrackingModel.fromDto(ProjectTrackingDto.fromJson(payload))
          .toEntity();
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<StageDocumentEntity> uploadDocument({
    required String projectCode,
    required int stageId,
    required String fileName,
    required Uint8List bytes,
  }) async {
    try {
      final payload = await _remote.uploadDocument(
        projectCode: projectCode,
        stageId: stageId,
        fileName: fileName,
        bytes: bytes,
      );
      return StageDocumentModel.fromDto(StageDocumentDto.fromJson(payload))
          .toEntity();
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<Uint8List> downloadDocument(String documentId) async {
    try {
      return await _remote.downloadDocument(documentId);
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }
}
