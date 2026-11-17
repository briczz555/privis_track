import '../entities/user_option_entity.dart';
import '../repositories/meeting_repository.dart';

class GetUserOptionsUsecase {
  const GetUserOptionsUsecase(this._repository);

  final MeetingRepository _repository;

  Future<List<UserOptionEntity>> call() => _repository.getUserOptions();
}
