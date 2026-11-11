import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/error_message.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_loading_state.dart';
import '../../../auth/domain/entities/auth_role.dart';
import '../../../auth/presentation/providers/auth_controller.dart';
import '../../domain/entities/managed_user_entity.dart';
import '../providers/user_management_provider.dart';
import '../widgets/managed_user_tile.dart';
import '../widgets/reset_user_password_dialog.dart';
import '../widgets/user_form_dialog.dart';

/// Halaman admin untuk mengelola akun internal (tambah, ubah, aktif/nonaktif,
/// reset password). Backend tetap menolak role selain admin.
class UserManagementScreen extends ConsumerWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);
    final session = auth.value;

    if (auth.isLoading && session == null) {
      return const Scaffold(
        body: AppLoadingState(message: 'Memeriksa akses...'),
      );
    }

    if (session?.user.role != AuthRole.admin) {
      return const _AccessDenied();
    }

    final selfId = session!.user.id;
    final users = ref.watch(userManagementProvider);
    final data = users.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola User'),
        actions: [
          IconButton(
            tooltip: 'Muat ulang',
            onPressed: () =>
                ref.read(userManagementProvider.notifier).refresh(),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _createUser(context, ref),
        icon: const Icon(Icons.person_add_alt_1_rounded),
        label: const Text('Tambah User'),
      ),
      body: SafeArea(
        top: false,
        child: data != null
            ? RefreshIndicator(
                onRefresh: () =>
                    ref.read(userManagementProvider.notifier).refresh(),
                child: _UserList(
                  users: data,
                  selfId: selfId,
                  onAction: (user, action) =>
                      _handleAction(context, ref, user, action),
                ),
              )
            : users.hasError
            ? AppErrorState(
                title: 'Gagal memuat daftar user',
                message: readableErrorMessage(users.error!),
                onRetry: () =>
                    ref.read(userManagementProvider.notifier).refresh(),
              )
            : const AppLoadingState(message: 'Memuat daftar user...'),
      ),
    );
  }

  Future<void> _createUser(BuildContext context, WidgetRef ref) async {
    final created = await showDialog<bool>(
      context: context,
      builder: (_) => const UserFormDialog(),
    );

    if (created == true && context.mounted) {
      _showMessage(context, 'User baru ditambahkan.');
    }
  }

  Future<void> _handleAction(
    BuildContext context,
    WidgetRef ref,
    ManagedUserEntity user,
    UserTileAction action,
  ) async {
    switch (action) {
      case UserTileAction.edit:
        await _editUser(context, ref, user);
      case UserTileAction.toggleActive:
        await _toggleActive(context, ref, user);
      case UserTileAction.resetPassword:
        await _resetPassword(context, ref, user);
    }
  }

  Future<void> _editUser(
    BuildContext context,
    WidgetRef ref,
    ManagedUserEntity user,
  ) async {
    final selfId = ref.read(authControllerProvider).value?.user.id;
    final updated = await showDialog<bool>(
      context: context,
      builder: (_) => UserFormDialog(user: user, roleLocked: user.id == selfId),
    );

    if (updated == true && context.mounted) {
      _showMessage(context, 'Data user diperbarui.');
    }
  }

  Future<void> _toggleActive(
    BuildContext context,
    WidgetRef ref,
    ManagedUserEntity user,
  ) async {
    if (user.isActive) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Nonaktifkan user?'),
          content: Text(
            '${user.name} tidak akan bisa login dan semua sesinya berakhir. '
            'Data dan riwayat aktivitasnya tetap tersimpan.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Nonaktifkan'),
            ),
          ],
        ),
      );

      if (confirmed != true || !context.mounted) return;
    }

    try {
      await ref
          .read(userManagementProvider.notifier)
          .updateUser(
            id: user.id,
            name: user.name,
            role: user.role,
            division: user.division,
            isActive: !user.isActive,
          );

      if (!context.mounted) return;
      _showMessage(
        context,
        user.isActive
            ? '${user.name} dinonaktifkan.'
            : '${user.name} diaktifkan.',
      );
    } catch (error) {
      if (!context.mounted) return;
      _showMessage(context, readableErrorMessage(error), isError: true);
    }
  }

  Future<void> _resetPassword(
    BuildContext context,
    WidgetRef ref,
    ManagedUserEntity user,
  ) async {
    final reset = await showDialog<bool>(
      context: context,
      builder: (_) => ResetUserPasswordDialog(user: user),
    );

    if (reset == true && context.mounted) {
      _showMessage(context, 'Password ${user.name} berhasil direset.');
    }
  }

  void _showMessage(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Theme.of(context).colorScheme.error : null,
      ),
    );
  }
}

class _UserList extends StatelessWidget {
  const _UserList({
    required this.users,
    required this.selfId,
    required this.onAction,
  });

  final List<ManagedUserEntity> users;
  final String selfId;
  final void Function(ManagedUserEntity user, UserTileAction action) onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeCount = users.where((user) => user.isActive).length;

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.xxl,
      ),
      itemCount: users.length + 1,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.sm),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: Row(
              children: [
                Text('${users.length} user', style: theme.textTheme.titleSmall),
                const Spacer(),
                Text(
                  '$activeCount aktif',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.success,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }

        final user = users[index - 1];
        return ManagedUserTile(
          user: user,
          isSelf: user.id == selfId,
          onAction: (action) => onAction(user, action),
        );
      },
    );
  }
}

class _AccessDenied extends StatelessWidget {
  const _AccessDenied();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Kelola User')),
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
              Text(
                'Akses ditolak',
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Hanya admin yang dapat mengelola user.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              OutlinedButton(
                onPressed: () => Navigator.of(context).maybePop(),
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
