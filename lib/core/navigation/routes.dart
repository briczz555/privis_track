import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/settings_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/dashboard/presentation/screens/all_projects_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/project_tracking/presentation/screens/project_tracking_screen.dart';

/// Nama-nama route sebagai konstanta, supaya navigasi (mis. `context.goNamed(...)`)
/// tidak memakai string mentah yang gampang typo.
abstract class AppRoutes {
  const AppRoutes._();

  static const splash = 'splash';
  static const login = 'login';
  static const settings = 'settings';
  static const dashboard = 'dashboard';
  static const allProjects = 'all-projects';
  static const projectTracking = 'project-tracking';
}

/// Semua GoRoute aplikasi, dikelompokkan per fitur lewat komentar section.
final List<GoRoute> appRoutes = [
  // ----- auth -----
  GoRoute(
    path: '/splash',
    name: AppRoutes.splash,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/login',
    name: AppRoutes.login,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/settings',
    name: AppRoutes.settings,
    builder: (context, state) => const SettingsScreen(),
  ),

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
    path: '/projects/:projectCode',
    name: AppRoutes.projectTracking,
    builder: (context, state) => ProjectTrackingScreen(
      projectCode: state.pathParameters['projectCode']!,
    ),
  ),
];
