import '../../../../core/constants/project_status.dart';
import '../entities/dashboard_entity.dart';
import '../entities/project_list_entity.dart';

abstract interface class DashboardRepository {
  Future<DashboardEntity> getDashboard();

  Future<ProjectListEntity> getProjects({
    int page = 1,
    int limit = 100,
    ProjectStatus? status,
    String? search,
  });
}
