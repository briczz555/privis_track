import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/error_message.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_loading_state.dart';
import '../../../auth/domain/entities/auth_role.dart';
import '../../../auth/presentation/providers/auth_controller.dart';
import '../../domain/entities/stage_document_entity.dart';
import '../providers/project_tracking_provider.dart';
import 'document_list_tile.dart';

const _maxUploadBytes = 20 * 1024 * 1024;
const _allowedExtensions = [
  'pdf',
  'doc',
  'docx',
  'xls',
  'xlsx',
  'csv',
  'png',
  'jpg',
  'jpeg',
  'fig',
];

/// Bottom sheet arsip dokumen per tahap SDLC + upload/download.
class DocumentVaultSheet extends ConsumerStatefulWidget {
  const DocumentVaultSheet({
    super.key,
    required this.projectCode,
    required this.stageId,
  });

  final String projectCode;
  final int stageId;

  @override
  ConsumerState<DocumentVaultSheet> createState() => _DocumentVaultSheetState();
}

class _DocumentVaultSheetState extends ConsumerState<DocumentVaultSheet> {
  bool _isUploading = false;
  String? _downloadingId;
  String? _deletingId;
  String? _feedback;
  bool _feedbackIsError = false;
  Timer? _feedbackTimer;

  @override
  void dispose() {
    _feedbackTimer?.cancel();
    super.dispose();
  }

  Future<void> _upload() async {
    if (_isUploading) return;

    final picked = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: _allowedExtensions,
    );

    if (!mounted || picked == null) return;

    final bytes = await picked.readAsBytes();

    if (!mounted) return;
    if (bytes.length > _maxUploadBytes) {
      _showMessage('Ukuran file maksimum 20 MB.', isError: true);
      return;
    }

    setState(() => _isUploading = true);

    try {
      final document = await ref
          .read(projectTrackingProvider(widget.projectCode).notifier)
          .uploadDocument(
            stageId: widget.stageId,
            fileName: picked.name,
            bytes: bytes,
          );

      if (!mounted) return;
      _showMessage('${document.name} berhasil diunggah.');
    } catch (error) {
      if (!mounted) return;
      _showMessage(readableErrorMessage(error), isError: true);
    } finally {
      if (mounted) setState(() => _isUploading = false);
    }
  }

  Future<void> _download(StageDocumentEntity document) async {
    if (_downloadingId != null) return;

    setState(() => _downloadingId = document.id);

    try {
      final bytes = await ref
          .read(projectTrackingProvider(widget.projectCode).notifier)
          .downloadDocument(document.id);

      final directory = await getTemporaryDirectory();
      final safeName = document.name.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_');
      final file = File(p.join(directory.path, safeName));
      await file.writeAsBytes(bytes, flush: true);

      final result = await OpenFilex.open(file.path);
      if (result.type != ResultType.done) {
        if (!mounted) return;
        _showMessage(
          result.message.isEmpty
              ? 'Tidak ada aplikasi untuk membuka file.'
              : result.message,
          isError: true,
        );
      }
    } catch (error) {
      if (!mounted) return;
      _showMessage(readableErrorMessage(error), isError: true);
    } finally {
      if (mounted) setState(() => _downloadingId = null);
    }
  }

  /// Umpan balik ditampilkan inline di dalam sheet. SnackBar biasa tertutup
  /// modal bottom sheet karena dirender oleh Scaffold di belakangnya.
  void _showMessage(String message, {bool isError = false}) {
    _feedbackTimer?.cancel();

    if (!mounted) return;
    setState(() {
      _feedback = message;
      _feedbackIsError = isError;
    });

    _feedbackTimer = Timer(const Duration(seconds: 6), () {
      if (!mounted) return;
      setState(() => _feedback = null);
    });
  }

  Future<void> _delete(StageDocumentEntity document) async {
    if (_deletingId != null) return;

    final theme = Theme.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hapus dokumen?'),
        content: Text(
          '"${document.name}" akan dihapus dari arsip tahap ini. '
          'Tindakan ini tidak bisa dibatalkan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: theme.colorScheme.error,
              foregroundColor: theme.colorScheme.onError,
            ),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (!mounted || confirmed != true) return;

    setState(() => _deletingId = document.id);

    try {
      await ref
          .read(projectTrackingProvider(widget.projectCode).notifier)
          .deleteDocument(stageId: widget.stageId, documentId: document.id);

      if (!mounted) return;
      _showMessage('${document.name} berhasil dihapus.');
    } catch (error) {
      if (!mounted) return;
      _showMessage(readableErrorMessage(error), isError: true);
    } finally {
      if (mounted) setState(() => _deletingId = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final projectState = ref.watch(projectTrackingProvider(widget.projectCode));
    final stage = projectState.value?.stageById(widget.stageId);
    final secondaryText = theme.colorScheme.onSurface.withValues(alpha: 0.55);
    final role = ref.watch(authControllerProvider).value?.user.role;
    final canDelete = role == AuthRole.admin || role == AuthRole.pm;

    if (stage == null) {
      if (projectState.hasError) {
        return SizedBox(
          height: 300,
          child: AppErrorState(
            title: 'Gagal memuat dokumen',
            message: readableErrorMessage(projectState.error!),
            onRetry: () =>
                ref.invalidate(projectTrackingProvider(widget.projectCode)),
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
            if (_feedback != null) ...[
              _FeedbackBanner(message: _feedback!, isError: _feedbackIsError),
              const SizedBox(height: AppSpacing.md),
            ],
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _isUploading ? null : _upload,
                icon: _isUploading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.upload_file_rounded, size: 18),
                label: Text(_isUploading ? 'Mengunggah...' : 'Unggah dokumen'),
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'PDF, DOC/DOCX, XLS/XLSX, CSV, PNG/JPG, FIG · maks. 20 MB',
              style: theme.textTheme.bodySmall?.copyWith(color: secondaryText),
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
                  itemBuilder: (context, index) {
                    final document = stage.documents[index];
                    return DocumentListTile(
                      document: document,
                      isBusy: _downloadingId == document.id,
                      isDeleting: _deletingId == document.id,
                      onOpen: () => _download(document),
                      onDelete: canDelete ? () => _delete(document) : null,
                    );
                  },
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

class _FeedbackBanner extends StatelessWidget {
  const _FeedbackBanner({required this.message, required this.isError});

  final String message;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isError ? theme.colorScheme.error : AppColors.success;

    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: color.withValues(alpha: 0.35)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isError
                  ? Icons.error_outline_rounded
                  : Icons.check_circle_outline_rounded,
              size: 18,
              color: color,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
          const SizedBox(height: 2),
          Text(
            'Gunakan tombol di atas untuk mengunggah arsip.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(color: secondaryText),
          ),
        ],
      ),
    );
  }
}
