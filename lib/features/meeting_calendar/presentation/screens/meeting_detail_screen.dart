import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/error_message.dart';
import '../../../../core/utils/wib_time.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_loading_state.dart';
import '../../../auth/domain/entities/auth_role.dart';
import '../../../auth/presentation/providers/auth_controller.dart';
import '../../../user_management/presentation/widgets/user_role_style.dart';
import '../../domain/entities/meeting_entity.dart';
import '../providers/meeting_provider.dart';

class MeetingDetailScreen extends ConsumerStatefulWidget {
  const MeetingDetailScreen({super.key, required this.id, this.initial});

  final String id;
  final MeetingEntity? initial;

  @override
  ConsumerState<MeetingDetailScreen> createState() =>
      _MeetingDetailScreenState();
}

class _MeetingDetailScreenState extends ConsumerState<MeetingDetailScreen> {
  bool _isCancelling = false;

  Future<void> _edit(MeetingEntity meeting) async {
    final updated = await context.pushNamed<MeetingEntity>(
      AppRoutes.meetingEdit,
      pathParameters: {'meetingId': meeting.id},
      extra: meeting,
    );
    if (updated == null || !mounted) return;
    ref.invalidate(meetingDetailProvider(meeting.id));
    ref.invalidate(meetingsProvider);
  }

  Future<void> _cancel(MeetingEntity meeting) async {
    if (_isCancelling) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Batalkan meeting?'),
        content: Text(
          'Meeting "${meeting.title}" akan ditandai dibatalkan. '
          'Riwayat tetap tersimpan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: const Text('Batalkan Meeting'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    setState(() => _isCancelling = true);
    try {
      await ref.read(cancelMeetingUsecaseProvider).call(meeting.id);
      if (!mounted) return;
      ref.invalidate(meetingDetailProvider(meeting.id));
      ref.invalidate(meetingsProvider);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Meeting dibatalkan.')));
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(readableErrorMessage(error))));
    } finally {
      if (mounted) setState(() => _isCancelling = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final detail = ref.watch(meetingDetailProvider(widget.id));
    final meeting = detail.value ?? widget.initial;
    final session = ref.watch(authControllerProvider).value;
    final canManage =
        meeting != null &&
        (session?.user.role == AuthRole.admin ||
            session?.user.role == AuthRole.pm ||
            session?.user.id == meeting.organizer.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Meeting'),
        actions: [
          if (meeting != null && canManage && !meeting.isCancelled) ...[
            IconButton(
              tooltip: 'Edit meeting',
              onPressed: _isCancelling ? null : () => _edit(meeting),
              icon: const Icon(Icons.edit_outlined),
            ),
            IconButton(
              tooltip: 'Batalkan meeting',
              onPressed: _isCancelling ? null : () => _cancel(meeting),
              icon: _isCancelling
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.event_busy_rounded),
            ),
          ],
        ],
      ),
      body: meeting != null
          ? _MeetingDetailBody(meeting: meeting)
          : detail.hasError
          ? AppErrorState(
              title: 'Gagal memuat meeting',
              message: readableErrorMessage(detail.error!),
              onRetry: () => ref.invalidate(meetingDetailProvider(widget.id)),
            )
          : const AppLoadingState(message: 'Memuat meeting...'),
    );
  }
}

class _MeetingDetailBody extends StatelessWidget {
  const _MeetingDetailBody({required this.meeting});

  final MeetingEntity meeting;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);
    final startWib = toWib(meeting.startAt);
    final endWib = toWib(meeting.endAt);

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        if (meeting.isCancelled)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: theme.colorScheme.error.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Text(
              'Meeting ini dibatalkan.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        Text(
          meeting.title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            decoration: meeting.isCancelled ? TextDecoration.lineThrough : null,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.xs,
          children: [
            _Badge(
              label: meeting.isOnline ? 'Online' : 'Onsite',
              color: meeting.isOnline ? AppColors.info : AppColors.warning,
            ),
            _Badge(
              label: meeting.isCancelled ? 'Dibatalkan' : 'Terjadwal',
              color: meeting.isCancelled
                  ? theme.colorScheme.error
                  : AppColors.success,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        _InfoRow(
          icon: Icons.schedule_rounded,
          label: 'Waktu',
          value:
              '${formatLongDate(startWib)} · '
              '${_time(startWib)}–${_time(endWib)}',
        ),
        if (meeting.project != null)
          _InfoRow(
            icon: Icons.folder_outlined,
            label: 'Proyek',
            value: '${meeting.project!.code} · ${meeting.project!.name}',
            onTap: () => context.pushNamed(
              AppRoutes.projectTracking,
              pathParameters: {'projectCode': meeting.project!.code},
            ),
          ),
        if (meeting.client != null)
          _InfoRow(
            icon: Icons.apartment_outlined,
            label: 'Klien',
            value: meeting.client!.name,
          ),
        if (meeting.isOnline && (meeting.meetingUrl ?? '').isNotEmpty)
          _InfoRow(
            icon: Icons.link_rounded,
            label: 'Link meeting',
            value: meeting.meetingUrl!,
            trailing: IconButton(
              tooltip: 'Salin link',
              onPressed: () async {
                await Clipboard.setData(
                  ClipboardData(text: meeting.meetingUrl!),
                );
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Link meeting disalin.')),
                );
              },
              icon: const Icon(Icons.copy_rounded, size: 16),
            ),
          ),
        if (!meeting.isOnline && (meeting.location ?? '').isNotEmpty)
          _InfoRow(
            icon: Icons.location_on_outlined,
            label: 'Lokasi',
            value: meeting.location!,
          ),
        if ((meeting.agenda ?? '').isNotEmpty) ...[
          const SizedBox(height: AppSpacing.md),
          Text('Agenda', style: theme.textTheme.titleSmall),
          const SizedBox(height: 4),
          Text(meeting.agenda!, style: theme.textTheme.bodyMedium),
        ],
        if ((meeting.notes ?? '').isNotEmpty) ...[
          const SizedBox(height: AppSpacing.md),
          Text('Catatan', style: theme.textTheme.titleSmall),
          const SizedBox(height: 4),
          Text(meeting.notes!, style: theme.textTheme.bodyMedium),
        ],
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Peserta (${meeting.participants.length})',
          style: theme.textTheme.titleSmall,
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (final participant in meeting.participants)
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: participant.role.color.withValues(
                    alpha: 0.15,
                  ),
                  child: Text(
                    _initials(participant.name),
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontSize: 9,
                      color: participant.role.color,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                label: Text('${participant.name} · ${participant.role.label}'),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Dibuat oleh ${meeting.organizer.name}',
          style: theme.textTheme.bodySmall?.copyWith(color: secondaryText),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(icon, size: 16, color: theme.colorScheme.primary),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.55,
                      ),
                    ),
                  ),
                  Text(value, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall
            ?.copyWith(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}

String _time(DateTime date) =>
    '${date.hour.toString().padLeft(2, '0')}:'
    '${date.minute.toString().padLeft(2, '0')}';

String _initials(String name) {
  final words = name.trim().split(RegExp(r'\s+'));
  if (words.isEmpty) return '?';
  return words.take(2).map((word) => word[0].toUpperCase()).join();
}
