// Wajib import eksplisit agar `Ref` tidak bergantung pada re-export
// riverpod_annotation (aturan Riverpod di PRD bagian 5.3).
// ignore: unnecessary_import
import 'dart:typed_data';

// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasources/project_tracking_remote_data_source.dart';
import '../../data/repositories/project_tracking_repository_impl.dart';
import '../../domain/entities/project_tracking_entity.dart';
import '../../domain/entities/stage_document_entity.dart';
import '../../domain/repositories/project_tracking_repository.dart';
import '../../domain/usecases/download_document_usecase.dart';
import '../../domain/usecases/get_project_tracking_usecase.dart';
import '../../domain/usecases/upload_stage_document_usecase.dart';

part 'project_tracking_provider.g.dart';

@riverpod
ProjectTrackingRepository projectTrackingRepository(Ref ref) {
  return ProjectTrackingRepositoryImpl(
    ProjectTrackingRemoteDataSource(ref.watch(dioProvider)),
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
}
