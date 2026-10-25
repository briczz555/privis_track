import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_dto.freezed.dart';
part 'project_dto.g.dart';

/// Bentuk mentah proyek sesuai payload API (dummy pada Fase 1).
@freezed
sealed class ProjectDto with _$ProjectDto {
  const factory ProjectDto({
    required String id,
    required String name,
    required String client,
    required String status,
    @JsonKey(name: 'current_stage') required int currentStage,
    @JsonKey(name: 'current_stage_title') required String currentStageTitle,
    @JsonKey(name: 'document_count') @Default(0) int documentCount,
    @JsonKey(name: 'due_date') String? dueDate,
  }) = _ProjectDto;

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);
}
