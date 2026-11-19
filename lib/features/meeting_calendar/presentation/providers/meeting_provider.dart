// ignore: unnecessary_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../dashboard/domain/entities/project_entity.dart';
import '../../../dashboard/presentation/providers/dashboard_provider.dart';
import '../../data/datasources/meeting_remote_data_source.dart';
import '../../data/repositories/meeting_repository_impl.dart';
import '../../domain/entities/meeting_entity.dart';
import '../../domain/entities/user_option_entity.dart';
import '../../domain/repositories/meeting_repository.dart';
import '../../domain/usecases/cancel_meeting_usecase.dart';
import '../../domain/usecases/create_meeting_usecase.dart';
import '../../domain/usecases/download_mom_usecase.dart';
import '../../domain/usecases/generate_mom_usecase.dart';
import '../../domain/usecases/get_meeting_usecase.dart';
import '../../domain/usecases/get_meetings_usecase.dart';
import '../../domain/usecases/get_user_options_usecase.dart';
import '../../domain/usecases/update_meeting_usecase.dart';

part 'meeting_provider.g.dart';

@riverpod
MeetingRepository meetingRepository(Ref ref) {
  return MeetingRepositoryImpl(MeetingRemoteDataSource(ref.watch(dioProvider)));
}

@riverpod
GetMeetingsUsecase getMeetingsUsecase(Ref ref) {
  return GetMeetingsUsecase(ref.watch(meetingRepositoryProvider));
}

@riverpod
GetMeetingUsecase getMeetingUsecase(Ref ref) {
  return GetMeetingUsecase(ref.watch(meetingRepositoryProvider));
}

@riverpod
CreateMeetingUsecase createMeetingUsecase(Ref ref) {
  return CreateMeetingUsecase(ref.watch(meetingRepositoryProvider));
}

@riverpod
UpdateMeetingUsecase updateMeetingUsecase(Ref ref) {
  return UpdateMeetingUsecase(ref.watch(meetingRepositoryProvider));
}

@riverpod
CancelMeetingUsecase cancelMeetingUsecase(Ref ref) {
  return CancelMeetingUsecase(ref.watch(meetingRepositoryProvider));
}

@riverpod
GenerateMomUsecase generateMomUsecase(Ref ref) {
  return GenerateMomUsecase(ref.watch(meetingRepositoryProvider));
}

@riverpod
DownloadMomUsecase downloadMomUsecase(Ref ref) {
  return DownloadMomUsecase(ref.watch(meetingRepositoryProvider));
}

@riverpod
GetUserOptionsUsecase getUserOptionsUsecase(Ref ref) {
  return GetUserOptionsUsecase(ref.watch(meetingRepositoryProvider));
}

/// Key: `<fromIso>|<toIso>|<scope>|<projectCode>`.
@riverpod
Future<List<MeetingEntity>> meetings(Ref ref, String key) {
  final parts = key.split('|');
  final from = DateTime.parse(parts[0]);
  final to = DateTime.parse(parts[1]);
  final scope = parts.length > 2 ? parts[2] : 'all';
  final projectCode = parts.length > 3 && parts[3].isNotEmpty ? parts[3] : null;

  return ref
      .watch(getMeetingsUsecaseProvider)
      .call(from: from, to: to, scope: scope, projectCode: projectCode);
}

@riverpod
Future<MeetingEntity> meetingDetail(Ref ref, String id) {
  return ref.watch(getMeetingUsecaseProvider).call(id);
}

@riverpod
Future<List<UserOptionEntity>> meetingUserOptions(Ref ref) {
  return ref.watch(getUserOptionsUsecaseProvider).call();
}

@riverpod
Future<List<ProjectEntity>> meetingProjectOptions(Ref ref) async {
  final list = await ref.watch(getProjectsUsecaseProvider).call(limit: 100);
  return list.projects;
}
