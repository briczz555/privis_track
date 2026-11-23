import 'package:flutter/material.dart';

import '../branding/app_assets.dart';

/// Logo aplikasi (ikon launcher) untuk dipakai di dalam UI.
///
/// Aset sudah memiliki sudut transparan, jadi tidak perlu clip tambahan.
class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 72});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.appIcon,
      width: size,
      height: size,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.medium,
      semanticLabel: 'PriVis Track',
    );
  }
}
