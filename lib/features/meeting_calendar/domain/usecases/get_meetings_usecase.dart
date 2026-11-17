import '../entities/meeting_entity.dart';
import '../repositories/meeting_repository.dart';

class GetMeetingsUsecase {
  const GetMeetingsUsecase(this._repository);

  final MeetingRepository _repository;

  Future<List<MeetingEntity>> call({
    required DateTime from,
    required DateTime to,
    required String scope,
    String? projectCode,
  }) => _repository.getMeetings(
    from: from,
    to: to,
    scope: scope,
    projectCode: projectCode,
  );
}
