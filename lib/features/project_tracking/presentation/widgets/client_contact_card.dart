import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/client_info_entity.dart';

/// Kartu kontak perusahaan klien: alamat, PIC, dan nomor WhatsApp.
class ClientContactCard extends StatelessWidget {
  const ClientContactCard({super.key, required this.client});

  final ClientInfoEntity client;

  Future<void> _copyPhone(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: client.phone));
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Nomor WhatsApp ${client.contactName} disalin')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                    Icons.apartment_rounded,
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
                        'KONTAK KLIEN',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        client.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            _ContactRow(
              icon: Icons.location_on_outlined,
              label: 'Alamat',
              value: client.address,
            ),
            const SizedBox(height: AppSpacing.sm),
            _ContactRow(
              icon: Icons.person_outline_rounded,
              label: 'PIC Klien',
              value: '${client.contactName} · ${client.contactRole}',
            ),
            const SizedBox(height: AppSpacing.sm),
            _ContactRow(
              icon: Icons.chat_outlined,
              label: 'WhatsApp',
              value: client.phone,
              valueStyle: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              trailing: Tooltip(
                message: 'Salin nomor WhatsApp',
                child: TextButton.icon(
                  onPressed: () => _copyPhone(context),
                  icon: const Icon(Icons.copy_rounded, size: 14),
                  label: const Text('Salin'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    textStyle: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueStyle,
    this.trailing,
  });

  final IconData icon;
  final String label;
  final String value;
  final TextStyle? valueStyle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 16, color: secondaryText),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: secondaryText,
                ),
              ),
              const SizedBox(height: 2),
              Text(value, style: valueStyle ?? theme.textTheme.bodyMedium),
            ],
          ),
        ),
        if (trailing case final trailing?)
          Padding(padding: const EdgeInsets.only(top: 14), child: trailing),
      ],
    );
  }
}
