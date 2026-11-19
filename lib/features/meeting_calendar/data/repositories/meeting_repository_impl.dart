import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../../../core/network/exceptions/network_exception.dart';
import '../../domain/entities/meeting_entity.dart';
import '../../domain/entities/meeting_input_entity.dart';
import '../../domain/entities/user_option_entity.dart';
import '../../domain/repositories/meeting_repository.dart';
import '../datasources/meeting_remote_data_source.dart';
import '../dto/meeting_dto.dart';
import '../dto/user_option_dto.dart';
import '../models/meeting_model.dart';
import '../models/user_option_model.dart';

class MeetingRepositoryImpl implements MeetingRepository {
  MeetingRepositoryImpl(this._remote);

  final IMeetingRemoteDataSource _remote;

  @override
  Future<List<MeetingEntity>> getMeetings({
    required DateTime from,
    required DateTime to,
    required String scope,
    String? projectCode,
  }) async {
    try {
      final payload = await _remote.fetchMeetings(
        from: from,
        to: to,
        scope: scope,
        projectCode: projectCode,
      );
      return payload.map(_meetingFromJson).toList(growable: false);
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<MeetingEntity> getMeeting(String id) async {
    try {
      final payload = await _remote.fetchMeeting(id);
      return _meetingFromJson(payload);
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<MeetingEntity> createMeeting(MeetingInputEntity input) async {
    try {
      return _meetingFromJson(await _remote.createMeeting(input));
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<MeetingEntity> updateMeeting(
    String id,
    MeetingInputEntity input,
  ) async {
    try {
      return _meetingFromJson(await _remote.updateMeeting(id, input));
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<MeetingEntity> cancelMeeting(String id) async {
    try {
      return _meetingFromJson(await _remote.cancelMeeting(id));
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<MeetingEntity> generateMom(String id) async {
    try {
      return _meetingFromJson(await _remote.generateMom(id));
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<Uint8List> downloadMom(String id) async {
    try {
      return await _remote.downloadMom(id);
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  @override
  Future<List<UserOptionEntity>> getUserOptions() async {
    try {
      final payload = await _remote.fetchUserOptions();
      return payload
          .map(
            (json) =>
                UserOptionModel.fromDto(UserOptionDto.fromJson(json))
                    .toEntity(),
          )
          .toList(growable: false);
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (_) {
      throw const UnknownNetworkException('Respons server tidak sesuai.');
    }
  }

  MeetingEntity _meetingFromJson(Map<String, dynamic> json) =>
      MeetingModel.fromDto(MeetingDto.fromJson(json)).toEntity();
}
