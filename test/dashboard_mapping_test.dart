import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:privis_track/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:privis_track/core/constants/project_status.dart';

void main() {
  test('repository memetakan payload dummy menjadi entity domain', () async {
    final repository = DashboardRepositoryImpl(
      const DashboardRemoteDataSource(latency: Duration.zero),
    );

    final dashboard = await repository.getDashboard();

    expect(dashboard.totalProjects, 8);
    expect(dashboard.activeProjects, hasLength(4));
    expect(dashboard.portfolioByStatus[ProjectStatus.inProgress], 4);
    expect(dashboard.portfolioByStatus[ProjectStatus.completed], 2);
    expect(dashboard.portfolioByStatus[ProjectStatus.onHold], 1);
    expect(dashboard.portfolioByStatus[ProjectStatus.notStarted], 1);

    final ecommerce = dashboard.projects.firstWhere(
      (project) => project.id == 'PRJ-001',
    );
    expect(ecommerce.name, 'E-Commerce App');
    expect(ecommerce.client, 'PT. ABC Retail');
    expect(ecommerce.status, ProjectStatus.inProgress);
    expect(ecommerce.currentStageTitle, 'Development');
    expect(ecommerce.progressPercent, 50);
    expect(ecommerce.documentCount, 7);
    expect(ecommerce.dueDate, DateTime(2026, 11, 20));

    expect(dashboard.activities, hasLength(6));
    expect(dashboard.activities.first.actor, 'Rina');
    expect(
      dashboard.activities.first.occurredAt.isBefore(DateTime.now()),
      isTrue,
    );
  });
}
