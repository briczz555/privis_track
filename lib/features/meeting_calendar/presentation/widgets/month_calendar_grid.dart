import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';

/// Grid kalender bulanan (Senin–Minggu, 6 baris).
class MonthCalendarGrid extends StatelessWidget {
  const MonthCalendarGrid({
    super.key,
    required this.month,
    required this.selectedDate,
    required this.meetingCounts,
    required this.onSelect,
  });

  final DateTime month;
  final DateTime selectedDate;
  final Map<DateTime, int> meetingCounts;
  final ValueChanged<DateTime> onSelect;

  static const _weekdayLabels = [
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
    'Min',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final first = DateTime(month.year, month.month, 1);
    final start = first.subtract(Duration(days: first.weekday - 1));
    final today = DateTime.now();

    return Column(
      children: [
        Row(
          children: [
            for (final label in _weekdayLabels)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
        for (var week = 0; week < 6; week++)
          Row(
            children: [
              for (var day = 0; day < 7; day++)
                Expanded(
                  child: _DayCell(
                    date: start.add(Duration(days: week * 7 + day)),
                    month: month,
                    selectedDate: selectedDate,
                    today: today,
                    count:
                        meetingCounts[_dateKey(
                          start.add(Duration(days: week * 7 + day)),
                        )] ??
                        0,
                    onTap: onSelect,
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.date,
    required this.month,
    required this.selectedDate,
    required this.today,
    required this.count,
    required this.onTap,
  });

  final DateTime date;
  final DateTime month;
  final DateTime selectedDate;
  final DateTime today;
  final int count;
  final ValueChanged<DateTime> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCurrentMonth = date.month == month.month;
    final isSelected = _dateKey(date) == _dateKey(selectedDate);
    final isToday = _dateKey(date) == _dateKey(today);

    return Padding(
      padding: const EdgeInsets.all(2),
      child: Material(
        color: isSelected
            ? AppColors.primary.withValues(alpha: 0.12)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: InkWell(
          onTap: () => onTap(date),
          borderRadius: BorderRadius.circular(AppRadius.md),
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: isToday && !isSelected
                  ? Border.all(color: AppColors.primary, width: 1)
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${date.day}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isSelected
                        ? AppColors.primary
                        : isCurrentMonth
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSurface.withValues(alpha: 0.35),
                    fontWeight: isSelected || isToday
                        ? FontWeight.w700
                        : FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                if (count > 0)
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.info,
                      shape: BoxShape.circle,
                    ),
                  )
                else
                  const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

DateTime _dateKey(DateTime date) => DateTime(date.year, date.month, date.day);
