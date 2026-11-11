import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../auth/domain/entities/auth_role.dart';

/// Label dan warna role untuk UI manajemen user.
extension UserRoleStyle on AuthRole {
  String get label => switch (this) {
    AuthRole.admin => 'Admin',
    AuthRole.pm => 'Project Manager',
    AuthRole.developer => 'Developer',
    AuthRole.qa => 'QA',
    AuthRole.finance => 'Finance',
    AuthRole.unknown => '-',
  };

  Color get color => switch (this) {
    AuthRole.admin => AppColors.primary,
    AuthRole.pm => AppColors.info,
    AuthRole.developer => AppColors.success,
    AuthRole.qa => AppColors.warning,
    AuthRole.finance => AppColors.secondary,
    AuthRole.unknown => AppColors.textSecondary,
  };
}
