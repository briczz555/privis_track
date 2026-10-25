import 'package:flutter/material.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/extensions/project_status_style.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import 'portfolio_donut_chart.dart';

/// Kartu portofolio: donut chart proporsi status + legend yang bisa di-tap.
class PortfolioCard extends StatefulWidget {
  const PortfolioCard({
    super.key,
    required this.data,
    required this.totalProjects,
  });

  final Map<ProjectStatus, int> data;
  final int totalProjects;

  @override
  State<PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  ProjectStatus? _selected;

  void _select(ProjectStatus status) {
    setState(() => _selected = _selected == status ? null : status);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.6);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: const Icon(
                    Icons.donut_large_rounded,
                    size: 18,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Portofolio Proyek',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${widget.totalProjects} proyek terpantau',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            LayoutBuilder(
              builder: (context, constraints) {
                final dimension = (constraints.maxWidth * 0.42)
                    .clamp(112.0, 152.0)
                    .toDouble();
                final isCompact = constraints.maxWidth < 280;

                final legend = Column(
                  children: [
                    for (final entry in widget.data.entries)
                      _LegendRow(
                        status: entry.key,
                        count: entry.value,
                        total: widget.totalProjects,
                        isSelected: _selected == entry.key,
                        onTap: () => _select(entry.key),
                      ),
                  ],
                );

                final chart = PortfolioDonutChart(
                  data: widget.data,
                  selectedStatus: _selected,
                  onStatusSelected: _select,
                  dimension: dimension,
                );

                if (isCompact) {
                  return Column(
                    children: [
                      Center(child: chart),
                      const SizedBox(height: AppSpacing.sm),
                      legend,
                    ],
                  );
                }

                return Row(
                  children: [
                    chart,
                    const SizedBox(width: AppSpacing.lg),
                    Expanded(child: legend),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _LegendRow extends StatelessWidget {
  const _LegendRow({
    required this.status,
    required this.count,
    required this.total,
    required this.isSelected,
    required this.onTap,
  });

  final ProjectStatus status;
  final int count;
  final int total;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);
    final percentage = total == 0 ? 0 : ((count / total) * 100).round();

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: isSelected ? status.softColor : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: status.color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                status.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
            Text(
              '$count',
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 38,
              child: Text(
                '$percentage%',
                textAlign: TextAlign.right,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: secondaryText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
