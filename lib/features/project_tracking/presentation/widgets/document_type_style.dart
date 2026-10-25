import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/stage_document_type.dart';

/// Label, ikon, dan warna per jenis dokumen arsip.
extension StageDocumentTypeStyle on StageDocumentType {
  String get label => switch (this) {
    StageDocumentType.pdf => 'PDF',
    StageDocumentType.spreadsheet => 'Spreadsheet',
    StageDocumentType.image => 'Gambar',
    StageDocumentType.design => 'Desain',
    StageDocumentType.document => 'Dokumen',
    StageDocumentType.other => 'Lainnya',
  };

  IconData get icon => switch (this) {
    StageDocumentType.pdf => Icons.picture_as_pdf_rounded,
    StageDocumentType.spreadsheet => Icons.table_chart_rounded,
    StageDocumentType.image => Icons.image_rounded,
    StageDocumentType.design => Icons.design_services_rounded,
    StageDocumentType.document => Icons.description_rounded,
    StageDocumentType.other => Icons.insert_drive_file_rounded,
  };

  Color get color => switch (this) {
    StageDocumentType.pdf => AppColors.error,
    StageDocumentType.spreadsheet => AppColors.success,
    StageDocumentType.image => AppColors.info,
    StageDocumentType.design => AppColors.warning,
    StageDocumentType.document => AppColors.primary,
    StageDocumentType.other => AppColors.textSecondary,
  };
}
