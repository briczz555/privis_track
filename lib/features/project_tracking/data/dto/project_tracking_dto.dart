import 'package:freezed_annotation/freezed_annotation.dart';

import 'client_info_dto.dart';
import 'project_stage_dto.dart';

part 'project_tracking_dto.freezed.dart';
part 'project_tracking_dto.g.dart';

@freezed
sealed class ProjectTrackingDto with _$ProjectTrackingDto {
  const factory ProjectTrackingDto({
    required String id,
    required String code,
    required String name,
    required ClientInfoDto client,
    required String status,
    @JsonKey(name: 'current_stage') required int currentStage,
    @JsonKey(name: 'current_stage_title') required String currentStageTitle,
    @JsonKey(name: 'completed_stages') required int completedStages,
    @JsonKey(name: 'progress_percent') required int progressPercent,
    required List<ProjectStageDto> stages,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'due_date') String? dueDate,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _ProjectTrackingDto;

  factory ProjectTrackingDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTrackingDtoFromJson(json);
}
