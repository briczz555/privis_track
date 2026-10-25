import '../entities/project_tracking_entity.dart';
import '../repositories/project_tracking_repository.dart';

class GetProjectTrackingUsecase {
  const GetProjectTrackingUsecase(this._repository);

  final ProjectTrackingRepository _repository;

  Future<ProjectTrackingEntity> call(String projectId) =>
      _repository.getProject(projectId);
}
