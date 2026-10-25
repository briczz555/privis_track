import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Radius konsisten untuk card, button, input, dsb.
abstract class AppRadius {
  const AppRadius._();

  static const sm = 4.0;
  static const md = 8.0;
  static const lg = 12.0;
  static const xl = 16.0;
  static const full = 999.0;
}

/// Shape siap pakai untuk widget umum, dibangun dari AppRadius.
abstract class AppShapes {
  const AppShapes._();

  static final card = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppRadius.xl),
  );

  static final button = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppRadius.md),
  );

  static final input = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppRadius.md),
    borderSide: const BorderSide(color: AppColors.border),
  );
}
