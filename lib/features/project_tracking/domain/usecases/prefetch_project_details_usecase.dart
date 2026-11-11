import '../repositories/project_tracking_repository.dart';

class PrefetchProjectDetailsUsecase {
  const PrefetchProjectDetailsUsecase(this._repository);

  final ProjectTrackingRepository _repository;

  Future<void> call({required List<String> projectCodes}) =>
      _repository.prefetchProjects(projectCodes);
}
