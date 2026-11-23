import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/onboarding/presentation/providers/onboarding_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Dibaca sebelum runApp agar redirect onboarding bisa diputuskan sinkron.
  final prefs = await SharedPreferences.getInstance();
  final onboardingSeen = prefs.getBool(onboardingSeenKey) ?? false;

  runApp(
    ProviderScope(
      overrides: [
        initialOnboardingSeenProvider.overrideWithValue(onboardingSeen),
      ],
      child: const PriVisApp(),
    ),
  );
}

class PriVisApp extends ConsumerWidget {
  const PriVisApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'PriVis Track',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
