import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_dto.freezed.dart';
part 'activity_dto.g.dart';

/// Bentuk mentah log aktivitas tim sesuai payload API (dummy pada Fase 1).
@freezed
sealed class ActivityDto with _$ActivityDto {
  const factory ActivityDto({
    required String id,
    required String actor,
    required String division,
    required String action,
    required String target,
    @JsonKey(name: 'project_name') required String projectName,
    @JsonKey(name: 'occurred_at') required String occurredAt,
  }) = _ActivityDto;

  factory ActivityDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityDtoFromJson(json);
}
