import 'package:flutter/material.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/extensions/project_status_style.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';

/// Urutan chip: status yang paling butuh perhatian lebih dulu.
const _statusFilterOrder = [
  ProjectStatus.inProgress,
  ProjectStatus.onHold,
  ProjectStatus.notStarted,
  ProjectStatus.completed,
];

/// Filter status untuk halaman daftar proyek. `null` berarti semua status.
class ProjectFilterBar extends StatelessWidget {
  const ProjectFilterBar({
    super.key,
    required this.counts,
    required this.selected,
    required this.onSelected,
  });

  final Map<ProjectStatus, int> counts;
  final ProjectStatus? selected;
  final ValueChanged<ProjectStatus?> onSelected;

  @override
  Widget build(BuildContext context) {
    final total = counts.values.fold<int>(0, (sum, count) => sum + count);

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        _FilterChip(
          label: 'Semua ($total)',
          accent: AppColors.primary,
          isSelected: selected == null,
          onTap: () => onSelected(null),
        ),
        for (final status in _statusFilterOrder)
          _FilterChip(
            label: '${status.label} (${counts[status] ?? 0})',
            accent: status.color,
            isSelected: selected == status,
            onTap: () => onSelected(status),
          ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.accent,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final Color accent;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.6);

    return Material(
      color: isSelected
          ? accent.withValues(alpha: 0.12)
          : theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(AppRadius.full),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.full),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.full),
            border: Border.all(
              color: isSelected
                  ? accent.withValues(alpha: 0.4)
                  : theme.dividerColor,
            ),
          ),
          child: Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: isSelected ? accent : secondaryText,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
