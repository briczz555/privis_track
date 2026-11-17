import '../entities/meeting_entity.dart';
import '../repositories/meeting_repository.dart';

class CancelMeetingUsecase {
  const CancelMeetingUsecase(this._repository);

  final MeetingRepository _repository;

  Future<MeetingEntity> call(String id) => _repository.cancelMeeting(id);
}
