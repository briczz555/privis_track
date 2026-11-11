import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/project_status.dart';
import 'activity_entity.dart';
import 'portfolio_slice_entity.dart';
import 'project_entity.dart';

part 'dashboard_entity.freezed.dart';

@freezed
sealed class DashboardEntity with _$DashboardEntity {
  const DashboardEntity._();

  const factory DashboardEntity({
    required DateTime generatedAt,
    required int totalProjects,
    required List<PortfolioSliceEntity> portfolio,
    required List<ProjectEntity> activeProjects,
    required List<ActivityEntity> activities,
    @Default(false) bool isFromCache,
    DateTime? cachedAt,
  }) = _DashboardEntity;

  Map<ProjectStatus, int> get portfolioByStatus => {
    for (final slice in portfolio) slice.status: slice.count,
  };
}
