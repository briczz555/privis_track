import 'dart:typed_data';

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
}
