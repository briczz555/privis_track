import 'dart:typed_data';

import '../entities/stage_document_entity.dart';
import '../repositories/project_tracking_repository.dart';

class UploadStageDocumentUsecase {
  const UploadStageDocumentUsecase(this._repository);

  final ProjectTrackingRepository _repository;

  Future<StageDocumentEntity> call({
    required String projectCode,
    required int stageId,
    required String fileName,
    required Uint8List bytes,
  }) => _repository.uploadDocument(
    projectCode: projectCode,
    stageId: stageId,
    fileName: fileName,
    bytes: bytes,
  );
}
