import 'dart:typed_data';

import '../../../../core/constants/project_status.dart';
import '../entities/project_tracking_entity.dart';
import '../entities/stage_document_entity.dart';

abstract interface class ProjectTrackingRepository {
  Future<ProjectTrackingEntity> getProject(String projectCode);

  Future<StageDocumentEntity> uploadDocument({
    required String projectCode,
    required int stageId,
    required String fileName,
    required Uint8List bytes,
  });

  Future<Uint8List> downloadDocument(String documentId);

  Future<void> deleteDocument(String documentId);

  /// Menyiapkan cache detail proyek untuk akses offline. Best-effort: tidak
  /// melempar error dan melewati proyek yang snapshot-nya masih segar.
  Future<void> prefetchProjects(List<String> projectCodes);

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
