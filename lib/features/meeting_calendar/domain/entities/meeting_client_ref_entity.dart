import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_client_ref_entity.freezed.dart';

@freezed
sealed class MeetingClientRefEntity with _$MeetingClientRefEntity {
  const factory MeetingClientRefEntity({
    required String id,
    required String name,
  }) = _MeetingClientRefEntity;
}
