import 'package:freezed_annotation/freezed_annotation.dart';

import 'activity_dto.dart';
import 'portfolio_slice_dto.dart';
import 'project_summary_dto.dart';

part 'dashboard_dto.freezed.dart';
part 'dashboard_dto.g.dart';

@freezed
sealed class DashboardDto with _$DashboardDto {
  const factory DashboardDto({
    @JsonKey(name: 'generated_at') required String generatedAt,
    @JsonKey(name: 'total_projects') required int totalProjects,
    required List<PortfolioSliceDto> portfolio,
    @JsonKey(name: 'active_projects')
    required List<ProjectSummaryDto> activeProjects,
    required List<ActivityDto> activities,
  }) = _DashboardDto;

  factory DashboardDto.fromJson(Map<String, dynamic> json) =>
      _$DashboardDtoFromJson(json);
}
