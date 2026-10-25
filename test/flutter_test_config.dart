import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

/// Memuat font Roboto + MaterialIcons dari cache Flutter SDK supaya widget test
/// memakai metrik teks yang sama dengan aplikasi asli.
///
/// Tanpa ini, `flutter_test` memakai font "Ahem" (setiap glyph selebar em) yang
/// membuat teks jauh lebih lebar daripada aslinya dan memicu overflow palsu di
/// layar sempit.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await _loadFonts();
  await testMain();
}

Future<void> _loadFonts() async {
  // <flutter>/bin/cache/artifacts/engine/<platform>/flutter_tester.exe
  final artifactsDir = Directory(Platform.resolvedExecutable)
      .parent
      .parent
      .parent;
  final fontDir = Directory(
    '${artifactsDir.path}${Platform.pathSeparator}material_fonts',
  );
  if (!fontDir.existsSync()) return;

  Future<void> load(String family, List<String> fileNames) async {
    final loader = FontLoader(family);
    var loadedAny = false;
    for (final name in fileNames) {
      final file = File('${fontDir.path}${Platform.pathSeparator}$name');
      if (!file.existsSync()) continue;
      loader.addFont(
        Future.value(ByteData.sublistView(file.readAsBytesSync())),
      );
      loadedAny = true;
    }
    if (loadedAny) await loader.load();
  }

  await load('Roboto', [
    'roboto-regular.ttf',
    'roboto-medium.ttf',
    'roboto-bold.ttf',
  ]);
  await load('MaterialIcons', ['materialicons-regular.otf']);
}
