import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privis_track/core/constants/project_status.dart';
import 'package:privis_track/core/network/exceptions/network_exception.dart';
import 'package:privis_track/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:privis_track/features/dashboard/data/repositories/dashboard_repository_impl.dart';

import 'support/fakes.dart';

DioException _offlineError() => DioException(
  requestOptions: RequestOptions(path: '/'),
  type: DioExceptionType.connectionError,
);

class _FakeDashboardDataSource implements IDashboardRemoteDataSource {
  _FakeDashboardDataSource({
    required this.dashboard,
    required this.projects,
    this.offline = false,
  });

  final Map<String, dynamic> dashboard;
  final Map<String, dynamic> projects;
  final bool offline;

  @override
  Future<Map<String, dynamic>> fetchDashboard() async {
    if (offline) throw _offlineError();
    return dashboard;
  }

  @override
  Future<Map<String, dynamic>> fetchProjects({
    int page = 1,
    int limit = 100,
    ProjectStatus? status,
    String? search,
  }) async {
    if (offline) throw _offlineError();
    return projects;
  }
}

Map<String, dynamic> _projectJson(String code) => {
  'id': 'uuid-$code',
  'code': code,
  'name': 'E-Commerce App',
  'client': {'id': 'client-uuid', 'name': 'PT. ABC Retail'},
  'status': 'in_progress',
  'current_stage': 4,
  'current_stage_title': 'Development',
  'completed_stages': 3,
  'progress_percent': 38,
  'document_count': 7,
  'due_date': '2026-11-20',
  'updated_at': '2026-11-10T10:12:00.000Z',
};

Map<String, dynamic> _dashboardJson() => {
  'generated_at': '2026-11-11T00:00:00.000Z',
  'total_projects': 3,
  'portfolio': [
    {'status': 'in_progress', 'count': 1, 'percentage': 33.3},
    {'status': 'on_hold', 'count': 1, 'percentage': 33.3},
    {'status': 'completed', 'count': 1, 'percentage': 33.4},
  ],
  'active_projects': [_projectJson('PRJ-001')],
  'activities': [
    {
      'id': 'activity-1',
      'type': 'document_uploaded',
      'actor': {'id': 'u-1', 'name': 'Finance', 'division': 'Finance'},
      'action': 'mengunggah',
      'target': 'BAST 1',
      'project': {
        'id': 'uuid-PRJ-001',
        'code': 'PRJ-001',
        'name': 'E-Commerce App',
      },
      'created_at': '2026-11-11T00:00:00.000Z',
    },
  ],
};

Map<String, dynamic> _projectsJson() => {
  'data': [_projectJson('PRJ-001')],
  'meta': {'page': 1, 'limit': 100, 'total': 1, 'total_pages': 1},
};

void main() {
  DashboardRepositoryImpl repository({
    bool offline = false,
    MemorySnapshotCache? cache,
  }) {
    return DashboardRepositoryImpl(
      _FakeDashboardDataSource(
        dashboard: _dashboardJson(),
        projects: _projectsJson(),
        offline: offline,
      ),
      cache ?? MemorySnapshotCache(),
    );
  }

  test('memetakan dashboard API ke entity', () async {
    final dashboard = await repository().getDashboard();

    expect(dashboard.totalProjects, 3);
    expect(dashboard.portfolio, hasLength(3));
    expect(dashboard.portfolioByStatus[ProjectStatus.inProgress], 1);
    expect(dashboard.portfolioByStatus[ProjectStatus.onHold], 1);
    expect(dashboard.portfolioByStatus[ProjectStatus.completed], 1);

    expect(dashboard.activeProjects, hasLength(1));
    final project = dashboard.activeProjects.first;
    expect(project.code, 'PRJ-001');
    expect(project.client, 'PT. ABC Retail');
    expect(project.completedStages, 3);
    expect(project.progressPercent, 38);
    expect(project.progress, closeTo(0.38, 0.001));
    expect(project.documentCount, 7);
    expect(project.dueDate, DateTime(2026, 11, 20));

    expect(dashboard.activities, hasLength(1));
    final activity = dashboard.activities.first;
    expect(activity.type, 'document_uploaded');
    expect(activity.actor, 'Finance');
    expect(activity.division, 'Finance');
    expect(activity.projectCode, 'PRJ-001');
  });

  test('memetakan daftar proyek dan metadata pagination', () async {
    final list = await repository().getProjects();

    expect(list.projects, hasLength(1));
    expect(list.page, 1);
    expect(list.limit, 100);
    expect(list.total, 1);
    expect(list.totalPages, 1);
    expect(list.projects.first.status, ProjectStatus.inProgress);
  });

  test('memakai snapshot cache saat koneksi gagal', () async {
    final cache = MemorySnapshotCache();
    final fresh = await repository(cache: cache).getDashboard();

    expect(fresh.isFromCache, isFalse);
    expect(cache.snapshots.containsKey('dashboard'), isTrue);

    final cached = await repository(offline: true, cache: cache).getDashboard();

    expect(cached.isFromCache, isTrue);
    expect(cached.cachedAt, isNotNull);
    expect(cached.totalProjects, 3);
    expect(cached.activeProjects.first.code, 'PRJ-001');
  });

  test('tanpa cache, kegagalan koneksi tetap dilempar', () async {
    await expectLater(
      repository(offline: true).getDashboard(),
      throwsA(isA<NoConnectionException>()),
    );
  });
}
