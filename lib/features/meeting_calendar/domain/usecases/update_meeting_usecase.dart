import '../entities/meeting_entity.dart';
import '../entities/meeting_input_entity.dart';
import '../repositories/meeting_repository.dart';

class UpdateMeetingUsecase {
  const UpdateMeetingUsecase(this._repository);

  final MeetingRepository _repository;

  Future<MeetingEntity> call(String id, MeetingInputEntity input) =>
      _repository.updateMeeting(id, input);
}
