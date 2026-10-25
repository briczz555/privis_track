import '../entities/project_tracking_entity.dart';
import '../entities/stage_document_entity.dart';

abstract interface class ProjectTrackingRepository {
  Future<ProjectTrackingEntity> getProject(String projectId);

  Future<StageDocumentEntity> uploadDocument({
    required String projectId,
    required int stageId,
    required String fileName,
  });
}
