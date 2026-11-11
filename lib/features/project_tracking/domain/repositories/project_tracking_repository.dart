import '../entities/project_tracking_entity.dart';

abstract interface class ProjectTrackingRepository {
  Future<ProjectTrackingEntity> getProject(String projectCode);
}
