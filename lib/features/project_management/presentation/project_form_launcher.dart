import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/routes.dart';
import '../../dashboard/presentation/providers/dashboard_provider.dart';
import '../../project_tracking/domain/entities/project_tracking_entity.dart';
import '../../project_tracking/presentation/providers/project_tracking_provider.dart';

/// Buka form tambah proyek, lalu arahkan ke detail proyek yang baru dibuat.
Future<void> startCreateProject(BuildContext context, WidgetRef ref) async {
  final code = await context.pushNamed<String>(AppRoutes.projectCreate);
  if (code == null || !context.mounted) return;

  ref.invalidate(dashboardProvider);
  ref.invalidate(allProjectsProvider);
  await context.pushNamed(
    AppRoutes.projectTracking,
    pathParameters: {'projectCode': code},
  );
}

/// Buka form edit proyek dan segarkan data terkait setelah tersimpan.
Future<void> startEditProject(
  BuildContext context,
  WidgetRef ref,
  ProjectTrackingEntity project,
) async {
  final code = await context.pushNamed<String>(
    AppRoutes.projectEdit,
    pathParameters: {'projectCode': project.code},
    extra: project,
  );
  if (code == null) return;

  ref.invalidate(dashboardProvider);
  ref.invalidate(allProjectsProvider);
  ref.invalidate(projectTrackingProvider(code));
}
