import 'package:freezed_annotation/freezed_annotation.dart';

import 'meeting_mode.dart';

part 'meeting_input_entity.freezed.dart';

/// Data yang dikirim saat membuat/mengubah meeting.
@freezed
sealed class MeetingInputEntity with _$MeetingInputEntity {
  const factory MeetingInputEntity({
    required String title,
    String? agenda,
    required MeetingMode mode,
    required DateTime startAt,
    required DateTime endAt,
    String? meetingUrl,
    String? location,
    String? projectCode,
    required List<String> participantIds,
    String? notes,
  }) = _MeetingInputEntity;
}
