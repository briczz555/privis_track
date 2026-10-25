import '../network/exceptions/network_exception.dart';

/// Mengubah exception yang sampai ke presentation menjadi pesan yang aman
/// ditampilkan ke user, tanpa membocorkan tipe Dio/Drift.
String readableErrorMessage(
  Object error, {
  String fallback = 'Terjadi kesalahan tak terduga. Silakan coba lagi.',
}) {
  return switch (error) {
    NetworkException(:final message) => message,
    _ => fallback,
  };
}
