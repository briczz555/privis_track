import '../entities/meeting_entity.dart';
import '../repositories/meeting_repository.dart';

class GetMeetingUsecase {
  const GetMeetingUsecase(this._repository);

  final MeetingRepository _repository;

  Future<MeetingEntity> call(String id) => _repository.getMeeting(id);
}
