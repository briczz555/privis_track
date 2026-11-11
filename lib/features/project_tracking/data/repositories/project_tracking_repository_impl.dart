import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/network/exceptions/network_exception.dart';
import '../../../../core/storage/cache_store.dart';
import '../../domain/entities/project_tracking_entity.dart';
import '../../domain/entities/stage_document_entity.dart';
import '../../domain/repositories/project_tracking_repository.dart';
import '../datasources/project_tracking_remote_data_source.dart';
import '../dto/project_tracking_dto.dart';
import '../dto/stage_document_dto.dart';
import '../models/project_tracking_model.dart';
import '../models/stage_document_model.dart';

class ProjectTrackingRepositoryImpl implements ProjectTrackingRepository {
  ProjectTrackingRepositoryImpl(this._remote, this._cache);

  final IProjectTrackingRemoteDataSource _remote;
  final SnapshotCache _cache;

  @override
  Future<ProjectTrackingEntity> getProject(String projectCode) async {
    final cacheKey = 'project:$projectCode';

    try {
      final payload = await _remote.fetchProject(projectCode);
      final entity = ProjectTrackingModel.fromDto(
        ProjectTrackingDto.fromJson(payload),
      ).toEntity();
      await _writeCache(cacheKey, payload);
      return entity;
    } on DioException catch (error) {
      final mapped = mapDioException(error);
      if (isOfflineFailure(mapped)) {
        final cached = await _readCache(cacheKey);
        if (cached != null) {
          return ProjectTrackingModel.fromDto(
            ProjectTrackingDto.fromJson(decodeCachedPayload(cached.payload)),
          ).toEntity().copyWith(isFromCache: true, cachedAt: cached.updatedAt);
        }
      }
      throw mapped;
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  Future<void> _writeCache(String key, Map<String, dynamic> payload) async {
    try {
      await _cache.write(key: key, payload: jsonEncode(payload));
    } catch (_) {
      // Cache best-effort; jangan gagalkan request online.
    }
  }

  Future<CachedSnapshot?> _readCache(String key) async {
    try {
      return await _cache.read(key);
    } catch (_) {
      return null;
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

  @override
  Future<void> deleteDocument(String documentId) async {
    try {
      await _remote.deleteDocument(documentId);
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }

  @override
  Future<void> updateStage({
    required String projectCode,
    required int stageId,
    required bool isCompleted,
  }) async {
    try {
      await _remote.updateStage(
        projectCode: projectCode,
        stageId: stageId,
        isCompleted: isCompleted,
      );
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }

  @override
  Future<void> updateProjectStatus({
    required String projectCode,
    required ProjectStatus status,
  }) async {
    try {
      await _remote.updateProjectStatus(
        projectCode: projectCode,
        status: status,
      );
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }
}
