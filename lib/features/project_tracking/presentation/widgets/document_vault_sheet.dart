import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/error_message.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_loading_state.dart';
import '../providers/project_tracking_provider.dart';
import 'document_list_tile.dart';

/// Bottom sheet arsip dokumen per tahap SDLC (read-only).
class DocumentVaultSheet extends ConsumerWidget {
  const DocumentVaultSheet({
    super.key,
    required this.projectCode,
    required this.stageId,
  });

  final String projectCode;
  final int stageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final projectState = ref.watch(projectTrackingProvider(projectCode));
    final stage = projectState.value?.stageById(stageId);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);

    if (stage == null) {
      if (projectState.hasError) {
        return SizedBox(
          height: 300,
          child: AppErrorState(
            title: 'Gagal memuat dokumen',
            message: readableErrorMessage(projectState.error!),
            onRetry: () => ref.invalidate(projectTrackingProvider(projectCode)),
          ),
        );
      }
      return const SizedBox(
        height: 200,
        child: AppLoadingState(message: 'Memuat dokumen...'),
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.8,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          0,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    Icons.folder_open_rounded,
                    size: 20,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DOCUMENT VAULT',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${stage.id}. ${stage.title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  '${stage.documentCount} file',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: secondaryText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.18),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'Arsip dokumen saat ini read-only. Fitur unggah & unduh '
                      'menyusul di iterasi berikutnya.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: secondaryText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            if (stage.documents.isEmpty)
              _EmptyVault(theme: theme)
            else
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: stage.documents.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (context, index) =>
                      DocumentListTile(document: stage.documents[index]),
                ),
              ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Icon(Icons.lock_open_rounded, size: 13, color: secondaryText),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Tahap ini bisa dibuka kapan saja tanpa validasi urutan.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: secondaryText,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyVault extends StatelessWidget {
  const _EmptyVault({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Column(
        children: [
          Icon(Icons.folder_off_outlined, size: 26, color: secondaryText),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Belum ada dokumen pada tahap ini.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
