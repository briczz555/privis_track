import 'package:freezed_annotation/freezed_annotation.dart';

import 'client_summary_dto.dart';

part 'project_summary_dto.freezed.dart';
part 'project_summary_dto.g.dart';

@freezed
sealed class ProjectSummaryDto with _$ProjectSummaryDto {
  const factory ProjectSummaryDto({
    required String id,
    required String code,
    required String name,
    required ClientSummaryDto client,
    required String status,
    @JsonKey(name: 'current_stage') required int currentStage,
    @JsonKey(name: 'current_stage_title') required String currentStageTitle,
    @JsonKey(name: 'completed_stages') required int completedStages,
    @JsonKey(name: 'progress_percent') required int progressPercent,
    @JsonKey(name: 'document_count') required int documentCount,
    @JsonKey(name: 'due_date') String? dueDate,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _ProjectSummaryDto;

  factory ProjectSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummaryDtoFromJson(json);
}
