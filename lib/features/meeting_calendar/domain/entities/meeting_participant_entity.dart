import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/auth_role.dart';

part 'meeting_participant_entity.freezed.dart';

@freezed
sealed class MeetingParticipantEntity with _$MeetingParticipantEntity {
  const factory MeetingParticipantEntity({
    required String id,
    required String name,
    required AuthRole role,
    String? division,
  }) = _MeetingParticipantEntity;
}
