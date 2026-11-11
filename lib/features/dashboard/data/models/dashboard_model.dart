import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/dashboard_entity.dart';
import '../dto/dashboard_dto.dart';
import 'activity_model.dart';
import 'portfolio_slice_model.dart';
import 'project_model.dart';

part 'dashboard_model.freezed.dart';

@freezed
sealed class DashboardModel with _$DashboardModel {
  const DashboardModel._();

  const factory DashboardModel({
    required DateTime generatedAt,
    required int totalProjects,
    required List<PortfolioSliceModel> portfolio,
    required List<ProjectModel> activeProjects,
    required List<ActivityModel> activities,
  }) = _DashboardModel;

  factory DashboardModel.fromDto(DashboardDto dto) => DashboardModel(
    generatedAt: DateTime.parse(dto.generatedAt),
    totalProjects: dto.totalProjects,
    portfolio: dto.portfolio
        .map(PortfolioSliceModel.fromDto)
        .toList(growable: false),
    activeProjects: dto.activeProjects
        .map(ProjectModel.fromDto)
        .toList(growable: false),
    activities: dto.activities
        .map(ActivityModel.fromDto)
        .toList(growable: false),
  );

  DashboardEntity toEntity() => DashboardEntity(
    generatedAt: generatedAt,
    totalProjects: totalProjects,
    portfolio: portfolio
        .map((slice) => slice.toEntity())
        .toList(growable: false),
    activeProjects: activeProjects
        .map((project) => project.toEntity())
        .toList(growable: false),
    activities: activities
        .map((activity) => activity.toEntity())
        .toList(growable: false),
  );
}
