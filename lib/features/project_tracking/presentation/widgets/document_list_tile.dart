import 'package:flutter/material.dart';

import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../domain/entities/stage_document_entity.dart';
import 'document_type_style.dart';

/// Baris dokumen di dalam document vault.
class DocumentListTile extends StatelessWidget {
  const DocumentListTile({super.key, required this.document});

  final StageDocumentEntity document;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);
    final accent = document.type.color;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Icon(document.type.icon, size: 18, color: accent),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  document.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 2),
                Text(
                  '${document.type.label} · ${document.uploadedBy} · '
                  '${formatRelativeTime(document.uploadedAt)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: secondaryText,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Buka dokumen',
            visualDensity: VisualDensity.compact,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Mock: membuka ${document.name}')),
              );
            },
            icon: Icon(
              Icons.open_in_new_rounded,
              size: 18,
              color: secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
