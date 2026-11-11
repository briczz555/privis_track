import '../../../../core/constants/project_status.dart';
import '../repositories/project_tracking_repository.dart';

class UpdateProjectStatusUsecase {
  const UpdateProjectStatusUsecase(this._repository);

  final ProjectTrackingRepository _repository;

  Future<void> call({
    required String projectCode,
    required ProjectStatus status,
  }) =>
      _repository.updateProjectStatus(projectCode: projectCode, status: status);
}
