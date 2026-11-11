import '../repositories/project_tracking_repository.dart';

class UpdateStageUsecase {
  const UpdateStageUsecase(this._repository);

  final ProjectTrackingRepository _repository;

  Future<void> call({
    required String projectCode,
    required int stageId,
    required bool isCompleted,
  }) => _repository.updateStage(
    projectCode: projectCode,
    stageId: stageId,
    isCompleted: isCompleted,
  );
}
