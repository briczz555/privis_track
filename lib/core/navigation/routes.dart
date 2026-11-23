import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/settings_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/audit_log/presentation/screens/audit_log_screen.dart';
import '../../features/dashboard/presentation/screens/all_projects_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/meeting_calendar/domain/entities/meeting_entity.dart';
import '../../features/meeting_calendar/presentation/screens/calendar_screen.dart';
import '../../features/meeting_calendar/presentation/screens/meeting_detail_screen.dart';
import '../../features/meeting_calendar/presentation/screens/meeting_form_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/project_management/presentation/screens/project_form_screen.dart';
import '../../features/project_tracking/domain/entities/project_tracking_entity.dart';
import '../../features/project_tracking/presentation/screens/project_tracking_screen.dart';
import '../../features/user_management/presentation/screens/user_management_screen.dart';

/// Nama-nama route sebagai konstanta, supaya navigasi (mis. `context.goNamed(...)`)
/// tidak memakai string mentah yang gampang typo.
abstract class AppRoutes {
  const AppRoutes._();

  static const splash = 'splash';
  static const onboarding = 'onboarding';
  static const login = 'login';
  static const settings = 'settings';
  static const auditLog = 'audit-log';
  static const dashboard = 'dashboard';
  static const allProjects = 'all-projects';
  static const projectCreate = 'project-create';
  static const projectEdit = 'project-edit';
  static const projectTracking = 'project-tracking';
  static const calendar = 'calendar';
  static const meetingCreate = 'meeting-create';
  static const meetingDetail = 'meeting-detail';
  static const meetingEdit = 'meeting-edit';
  static const userManagement = 'user-management';
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
    path: '/onboarding',
    name: AppRoutes.onboarding,
    builder: (context, state) => const OnboardingScreen(),
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
  GoRoute(
    path: '/settings/users',
    name: AppRoutes.userManagement,
    builder: (context, state) => const UserManagementScreen(),
  ),
  GoRoute(
    path: '/settings/audit-logs',
    name: AppRoutes.auditLog,
    builder: (context, state) => const AuditLogScreen(),
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

  // ----- meeting_calendar -----
  GoRoute(
    path: '/calendar',
    name: AppRoutes.calendar,
    builder: (context, state) => const CalendarScreen(),
  ),
  GoRoute(
    path: '/calendar/new',
    name: AppRoutes.meetingCreate,
    builder: (context, state) => const MeetingFormScreen(),
  ),
  GoRoute(
    path: '/calendar/:meetingId',
    name: AppRoutes.meetingDetail,
    builder: (context, state) => MeetingDetailScreen(
      id: state.pathParameters['meetingId']!,
      initial: state.extra is MeetingEntity
          ? state.extra as MeetingEntity
          : null,
    ),
  ),
  GoRoute(
    path: '/calendar/:meetingId/edit',
    name: AppRoutes.meetingEdit,
    builder: (context, state) => MeetingFormScreen(
      initial: state.extra is MeetingEntity
          ? state.extra as MeetingEntity
          : null,
    ),
  ),

  // ----- project_management -----
  GoRoute(
    path: '/projects/new',
    name: AppRoutes.projectCreate,
    builder: (context, state) => const ProjectFormScreen(),
  ),

  // ----- project_tracking -----
  GoRoute(
    path: '/projects/:projectCode',
    name: AppRoutes.projectTracking,
    builder: (context, state) => ProjectTrackingScreen(
      projectCode: state.pathParameters['projectCode']!,
    ),
  ),
  GoRoute(
    path: '/projects/:projectCode/edit',
    name: AppRoutes.projectEdit,
    builder: (context, state) => ProjectFormScreen(
      projectCode: state.pathParameters['projectCode']!,
      initialProject: state.extra is ProjectTrackingEntity
          ? state.extra as ProjectTrackingEntity
          : null,
    ),
  ),
];
