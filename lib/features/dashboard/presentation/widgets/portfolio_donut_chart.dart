import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/constants/project_status.dart';
import '../../../../core/extensions/project_status_style.dart';

/// Donut chart portfolio yang interaktif: tap pada slice untuk men-highlight
/// status tertentu. Slice yang dipilih akan menebal, slice lain meredup.
class PortfolioDonutChart extends StatefulWidget {
  const PortfolioDonutChart({
    super.key,
    required this.data,
    required this.selectedStatus,
    required this.onStatusSelected,
    this.dimension = 152,
  });

  final Map<ProjectStatus, int> data;
  final ProjectStatus? selectedStatus;
  final ValueChanged<ProjectStatus> onStatusSelected;
  final double dimension;

  @override
  State<PortfolioDonutChart> createState() => _PortfolioDonutChartState();
}

class _PortfolioDonutChartState extends State<PortfolioDonutChart>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 650),
  )..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    final entries = widget.data.entries.toList(growable: false);
    final total = entries.fold<int>(0, (sum, entry) => sum + entry.value);
    if (total == 0) return;

    final center = Offset(widget.dimension / 2, widget.dimension / 2);
    final offset = details.localPosition - center;
    final outerRadius = widget.dimension / 2;
    final innerRadius = outerRadius * 0.5;
    final distance = offset.distance;
    if (distance < innerRadius || distance > outerRadius) return;

    const startAngle = -math.pi / 2;
    var angle = math.atan2(offset.dy, offset.dx);
    if (angle < startAngle) angle += 2 * math.pi;

    var cursor = startAngle;
    for (final entry in entries) {
      final sweep = (entry.value / total) * 2 * math.pi;
      if (angle >= cursor && angle <= cursor + sweep) {
        widget.onStatusSelected(entry.key);
        return;
      }
      cursor += sweep;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final total = widget.data.values.fold<int>(0, (sum, value) => sum + value);
    final selected = widget.selectedStatus;
    final percentage = selected == null
        ? null
        : ((widget.data[selected] ?? 0) / total * 100).round();

    final headline = percentage == null ? '$total' : '$percentage%';
    final caption = selected?.label ?? 'Proyek';
    final captionColor =
        selected?.color ?? theme.colorScheme.onSurface.withValues(alpha: 0.55);

    return Semantics(
      label: 'Donut chart portofolio proyek',
      child: SizedBox(
        width: widget.dimension,
        height: widget.dimension,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: _handleTapDown,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: _PortfolioDonutPainter(
                  data: widget.data,
                  selectedStatus: selected,
                  progress: Curves.easeOutCubic.transform(_controller.value),
                ),
                child: child,
              );
            },
            child: IgnorePointer(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      headline,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: widget.dimension * 0.52,
                      child: Text(
                        caption,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: captionColor,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PortfolioDonutPainter extends CustomPainter {
  const _PortfolioDonutPainter({
    required this.data,
    required this.selectedStatus,
    required this.progress,
  });

  final Map<ProjectStatus, int> data;
  final ProjectStatus? selectedStatus;
  final double progress;

  static const double _sliceGap = 0.05;

  @override
  void paint(Canvas canvas, Size size) {
    final total = data.values.fold<int>(0, (sum, value) => sum + value);
    if (total == 0) return;

    final center = size.center(Offset.zero);
    final maxRadius = size.shortestSide / 2;
    final ringWidth = maxRadius * 0.22;
    final arcRect = Rect.fromCircle(
      center: center,
      radius: maxRadius - ringWidth * 0.7,
    );

    var startAngle = -math.pi / 2;
    data.forEach((status, count) {
      final sweep = (count / total) * 2 * math.pi * progress;
      if (sweep <= 0) return;

      final isSelected = selectedStatus == status;
      final isDimmed = selectedStatus != null && !isSelected;
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = isSelected ? ringWidth * 1.3 : ringWidth
        ..strokeCap = StrokeCap.round
        ..color = status.color.withValues(alpha: isDimmed ? 0.25 : 1);

      final gap = sweep > _sliceGap ? _sliceGap : 0.0;
      canvas.drawArc(arcRect, startAngle + gap / 2, sweep - gap, false, paint);
      startAngle += sweep;
    });
  }

  @override
  bool shouldRepaint(covariant _PortfolioDonutPainter oldDelegate) {
    return oldDelegate.data != data ||
        oldDelegate.selectedStatus != selectedStatus ||
        oldDelegate.progress != progress;
  }
}
