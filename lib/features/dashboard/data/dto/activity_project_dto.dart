import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_project_dto.freezed.dart';
part 'activity_project_dto.g.dart';

@freezed
sealed class ActivityProjectDto with _$ActivityProjectDto {
  const factory ActivityProjectDto({
    required String id,
    required String code,
    required String name,
  }) = _ActivityProjectDto;

  factory ActivityProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityProjectDtoFromJson(json);
}
