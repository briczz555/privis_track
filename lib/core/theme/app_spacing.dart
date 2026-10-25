/// Skala spacing konsisten (kelipatan 4). Pakai konstanta ini untuk
/// padding/margin/gap — JANGAN tulis angka mentah (mis. `EdgeInsets.all(17)`)
/// di widget.
abstract class AppSpacing {
  const AppSpacing._();

  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
  static const xxl = 48.0;
}
