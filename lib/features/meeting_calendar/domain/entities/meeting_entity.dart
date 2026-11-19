import 'package:freezed_annotation/freezed_annotation.dart';

import 'meeting_client_ref_entity.dart';
import 'meeting_mode.dart';
import 'meeting_mom_entity.dart';
import 'meeting_participant_entity.dart';
import 'meeting_project_ref_entity.dart';
import 'meeting_status.dart';

part 'meeting_entity.freezed.dart';

@freezed
sealed class MeetingEntity with _$MeetingEntity {
  const MeetingEntity._();

  const factory MeetingEntity({
    required String id,
    required String title,
    String? agenda,
    required MeetingMode mode,
    required MeetingStatus status,
    required DateTime startAt,
    required DateTime endAt,
    String? meetingUrl,
    String? location,
    MeetingProjectRefEntity? project,
    MeetingClientRefEntity? client,
    required MeetingParticipantEntity organizer,
    required List<MeetingParticipantEntity> participants,
    String? notes,
    MeetingMomEntity? mom,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MeetingEntity;

  bool get isCancelled => status == MeetingStatus.cancelled;

  bool get isOnline => mode == MeetingMode.online;
}
