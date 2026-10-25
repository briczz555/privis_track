import 'package:freezed_annotation/freezed_annotation.dart';

import 'project_stage_dto.dart';

part 'project_tracking_dto.freezed.dart';
part 'project_tracking_dto.g.dart';

@freezed
sealed class ProjectTrackingDto with _$ProjectTrackingDto {
  const factory ProjectTrackingDto({
    required String id,
    required String name,
    required String client,
    required String status,
    @JsonKey(name: 'current_stage') required int currentStage,
    required List<ProjectStageDto> stages,
  }) = _ProjectTrackingDto;

  factory ProjectTrackingDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTrackingDtoFromJson(json);
}
