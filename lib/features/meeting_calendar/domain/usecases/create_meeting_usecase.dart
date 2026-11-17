import '../entities/meeting_entity.dart';
import '../entities/meeting_input_entity.dart';
import '../repositories/meeting_repository.dart';

class CreateMeetingUsecase {
  const CreateMeetingUsecase(this._repository);

  final MeetingRepository _repository;

  Future<MeetingEntity> call(MeetingInputEntity input) =>
      _repository.createMeeting(input);
}
