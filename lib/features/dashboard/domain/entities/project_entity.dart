import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/constants/sdlc_stages.dart';

part 'project_entity.freezed.dart';

@freezed
sealed class ProjectEntity with _$ProjectEntity {
  const ProjectEntity._();

  const factory ProjectEntity({
    required String id,
    required String name,
    required String client,
    required ProjectStatus status,
    required int currentStage,
    required String currentStageTitle,
    required int documentCount,
    DateTime? dueDate,
  }) = _ProjectEntity;

  /// Jumlah tahap SDLC yang dipakai PriVis Track.
  static const int totalStages = kSdlcStageCount;

  double get progress {
    if (currentStage <= 0) return 0;
    if (currentStage >= totalStages) return 1;
    return currentStage / totalStages;
  }

  int get progressPercent => (progress * 100).round();

  bool get isActive => status == ProjectStatus.inProgress;
}
