import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/routes.dart';
import '../../../../core/network/exceptions/network_exception.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/error_message.dart';
import '../../../../core/utils/wib_time.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_loading_state.dart';
import '../../domain/entities/meeting_entity.dart';
import '../providers/meeting_provider.dart';
import '../meeting_reminder_sync.dart';
import '../widgets/meeting_card.dart';
import '../widgets/month_calendar_grid.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  late DateTime _focusedMonth;
  late DateTime _selectedDate;
  String _scope = 'all';
  bool _remindersSynced = false;

  @override
  void initState() {
    super.initState();
    final now = todayWib();
    _focusedMonth = DateTime(now.year, now.month);
    _selectedDate = now;
  }

  DateTime get _gridStart {
    final first = DateTime(_focusedMonth.year, _focusedMonth.month, 1);
    return first.subtract(Duration(days: first.weekday - 1));
  }

  DateTime get _gridEnd => _gridStart.add(const Duration(days: 42));

  String get _queryKey =>
      '${wibWallClockToUtc(_gridStart).toIso8601String()}|'
      '${wibWallClockToUtc(_gridEnd).toIso8601String()}|$_scope|';

  void _changeMonth(int delta) {
    final target = DateTime(_focusedMonth.year, _focusedMonth.month + delta);
    setState(() {
      _focusedMonth = DateTime(target.year, target.month);
      _selectedDate = DateTime(target.year, target.month, 1);
    });
  }

  void _goToday() {
    final now = todayWib();
    setState(() {
      _focusedMonth = DateTime(now.year, now.month);
      _selectedDate = now;
    });
  }

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
      if (date.month != _focusedMonth.month ||
          date.year != _focusedMonth.year) {
        _focusedMonth = DateTime(date.year, date.month);
      }
    });
  }

  Future<void> _createMeeting() async {
    final meeting = await context.pushNamed<MeetingEntity>(
      AppRoutes.meetingCreate,
    );
    if (meeting == null || !mounted) return;
    ref.invalidate(meetingsProvider);
    final localStart = toWib(meeting.startAt);
    setState(() {
      _focusedMonth = DateTime(localStart.year, localStart.month);
      _selectedDate = DateTime(
        localStart.year,
        localStart.month,
        localStart.day,
      );
    });
  }

  Future<void> _openMeeting(MeetingEntity meeting) async {
    await context.pushNamed(
      AppRoutes.meetingDetail,
      pathParameters: {'meetingId': meeting.id},
      extra: meeting,
    );
    if (!mounted) return;
    ref.invalidate(meetingsProvider);
    ref.invalidate(meetingDetailProvider(meeting.id));
  }

  @override
  Widget build(BuildContext context) {
    final meetings = ref.watch(meetingsProvider(_queryKey));
    final data = meetings.value;

    // Jadwalkan ulang pengingat lokal setiap rentang kalender berubah/muat.
    ref.listen(meetingsProvider(_queryKey), (previous, next) {
      final rows = next.value;
      if (rows == null) return;
      syncMeetingReminders(rows);
    });

    // `ref.listen` tidak memicu nilai yang sudah ada; sinkronkan sekali saat
    // data pertama tersedia.
    if (data != null && !_remindersSynced) {
      _remindersSynced = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) syncMeetingReminders(data);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalender'),
        actions: [
          IconButton(
            tooltip: 'Hari ini',
            onPressed: _goToday,
            icon: const Icon(Icons.today_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createMeeting,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Meeting Baru'),
      ),
      body: SafeArea(
        top: false,
        child: data != null
            ? _CalendarContent(
                focusedMonth: _focusedMonth,
                selectedDate: _selectedDate,
                scope: _scope,
                meetings: data,
                onPrevMonth: () => _changeMonth(-1),
                onNextMonth: () => _changeMonth(1),
                onSelectDate: _selectDate,
                onScopeChanged: (scope) => setState(() => _scope = scope),
                onOpenMeeting: _openMeeting,
              )
            : meetings.hasError
            ? AppErrorState(
                title: isOfflineError(meetings.error)
                    ? 'Tidak ada koneksi'
                    : 'Gagal memuat kalender',
                message: isOfflineError(meetings.error)
                    ? 'Kalender memerlukan koneksi ke server.'
                    : readableErrorMessage(meetings.error!),
                onRetry: () => ref.invalidate(meetingsProvider(_queryKey)),
              )
            : const AppLoadingState(message: 'Memuat kalender...'),
      ),
    );
  }
}

class _CalendarContent extends StatelessWidget {
  const _CalendarContent({
    required this.focusedMonth,
    required this.selectedDate,
    required this.scope,
    required this.meetings,
    required this.onPrevMonth,
    required this.onNextMonth,
    required this.onSelectDate,
    required this.onScopeChanged,
    required this.onOpenMeeting,
  });

  final DateTime focusedMonth;
  final DateTime selectedDate;
  final String scope;
  final List<MeetingEntity> meetings;
  final VoidCallback onPrevMonth;
  final VoidCallback onNextMonth;
  final ValueChanged<DateTime> onSelectDate;
  final ValueChanged<String> onScopeChanged;
  final ValueChanged<MeetingEntity> onOpenMeeting;

  DateTime _key(DateTime date) => wibDateOnly(date);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);
    final counts = <DateTime, int>{};
    for (final meeting in meetings) {
      final key = _key(meeting.startAt);
      counts[key] = (counts[key] ?? 0) + 1;
    }
    final selectedKey = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );
    final selectedMeetings = meetings
        .where((meeting) => _key(meeting.startAt) == selectedKey)
        .toList(growable: false);

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          sliver: SliverList.list(
            children: [
              Row(
                children: [
                  ChoiceChip(
                    label: const Text('Semua'),
                    selected: scope == 'all',
                    onSelected: (_) => onScopeChanged('all'),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  ChoiceChip(
                    label: const Text('Saya'),
                    selected: scope == 'mine',
                    onSelected: (_) => onScopeChanged('mine'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  IconButton(
                    tooltip: 'Bulan sebelumnya',
                    onPressed: onPrevMonth,
                    icon: const Icon(Icons.chevron_left_rounded),
                  ),
                  Expanded(
                    child: Text(
                      '${_monthName(focusedMonth.month)} ${focusedMonth.year}',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Bulan berikutnya',
                    onPressed: onNextMonth,
                    icon: const Icon(Icons.chevron_right_rounded),
                  ),
                ],
              ),
              MonthCalendarGrid(
                month: focusedMonth,
                selectedDate: selectedDate,
                meetingCounts: counts,
                onSelect: onSelectDate,
              ),
              const SizedBox(height: AppSpacing.sm),
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                child: Row(
                  children: [
                    Icon(
                      Icons.event_note_rounded,
                      size: 16,
                      color: secondaryText,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      formatLongDate(selectedDate),
                      style: theme.textTheme.titleSmall,
                    ),
                    const Spacer(),
                    Text(
                      '${selectedMeetings.length} meeting',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Padding bawah memberi ruang untuk FAB. Sliver (bukan Column +
        // Expanded) agar halaman tetap bisa di-scroll di layar pendek seperti
        // mode landscape tanpa RenderFlex overflow.
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            0,
            AppSpacing.md,
            96,
          ),
          sliver: selectedMeetings.isEmpty
              ? const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                    child: AppEmptyState(
                      message: 'Tidak ada meeting pada tanggal ini.',
                    ),
                  ),
                )
              : SliverList.separated(
                  itemCount: selectedMeetings.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (context, index) {
                    final meeting = selectedMeetings[index];
                    return MeetingCard(
                      meeting: meeting,
                      onTap: () => onOpenMeeting(meeting),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

String _monthName(int month) => const [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember',
][month - 1];
