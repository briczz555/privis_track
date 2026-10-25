import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/sdlc_stages.dart';
import '../../../../core/constants/project_status.dart';
import 'project_stage_entity.dart';
import 'stage_document_entity.dart';

part 'project_tracking_entity.freezed.dart';

/// Detail proyek untuk timeline 8 tahap SDLC + document vault.
@freezed
sealed class ProjectTrackingEntity with _$ProjectTrackingEntity {
  const ProjectTrackingEntity._();

  const factory ProjectTrackingEntity({
    required String id,
    required String name,
    required String client,
    required ProjectStatus status,
    required int currentStage,
    required List<ProjectStageEntity> stages,
  }) = _ProjectTrackingEntity;

  static const int totalStages = kSdlcStageCount;

  double get progress {
    if (currentStage <= 0) return 0;
    if (currentStage >= totalStages) return 1;
    return currentStage / totalStages;
  }

  int get progressPercent => (progress * 100).round();

  int get totalDocuments =>
      stages.fold(0, (total, stage) => total + stage.documentCount);

  ProjectStageEntity? stageById(int stageId) {
    for (final stage in stages) {
      if (stage.id == stageId) return stage;
    }
    return null;
  }

  bool isCurrentStage(ProjectStageEntity stage) =>
      stage.id == currentStage && !stage.isCompleted;

  /// Dipakai setelah mock upload untuk menambahkan dokumen ke tahap terkait
  /// tanpa perlu memuat ulang seluruh proyek.
  ProjectTrackingEntity addDocument({
    required int stageId,
    required StageDocumentEntity document,
  }) {
    return copyWith(
      stages: [
        for (final stage in stages)
          stage.id == stageId
              ? stage.copyWith(documents: [...stage.documents, document])
              : stage,
      ],
    );
  }
}
