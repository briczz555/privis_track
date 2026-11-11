import 'dart:typed_data';

// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/storage/cache_store.dart';
import '../../data/datasources/project_tracking_remote_data_source.dart';
import '../../data/repositories/project_tracking_repository_impl.dart';
import '../../domain/entities/project_tracking_entity.dart';
import '../../domain/entities/stage_document_entity.dart';
import '../../domain/repositories/project_tracking_repository.dart';
import '../../domain/usecases/delete_document_usecase.dart';
import '../../domain/usecases/download_document_usecase.dart';
import '../../domain/usecases/get_project_tracking_usecase.dart';
import '../../domain/usecases/update_project_status_usecase.dart';
import '../../domain/usecases/update_stage_usecase.dart';
import '../../domain/usecases/upload_stage_document_usecase.dart';

part 'project_tracking_provider.g.dart';

@riverpod
ProjectTrackingRepository projectTrackingRepository(Ref ref) {
  return ProjectTrackingRepositoryImpl(
    ProjectTrackingRemoteDataSource(ref.watch(dioProvider)),
    ref.watch(cacheStoreProvider),
  );
}

@riverpod
GetProjectTrackingUsecase getProjectTrackingUsecase(Ref ref) {
  return GetProjectTrackingUsecase(
    ref.watch(projectTrackingRepositoryProvider),
  );
}

@riverpod
UploadStageDocumentUsecase uploadStageDocumentUsecase(Ref ref) {
  return UploadStageDocumentUsecase(
    ref.watch(projectTrackingRepositoryProvider),
  );
}

@riverpod
DownloadDocumentUsecase downloadDocumentUsecase(Ref ref) {
  return DownloadDocumentUsecase(ref.watch(projectTrackingRepositoryProvider));
}

@riverpod
DeleteDocumentUsecase deleteDocumentUsecase(Ref ref) {
  return DeleteDocumentUsecase(ref.watch(projectTrackingRepositoryProvider));
}

@riverpod
UpdateStageUsecase updateStageUsecase(Ref ref) {
  return UpdateStageUsecase(ref.watch(projectTrackingRepositoryProvider));
}

@riverpod
UpdateProjectStatusUsecase updateProjectStatusUsecase(Ref ref) {
  return UpdateProjectStatusUsecase(
    ref.watch(projectTrackingRepositoryProvider),
  );
}

@riverpod
class ProjectTrackingNotifier extends _$ProjectTrackingNotifier {
  @override
  Future<ProjectTrackingEntity> build(String projectCode) {
    return ref.watch(getProjectTrackingUsecaseProvider).call(projectCode);
  }

  Future<void> refresh() async {
    final usecase = ref.read(getProjectTrackingUsecaseProvider);
    final result = await AsyncValue.guard<ProjectTrackingEntity>(
      () => usecase.call(projectCode),
    );
    if (!ref.mounted) return;
    state = result;
  }

  Future<StageDocumentEntity> uploadDocument({
    required int stageId,
    required String fileName,
    required Uint8List bytes,
  }) async {
    final document = await ref
        .read(uploadStageDocumentUsecaseProvider)
        .call(
          projectCode: projectCode,
          stageId: stageId,
          fileName: fileName,
          bytes: bytes,
        );

    if (ref.mounted) {
      final current = state.value;
      if (current != null) {
        state = AsyncData(
          current.addDocument(stageId: stageId, document: document),
        );
      }
    }

    return document;
  }

  Future<Uint8List> downloadDocument(String documentId) {
    return ref.read(downloadDocumentUsecaseProvider).call(documentId);
  }

  Future<void> deleteDocument({
    required int stageId,
    required String documentId,
  }) async {
    await ref.read(deleteDocumentUsecaseProvider).call(documentId);

    if (!ref.mounted) return;
    final current = state.value;
    if (current != null) {
      state = AsyncData(
        current.removeDocument(stageId: stageId, documentId: documentId),
      );
    }
  }

  Future<void> updateStage({
    required int stageId,
    required bool isCompleted,
  }) async {
    await ref
        .read(updateStageUsecaseProvider)
        .call(
          projectCode: projectCode,
          stageId: stageId,
          isCompleted: isCompleted,
        );
    await refresh();
  }

  Future<void> updateProjectStatus(ProjectStatus status) async {
    await ref
        .read(updateProjectStatusUsecaseProvider)
        .call(projectCode: projectCode, status: status);
    await refresh();
  }
}
