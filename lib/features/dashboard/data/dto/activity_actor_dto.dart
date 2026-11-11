import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_actor_dto.freezed.dart';
part 'activity_actor_dto.g.dart';

@freezed
sealed class ActivityActorDto with _$ActivityActorDto {
  const factory ActivityActorDto({
    required String id,
    required String name,
    String? division,
  }) = _ActivityActorDto;

  factory ActivityActorDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityActorDtoFromJson(json);
}
