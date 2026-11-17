import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_dto.freezed.dart';
part 'meeting_dto.g.dart';

@freezed
sealed class MeetingDto with _$MeetingDto {
  const factory MeetingDto({
    required String id,
    required String title,
    String? agenda,
    required String mode,
    required String status,
    @JsonKey(name: 'start_at') required DateTime startAt,
    @JsonKey(name: 'end_at') required DateTime endAt,
    @JsonKey(name: 'meeting_url') String? meetingUrl,
    String? location,
    Map<String, dynamic>? project,
    Map<String, dynamic>? client,
    required Map<String, dynamic> organizer,
    @Default(<dynamic>[]) List<dynamic> participants,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _MeetingDto;

  factory MeetingDto.fromJson(Map<String, dynamic> json) =>
      _$MeetingDtoFromJson(json);
}
