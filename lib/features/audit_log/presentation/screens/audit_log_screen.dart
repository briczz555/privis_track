import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/exceptions/network_exception.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/error_message.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_loading_state.dart';
import '../../../auth/domain/entities/auth_role.dart';
import '../../../auth/presentation/providers/auth_controller.dart';
import '../../domain/entities/audit_log_entity.dart';
import '../../domain/entities/audit_log_page_entity.dart';
import '../providers/audit_log_provider.dart';

/// Riwayat aksi admin (manajemen user, proyek, dan klien).
class AuditLogScreen extends ConsumerStatefulWidget {
  const AuditLogScreen({super.key});

  @override
  ConsumerState<AuditLogScreen> createState() => _AuditLogScreenState();
}

class _AuditLogScreenState extends ConsumerState<AuditLogScreen> {
  bool _isLoadingMore = false;

  Future<void> _refresh() {
    return ref.read(auditLogProvider.notifier).refresh();
  }

  Future<void> _loadMore() async {
    if (_isLoadingMore) return;
    _isLoadingMore = true;

    try {
      await ref.read(auditLogProvider.notifier).loadMore();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(readableErrorMessage(error))));
    } finally {
      _isLoadingMore = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final role = auth.value?.user.role;
    final isAdmin = role == AuthRole.admin;

    if (auth.isLoading && role == null) {
      return const Scaffold(
        body: AppLoadingState(message: 'Memeriksa akses...'),
      );
    }

    if (!isAdmin) {
      return const _AccessDenied();
    }

    final logs = ref.watch(auditLogProvider);
    final data = logs.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Audit Log'),
        actions: [
          IconButton(
            tooltip: 'Muat ulang',
            onPressed: _refresh,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: data != null
            ? NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.extentAfter < 250) {
                    _loadMore();
                  }
                  return false;
                },
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: _AuditLogList(
                    data: data,
                    isLoadingMore: data.isLoadingMore,
                  ),
                ),
              )
            : logs.hasError
            ? AppErrorState(
                title: isOfflineError(logs.error)
                    ? 'Tidak ada koneksi'
                    : 'Gagal memuat audit log',
                message: isOfflineError(logs.error)
                    ? 'Audit log memerlukan koneksi ke server.'
                    : readableErrorMessage(logs.error!),
                onRetry: _refresh,
              )
            : const AppLoadingState(message: 'Memuat audit log...'),
      ),
    );
  }
}

class _AuditLogList extends StatelessWidget {
  const _AuditLogList({required this.data, required this.isLoadingMore});

  final AuditLogPageEntity data;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.xxl,
      ),
      itemCount:
          1 +
          (data.logs.isEmpty ? 1 : data.logs.length) +
          (isLoadingMore ? 1 : 0),
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.sm),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: Text(
              '${data.total} aktivitas',
              style: theme.textTheme.titleSmall,
            ),
          );
        }

        if (data.logs.isEmpty) {
          return const AppEmptyState(
            message: 'Belum ada aktivitas admin yang tercatat.',
          );
        }

        if (index > data.logs.length) {
          return const Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Center(
              child: SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }

        return _AuditLogTile(log: data.logs[index - 1]);
      },
    );
  }
}

class _AuditLogTile extends StatelessWidget {
  const _AuditLogTile({required this.log});

  final AuditLogEntity log;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = _accentFor(log.action);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        leading: CircleAvatar(
          backgroundColor: accent.withValues(alpha: 0.12),
          child: Icon(_iconFor(log.action), size: 18, color: accent),
        ),
        title: Text(log.summary, style: theme.textTheme.titleSmall),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            '${log.actorName} · ${formatRelativeTime(log.createdAt)}',
            style: theme.textTheme.bodySmall?.copyWith(color: secondaryText),
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child: Text(
            _labelFor(log.action),
            style: theme.textTheme.labelSmall?.copyWith(
              color: accent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

String _labelFor(String action) => switch (action) {
  'user.created' => 'User baru',
  'user.updated' => 'Ubah user',
  'user.deactivated' => 'Nonaktif',
  'user.activated' => 'Aktif',
  'user.password_reset' => 'Reset password',
  'project.created' => 'Proyek baru',
  'project.updated' => 'Ubah proyek',
  _ => action,
};

IconData _iconFor(String action) => switch (action) {
  'user.created' || 'user.activated' => Icons.person_add_alt_1_rounded,
  'user.deactivated' => Icons.person_off_outlined,
  'user.password_reset' => Icons.lock_reset_rounded,
  'user.updated' => Icons.manage_accounts_outlined,
  'project.created' => Icons.create_new_folder_outlined,
  'project.updated' => Icons.edit_note_rounded,
  _ => Icons.history_rounded,
};

Color _accentFor(String action) {
  if (action == 'user.deactivated' || action == 'user.password_reset') {
    return AppColors.warning;
  }
  if (action.startsWith('project.')) return AppColors.info;
  if (action.startsWith('user.')) return AppColors.primary;
  return AppColors.textSecondary;
}

class _AccessDenied extends StatelessWidget {
  const _AccessDenied();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Audit Log')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.lock_outline_rounded,
                size: 42,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: AppSpacing.md),
              Text('Akses ditolak', style: theme.textTheme.titleMedium),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Hanya admin yang dapat melihat audit log.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
