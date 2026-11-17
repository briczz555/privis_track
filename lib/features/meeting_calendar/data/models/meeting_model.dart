import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/auth_role.dart';
import '../../domain/entities/meeting_client_ref_entity.dart';
import '../../domain/entities/meeting_entity.dart';
import '../../domain/entities/meeting_mode.dart';
import '../../domain/entities/meeting_participant_entity.dart';
import '../../domain/entities/meeting_project_ref_entity.dart';
import '../../domain/entities/meeting_status.dart';
import '../dto/meeting_dto.dart';

part 'meeting_model.freezed.dart';

@freezed
sealed class MeetingModel with _$MeetingModel {
  const MeetingModel._();

  const factory MeetingModel({
    required String id,
    required String title,
    String? agenda,
    required String mode,
    required String status,
    required DateTime startAt,
    required DateTime endAt,
    String? meetingUrl,
    String? location,
    Map<String, dynamic>? project,
    Map<String, dynamic>? client,
    required Map<String, dynamic> organizer,
    required List<dynamic> participants,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MeetingModel;

  factory MeetingModel.fromDto(MeetingDto dto) => MeetingModel(
    id: dto.id,
    title: dto.title,
    agenda: dto.agenda,
    mode: dto.mode,
    status: dto.status,
    startAt: dto.startAt,
    endAt: dto.endAt,
    meetingUrl: dto.meetingUrl,
    location: dto.location,
    project: dto.project,
    client: dto.client,
    organizer: dto.organizer,
    participants: dto.participants,
    notes: dto.notes,
    createdAt: dto.createdAt,
    updatedAt: dto.updatedAt,
  );

  MeetingEntity toEntity() => MeetingEntity(
    id: id,
    title: title,
    agenda: agenda,
    mode: meetingModeFromApi(mode),
    status: meetingStatusFromApi(status),
    startAt: startAt,
    endAt: endAt,
    meetingUrl: meetingUrl,
    location: location,
    project: project == null
        ? null
        : MeetingProjectRefEntity(
            id: project!['id'] as String,
            code: project!['code'] as String,
            name: project!['name'] as String,
          ),
    client: client == null
        ? null
        : MeetingClientRefEntity(
            id: client!['id'] as String,
            name: client!['name'] as String,
          ),
    organizer: _participant(organizer),
    participants: participants
        .whereType<Map>()
        .map((json) => _participant(Map<String, dynamic>.from(json)))
        .toList(growable: false),
    notes: notes,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

MeetingParticipantEntity _participant(Map<String, dynamic> json) =>
    MeetingParticipantEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      role: _roleFromApi(json['role'] as String? ?? ''),
      division: json['division'] as String?,
    );

AuthRole _roleFromApi(String value) => switch (value.toLowerCase()) {
  'admin' => AuthRole.admin,
  'pm' => AuthRole.pm,
  'developer' => AuthRole.developer,
  'qa' => AuthRole.qa,
  'finance' => AuthRole.finance,
  _ => AuthRole.unknown,
};
