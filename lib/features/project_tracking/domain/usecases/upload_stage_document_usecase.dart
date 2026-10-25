import '../entities/stage_document_entity.dart';
import '../repositories/project_tracking_repository.dart';

class UploadStageDocumentUsecase {
  const UploadStageDocumentUsecase(this._repository);

  final ProjectTrackingRepository _repository;

  Future<StageDocumentEntity> call({
    required String projectId,
    required int stageId,
    required String fileName,
  }) => _repository.uploadDocument(
    projectId: projectId,
    stageId: stageId,
    fileName: fileName,
  );
}
