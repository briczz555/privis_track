import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/project_status.dart';
import '../../domain/entities/project_tracking_entity.dart';
import '../dto/project_tracking_dto.dart';
import 'project_stage_model.dart';

part 'project_tracking_model.freezed.dart';

@freezed
sealed class ProjectTrackingModel with _$ProjectTrackingModel {
  const ProjectTrackingModel._();

  const factory ProjectTrackingModel({
    required String id,
    required String name,
    required String client,
    required ProjectStatus status,
    required int currentStage,
    required List<ProjectStageModel> stages,
  }) = _ProjectTrackingModel;

  factory ProjectTrackingModel.fromDto(ProjectTrackingDto dto) =>
      ProjectTrackingModel(
        id: dto.id,
        name: dto.name,
        client: dto.client,
        status: _statusFromApi(dto.status),
        currentStage: dto.currentStage,
        stages: dto.stages
            .map(ProjectStageModel.fromDto)
            .toList(growable: false),
      );

  ProjectTrackingEntity toEntity() => ProjectTrackingEntity(
    id: id,
    name: name,
    client: client,
    status: status,
    currentStage: currentStage,
    stages: stages.map((stage) => stage.toEntity()).toList(growable: false),
  );
}

ProjectStatus _statusFromApi(String value) => switch (value.toLowerCase()) {
  'not started' => ProjectStatus.notStarted,
  'on hold' => ProjectStatus.onHold,
  'completed' => ProjectStatus.completed,
  _ => ProjectStatus.inProgress,
};
