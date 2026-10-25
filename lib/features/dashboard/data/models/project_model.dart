import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/project_status.dart';
import '../../domain/entities/project_entity.dart';
import '../dto/project_dto.dart';

part 'project_model.freezed.dart';

@freezed
sealed class ProjectModel with _$ProjectModel {
  const ProjectModel._();

  const factory ProjectModel({
    required String id,
    required String name,
    required String client,
    required ProjectStatus status,
    required int currentStage,
    required String currentStageTitle,
    required int documentCount,
    DateTime? dueDate,
  }) = _ProjectModel;

  factory ProjectModel.fromDto(ProjectDto dto) => ProjectModel(
    id: dto.id,
    name: dto.name,
    client: dto.client,
    status: _statusFromApi(dto.status),
    currentStage: dto.currentStage,
    currentStageTitle: dto.currentStageTitle,
    documentCount: dto.documentCount,
    dueDate: switch (dto.dueDate) {
      final String raw => DateTime.tryParse(raw),
      _ => null,
    },
  );

  ProjectEntity toEntity() => ProjectEntity(
    id: id,
    name: name,
    client: client,
    status: status,
    currentStage: currentStage,
    currentStageTitle: currentStageTitle,
    documentCount: documentCount,
    dueDate: dueDate,
  );
}

ProjectStatus _statusFromApi(String value) => switch (value.toLowerCase()) {
  'not started' => ProjectStatus.notStarted,
  'on hold' => ProjectStatus.onHold,
  'completed' => ProjectStatus.completed,
  _ => ProjectStatus.inProgress,
};
