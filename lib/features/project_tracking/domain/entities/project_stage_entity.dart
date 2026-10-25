import 'package:freezed_annotation/freezed_annotation.dart';

import 'stage_document_entity.dart';

part 'project_stage_entity.freezed.dart';

/// Satu tahap SDLC beserta dokumen arsipnya.
@freezed
sealed class ProjectStageEntity with _$ProjectStageEntity {
  const ProjectStageEntity._();

  const factory ProjectStageEntity({
    required int id,
    required String title,
    required bool isCompleted,
    DateTime? completedAt,
    @Default(<StageDocumentEntity>[]) List<StageDocumentEntity> documents,
  }) = _ProjectStageEntity;

  int get documentCount => documents.length;
}
