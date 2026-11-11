import 'package:freezed_annotation/freezed_annotation.dart';

import 'activity_actor_dto.dart';
import 'activity_project_dto.dart';

part 'activity_dto.freezed.dart';
part 'activity_dto.g.dart';

@freezed
sealed class ActivityDto with _$ActivityDto {
  const factory ActivityDto({
    required String id,
    required String type,
    required ActivityActorDto actor,
    required String action,
    required String target,
    required ActivityProjectDto project,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _ActivityDto;

  factory ActivityDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityDtoFromJson(json);
}
