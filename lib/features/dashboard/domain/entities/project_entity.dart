import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/constants/sdlc_stages.dart';

part 'project_entity.freezed.dart';

@freezed
sealed class ProjectEntity with _$ProjectEntity {
  const ProjectEntity._();

  const factory ProjectEntity({
    required String id,
    required String code,
    required String name,
    required String client,
    required ProjectStatus status,
    required int currentStage,
    required String currentStageTitle,
    required int completedStages,
    required int progressPercent,
    required int documentCount,
    DateTime? dueDate,
    required DateTime updatedAt,
  }) = _ProjectEntity;

  static const int totalStages = kSdlcStageCount;

  double get progress => (progressPercent / 100).clamp(0, 1).toDouble();

  bool get isActive => status == ProjectStatus.inProgress;
}
