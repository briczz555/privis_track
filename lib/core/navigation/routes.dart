import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/screens/all_projects_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/project_tracking/presentation/screens/project_tracking_screen.dart';

/// Nama-nama route sebagai konstanta, supaya navigasi (mis. `context.goNamed(...)`)
/// tidak memakai string mentah yang gampang typo.
abstract class AppRoutes {
  const AppRoutes._();

  static const dashboard = 'dashboard';
  static const allProjects = 'all-projects';
  static const projectTracking = 'project-tracking';
}

/// Semua GoRoute aplikasi, dikelompokkan per fitur lewat komentar section.
final List<GoRoute> appRoutes = [
  // ----- dashboard -----
  GoRoute(
    path: '/',
    name: AppRoutes.dashboard,
    builder: (context, state) => const DashboardScreen(),
  ),
  GoRoute(
    path: '/projects',
    name: AppRoutes.allProjects,
    builder: (context, state) => const AllProjectsScreen(),
  ),

  // ----- project_tracking -----
  GoRoute(
    path: '/projects/:projectId',
    name: AppRoutes.projectTracking,
    builder: (context, state) =>
        ProjectTrackingScreen(projectId: state.pathParameters['projectId']!),
  ),
];
