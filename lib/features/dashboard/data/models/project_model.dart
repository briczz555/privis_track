import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/project_entity.dart';
import '../../../../core/constants/project_status.dart';
import '../dto/project_summary_dto.dart';

part 'project_model.freezed.dart';

@freezed
sealed class ProjectModel with _$ProjectModel {
  const ProjectModel._();

  const factory ProjectModel({
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
  }) = _ProjectModel;

  factory ProjectModel.fromDto(ProjectSummaryDto dto) => ProjectModel(
    id: dto.id,
    code: dto.code,
    name: dto.name,
    client: dto.client.name,
    status: projectStatusFromApi(dto.status),
    currentStage: dto.currentStage,
    currentStageTitle: dto.currentStageTitle,
    completedStages: dto.completedStages,
    progressPercent: dto.progressPercent,
    documentCount: dto.documentCount,
    dueDate: switch (dto.dueDate) {
      final String raw => DateTime.tryParse(raw),
      _ => null,
    },
    updatedAt: DateTime.parse(dto.updatedAt),
  );

  ProjectEntity toEntity() => ProjectEntity(
    id: id,
    code: code,
    name: name,
    client: client,
    status: status,
    currentStage: currentStage,
    currentStageTitle: currentStageTitle,
    completedStages: completedStages,
    progressPercent: progressPercent,
    documentCount: documentCount,
    dueDate: dueDate,
    updatedAt: updatedAt,
  );
}
