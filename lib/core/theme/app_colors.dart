import 'package:flutter/material.dart';

/// Warna dasar aplikasi. Ubah nilai di sini untuk mengganti branding —
/// JANGAN hardcode Color(0x...) langsung di widget/screen manapun.
abstract class AppColors {
  const AppColors._();

  static const primary = Color(0xFF2563EB);
  static const primaryDark = Color(0xFF60A5FA);
  static const secondary = Color(0xFF10B981);

  static const background = Color(0xFFFFFFFF);
  static const backgroundDark = Color(0xFF0F172A);

  static const surface = Color(0xFFF8FAFC);
  static const surfaceDark = Color(0xFF1E293B);

  static const textPrimary = Color(0xFF0F172A);
  static const textPrimaryDark = Color(0xFFF8FAFC);
  static const textSecondary = Color(0xFF64748B);
  static const textSecondaryDark = Color(0xFF94A3B8);

  static const error = Color(0xFFDC2626);
  static const success = Color(0xFF16A34A);
  static const warning = Color(0xFFF59E0B);
  static const info = Color(0xFF0EA5E9);

  static const border = Color(0xFFE2E8F0);
  static const borderDark = Color(0xFF334155);
}
