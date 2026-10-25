import 'package:freezed_annotation/freezed_annotation.dart';

import 'activity_dto.dart';
import 'project_dto.dart';

part 'dashboard_dto.freezed.dart';
part 'dashboard_dto.g.dart';

@freezed
sealed class DashboardDto with _$DashboardDto {
  const factory DashboardDto({
    required List<ProjectDto> projects,
    required List<ActivityDto> activities,
  }) = _DashboardDto;

  factory DashboardDto.fromJson(Map<String, dynamic> json) =>
      _$DashboardDtoFromJson(json);
}
