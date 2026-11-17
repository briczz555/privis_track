import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_project_ref_entity.freezed.dart';

@freezed
sealed class MeetingProjectRefEntity with _$MeetingProjectRefEntity {
  const factory MeetingProjectRefEntity({
    required String id,
    required String code,
    required String name,
  }) = _MeetingProjectRefEntity;
}
