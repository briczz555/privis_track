import 'dart:typed_data';

import '../entities/meeting_entity.dart';
import '../entities/meeting_input_entity.dart';
import '../entities/user_option_entity.dart';

abstract interface class MeetingRepository {
  Future<List<MeetingEntity>> getMeetings({
    required DateTime from,
    required DateTime to,
    required String scope,
    String? projectCode,
  });

  Future<MeetingEntity> getMeeting(String id);

  Future<MeetingEntity> createMeeting(MeetingInputEntity input);

  Future<MeetingEntity> updateMeeting(String id, MeetingInputEntity input);

  Future<MeetingEntity> cancelMeeting(String id);

  Future<MeetingEntity> generateMom(String id);

  Future<Uint8List> downloadMom(String id);

  Future<List<UserOptionEntity>> getUserOptions();
}
