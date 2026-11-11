import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/managed_user_entity.dart';
import 'user_role_style.dart';

enum UserTileAction { edit, toggleActive, resetPassword }

/// Satu baris user di halaman Kelola User.
class ManagedUserTile extends StatelessWidget {
  const ManagedUserTile({
    super.key,
    required this.user,
    required this.isSelf,
    required this.onAction,
  });

  final ManagedUserEntity user;
  final bool isSelf;
  final ValueChanged<UserTileAction> onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);
    final roleColor = user.role.color;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        leading: CircleAvatar(
          backgroundColor: roleColor.withValues(alpha: 0.14),
          child: Text(
            _initialsOf(user.name),
            style: theme.textTheme.titleSmall?.copyWith(
              color: roleColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        title: Row(
          children: [
            Flexible(
              child: Text(
                user.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall,
              ),
            ),
            if (isSelf) ...[
              const SizedBox(width: AppSpacing.xs),
              _Badge(label: 'Anda', color: theme.colorScheme.primary),
            ],
            if (!user.isActive) ...[
              const SizedBox(width: AppSpacing.xs),
              _Badge(label: 'Nonaktif', color: theme.colorScheme.error),
            ],
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Text(
              user.email,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(color: secondaryText),
            ),
            const SizedBox(height: 2),
            Text(
              '${user.role.label} · ${user.division ?? 'Tanpa divisi'}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(color: secondaryText),
            ),
          ],
        ),
        trailing: PopupMenuButton<UserTileAction>(
          tooltip: 'Aksi user',
          onSelected: onAction,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: UserTileAction.edit,
              child: Text('Ubah data'),
            ),
            if (!isSelf) ...[
              PopupMenuItem(
                value: UserTileAction.toggleActive,
                child: Text(user.isActive ? 'Nonaktifkan' : 'Aktifkan'),
              ),
              const PopupMenuItem(
                value: UserTileAction.resetPassword,
                child: Text('Reset password'),
              ),
            ],
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
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall
            ?.copyWith(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}

String _initialsOf(String name) {
  final words = name
      .trim()
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty)
      .take(2)
      .toList(growable: false);

  if (words.isEmpty) return '?';
  return words.map((word) => word[0].toUpperCase()).join();
}
