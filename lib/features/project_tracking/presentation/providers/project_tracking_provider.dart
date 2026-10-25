// Wajib import eksplisit agar `Ref` tidak bergantung pada re-export
// riverpod_annotation (aturan Riverpod di PRD bagian 5.3).
// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/project_tracking_remote_data_source.dart';
import '../../data/repositories/project_tracking_repository_impl.dart';
import '../../domain/entities/project_tracking_entity.dart';
import '../../domain/entities/stage_document_entity.dart';
import '../../domain/repositories/project_tracking_repository.dart';
import '../../domain/usecases/get_project_tracking_usecase.dart';
import '../../domain/usecases/upload_stage_document_usecase.dart';

part 'project_tracking_provider.g.dart';

/// Composition root fitur: satu instance repository dipakai bersama oleh
/// semua usecase. Fase 2 cukup menyisipkan `ref.watch(dioProvider)` di sini.
@riverpod
ProjectTrackingRepository projectTrackingRepository(Ref ref) {
  return ProjectTrackingRepositoryImpl(const ProjectTrackingRemoteDataSource());
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
class ProjectTrackingNotifier extends _$ProjectTrackingNotifier {
  @override
  Future<ProjectTrackingEntity> build(String projectId) {
    return ref.watch(getProjectTrackingUsecaseProvider).call(projectId);
  }

  /// Mock upload: menambahkan dokumen hasil "upload" ke tahap terkait tanpa
  /// memuat ulang seluruh timeline.
  Future<StageDocumentEntity> uploadDocument({required int stageId}) async {
    final stage = state.value?.stageById(stageId);
    final fileName = 'Lampiran ${(stage?.documentCount ?? 0) + 1}.pdf';

    final document = await ref
        .read(uploadStageDocumentUsecaseProvider)
        .call(projectId: projectId, stageId: stageId, fileName: fileName);

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
}
