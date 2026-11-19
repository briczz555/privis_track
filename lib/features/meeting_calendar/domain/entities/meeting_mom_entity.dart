import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_mom_entity.freezed.dart';

/// Metadata MoM (Minutes of Meeting) hasil generate dari template resmi.
@freezed
sealed class MeetingMomEntity with _$MeetingMomEntity {
  const factory MeetingMomEntity({
    required String fileName,
    required int sizeBytes,
    required DateTime generatedAt,
    required String generatedByName,
  }) = _MeetingMomEntity;
}
