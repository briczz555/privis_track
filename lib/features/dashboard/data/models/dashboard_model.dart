import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/dashboard_entity.dart';
import '../dto/dashboard_dto.dart';
import 'activity_model.dart';
import 'project_model.dart';

part 'dashboard_model.freezed.dart';

@freezed
sealed class DashboardModel with _$DashboardModel {
  const DashboardModel._();

  const factory DashboardModel({
    required List<ProjectModel> projects,
    required List<ActivityModel> activities,
  }) = _DashboardModel;

  factory DashboardModel.fromDto(DashboardDto dto) => DashboardModel(
    projects: dto.projects.map(ProjectModel.fromDto).toList(growable: false),
    activities: dto.activities
        .map(ActivityModel.fromDto)
        .toList(growable: false),
  );

  DashboardEntity toEntity() => DashboardEntity(
    projects: projects
        .map((project) => project.toEntity())
        .toList(growable: false),
    activities: activities
        .map((activity) => activity.toEntity())
        .toList(growable: false),
  );
}
