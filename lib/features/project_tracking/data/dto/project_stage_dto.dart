import 'package:freezed_annotation/freezed_annotation.dart';

import 'stage_document_dto.dart';

part 'project_stage_dto.freezed.dart';
part 'project_stage_dto.g.dart';

@freezed
sealed class ProjectStageDto with _$ProjectStageDto {
  const factory ProjectStageDto({
    @JsonKey(name: 'stage_no') required int stageNo,
    required String title,
    @JsonKey(name: 'is_completed') required bool isCompleted,
    @JsonKey(name: 'completed_at') String? completedAt,
    @Default(<StageDocumentDto>[]) List<StageDocumentDto> documents,
  }) = _ProjectStageDto;

  factory ProjectStageDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectStageDtoFromJson(json);
}
