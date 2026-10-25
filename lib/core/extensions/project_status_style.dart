import 'package:flutter/material.dart';

import '../constants/project_status.dart';
import '../theme/app_colors.dart';

/// Pemetaan status domain ke label & warna untuk kebutuhan UI.
extension ProjectStatusStyle on ProjectStatus {
  String get label => switch (this) {
    ProjectStatus.notStarted => 'Belum Mulai',
    ProjectStatus.inProgress => 'Berjalan',
    ProjectStatus.onHold => 'Ditunda',
    ProjectStatus.completed => 'Selesai',
  };

  Color get color => switch (this) {
    ProjectStatus.notStarted => AppColors.info,
    ProjectStatus.inProgress => AppColors.primary,
    ProjectStatus.onHold => AppColors.warning,
    ProjectStatus.completed => AppColors.success,
  };

  Color get softColor => color.withValues(alpha: 0.12);
}
