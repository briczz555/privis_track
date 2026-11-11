import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/constants/sdlc_stages.dart';
import 'client_info_entity.dart';
import 'project_stage_entity.dart';

part 'project_tracking_entity.freezed.dart';

/// Detail proyek untuk timeline 8 tahap SDLC + document vault.
@freezed
sealed class ProjectTrackingEntity with _$ProjectTrackingEntity {
  const ProjectTrackingEntity._();

  const factory ProjectTrackingEntity({
    required String id,
    required String code,
    required String name,
    required ClientInfoEntity client,
    required ProjectStatus status,
    required int currentStage,
    required int completedStages,
    required int progressPercent,
    required List<ProjectStageEntity> stages,
    required DateTime updatedAt,
  }) = _ProjectTrackingEntity;

  static const int totalStages = kSdlcStageCount;

  double get progress => (progressPercent / 100).clamp(0, 1).toDouble();

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
}
