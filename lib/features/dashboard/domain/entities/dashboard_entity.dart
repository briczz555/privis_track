import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/project_status.dart';
import 'activity_entity.dart';
import 'project_entity.dart';

part 'dashboard_entity.freezed.dart';

@freezed
sealed class DashboardEntity with _$DashboardEntity {
  const DashboardEntity._();

  const factory DashboardEntity({
    required List<ProjectEntity> projects,
    required List<ActivityEntity> activities,
  }) = _DashboardEntity;

  int get totalProjects => projects.length;

  /// Proyek yang sedang berjalan, dipakai untuk daftar "Proyek Berjalan".
  List<ProjectEntity> get activeProjects => projects
      .where((project) => project.status == ProjectStatus.inProgress)
      .toList(growable: false);

  /// Proporsi proyek per status untuk donut chart portfolio.
  Map<ProjectStatus, int> get portfolioByStatus {
    final counts = <ProjectStatus, int>{};
    for (final status in ProjectStatus.values) {
      final count = projects
          .where((project) => project.status == status)
          .length;
      if (count > 0) counts[status] = count;
    }
    return counts;
  }
}
