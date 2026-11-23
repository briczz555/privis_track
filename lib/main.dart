import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/navigation/app_router.dart';
import 'core/navigation/routes.dart';
import 'core/notifications/meeting_reminder_service.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Notifikasi lokal disiapkan tanpa menahan startup; kegagalan plugin tidak
  // boleh menggagalkan aplikasi.
  unawaited(MeetingReminderService.instance.initialize());
  runApp(const ProviderScope(child: PriVisApp()));
}

class PriVisApp extends ConsumerWidget {
  const PriVisApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    MeetingReminderService.instance.onNotificationTap = (meetingId) {
      router.pushNamed(
        AppRoutes.meetingDetail,
        pathParameters: {'meetingId': meetingId},
      );
    };

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
