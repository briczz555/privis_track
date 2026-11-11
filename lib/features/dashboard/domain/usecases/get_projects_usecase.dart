import '../../../../core/constants/project_status.dart';
import '../entities/project_list_entity.dart';
import '../repositories/dashboard_repository.dart';

class GetProjectsUsecase {
  const GetProjectsUsecase(this._repository);

  final DashboardRepository _repository;

  Future<ProjectListEntity> call({
    int page = 1,
    int limit = 100,
    ProjectStatus? status,
    String? search,
  }) => _repository.getProjects(
    page: page,
    limit: limit,
    status: status,
    search: search,
  );
}
