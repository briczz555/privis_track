import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../domain/entities/meeting_input_entity.dart';
import '../../domain/entities/meeting_mode.dart';

abstract interface class IMeetingRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchMeetings({
    required DateTime from,
    required DateTime to,
    required String scope,
    String? projectCode,
  });

  Future<Map<String, dynamic>> fetchMeeting(String id);

  Future<Map<String, dynamic>> createMeeting(MeetingInputEntity input);

  Future<Map<String, dynamic>> updateMeeting(
    String id,
    MeetingInputEntity input,
  );

  Future<Map<String, dynamic>> cancelMeeting(String id);

  Future<Map<String, dynamic>> generateMom(String id);

  Future<Uint8List> downloadMom(String id);

  Future<List<Map<String, dynamic>>> fetchUserOptions();
}

class MeetingRemoteDataSource implements IMeetingRemoteDataSource {
  MeetingRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<List<Map<String, dynamic>>> fetchMeetings({
    required DateTime from,
    required DateTime to,
    required String scope,
    String? projectCode,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'meetings',
      queryParameters: {
        'from': from.toUtc().toIso8601String(),
        'to': to.toUtc().toIso8601String(),
        'scope': scope,
        if (projectCode != null && projectCode.isNotEmpty)
          'project_code': projectCode,
      },
    );

    return _listFrom(response.data);
  }

  @override
  Future<Map<String, dynamic>> fetchMeeting(String id) async {
    final response = await _dio.get<Map<String, dynamic>>('meetings/$id');
    return response.data ?? const {};
  }

  @override
  Future<Map<String, dynamic>> createMeeting(MeetingInputEntity input) async {
    final response = await _dio.post<Map<String, dynamic>>(
      'meetings',
      data: _inputBody(input),
    );
    return response.data ?? const {};
  }

  @override
  Future<Map<String, dynamic>> updateMeeting(
    String id,
    MeetingInputEntity input,
  ) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      'meetings/$id',
      data: _inputBody(input),
    );
    return response.data ?? const {};
  }

  @override
  Future<Map<String, dynamic>> cancelMeeting(String id) async {
    final response = await _dio.post<Map<String, dynamic>>(
      'meetings/$id/cancel',
    );
    return response.data ?? const {};
  }

  @override
  Future<Map<String, dynamic>> generateMom(String id) async {
    final response = await _dio.post<Map<String, dynamic>>('meetings/$id/mom');
    return response.data ?? const {};
  }

  @override
  Future<Uint8List> downloadMom(String id) async {
    final response = await _dio.get<List<int>>(
      'meetings/$id/mom',
      options: Options(responseType: ResponseType.bytes),
    );

    return Uint8List.fromList(response.data ?? const []);
  }

  @override
  Future<List<Map<String, dynamic>>> fetchUserOptions() async {
    final response = await _dio.get<Map<String, dynamic>>('users/options');
    return _listFrom(response.data);
  }
}

List<Map<String, dynamic>> _listFrom(Map<String, dynamic>? payload) {
  final data = payload?['data'];
  if (data is! List) return const [];
  return data
      .whereType<Map>()
      .map((item) => Map<String, dynamic>.from(item))
      .toList(growable: false);
}

Map<String, dynamic> _inputBody(MeetingInputEntity input) {
  final meetingUrl = input.meetingUrl?.trim();
  final location = input.location?.trim();

  return {
    'title': input.title.trim(),
    'agenda': input.agenda?.trim(),
    'mode': meetingModeToApi(input.mode),
    'start_at': input.startAt.toUtc().toIso8601String(),
    'end_at': input.endAt.toUtc().toIso8601String(),
    'meeting_url': (meetingUrl == null || meetingUrl.isEmpty)
        ? null
        : meetingUrl,
    'location': (location == null || location.isEmpty) ? null : location,
    'project_code': input.projectCode,
    'participant_ids': input.participantIds,
    'notes': input.notes?.trim(),
  };
}
