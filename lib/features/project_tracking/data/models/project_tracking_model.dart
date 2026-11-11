import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/project_status.dart';
import '../../domain/entities/project_tracking_entity.dart';
import '../dto/project_tracking_dto.dart';
import 'client_info_model.dart';
import 'project_stage_model.dart';

part 'project_tracking_model.freezed.dart';

@freezed
sealed class ProjectTrackingModel with _$ProjectTrackingModel {
  const ProjectTrackingModel._();

  const factory ProjectTrackingModel({
    required String id,
    required String code,
    required String name,
    required ClientInfoModel client,
    required ProjectStatus status,
    required int currentStage,
    required int completedStages,
    required int progressPercent,
    required List<ProjectStageModel> stages,
    required DateTime updatedAt,
  }) = _ProjectTrackingModel;

  factory ProjectTrackingModel.fromDto(ProjectTrackingDto dto) =>
      ProjectTrackingModel(
        id: dto.id,
        code: dto.code,
        name: dto.name,
        client: ClientInfoModel.fromDto(dto.client),
        status: projectStatusFromApi(dto.status),
        currentStage: dto.currentStage,
        completedStages: dto.completedStages,
        progressPercent: dto.progressPercent,
        stages: dto.stages
            .map(ProjectStageModel.fromDto)
            .toList(growable: false),
        updatedAt: DateTime.parse(dto.updatedAt),
      );

  ProjectTrackingEntity toEntity() => ProjectTrackingEntity(
    id: id,
    code: code,
    name: name,
    client: client.toEntity(),
    status: status,
    currentStage: currentStage,
    completedStages: completedStages,
    progressPercent: progressPercent,
    stages: stages.map((stage) => stage.toEntity()).toList(growable: false),
    updatedAt: updatedAt,
  );
}
