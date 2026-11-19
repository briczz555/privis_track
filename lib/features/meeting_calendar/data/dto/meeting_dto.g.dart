// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MeetingDto _$MeetingDtoFromJson(Map<String, dynamic> json) => _MeetingDto(
  id: json['id'] as String,
  title: json['title'] as String,
  agenda: json['agenda'] as String?,
  mode: json['mode'] as String,
  status: json['status'] as String,
  startAt: DateTime.parse(json['start_at'] as String),
  endAt: DateTime.parse(json['end_at'] as String),
  meetingUrl: json['meeting_url'] as String?,
  location: json['location'] as String?,
  project: json['project'] as Map<String, dynamic>?,
  client: json['client'] as Map<String, dynamic>?,
  organizer: json['organizer'] as Map<String, dynamic>,
  participants: json['participants'] as List<dynamic>? ?? const <dynamic>[],
  notes: json['notes'] as String?,
  mom: json['mom'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$MeetingDtoToJson(_MeetingDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'agenda': instance.agenda,
      'mode': instance.mode,
      'status': instance.status,
      'start_at': instance.startAt.toIso8601String(),
      'end_at': instance.endAt.toIso8601String(),
      'meeting_url': instance.meetingUrl,
      'location': instance.location,
      'project': instance.project,
      'client': instance.client,
      'organizer': instance.organizer,
      'participants': instance.participants,
      'notes': instance.notes,
      'mom': instance.mom,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
