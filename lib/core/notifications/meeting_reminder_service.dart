import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

/// Satu pengingat meeting yang akan dijadwalkan sebagai notifikasi lokal.
@immutable
class MeetingReminder {
  const MeetingReminder({
    required this.meetingId,
    required this.title,
    required this.body,
    required this.scheduledAt,
  });

  final String meetingId;
  final String title;
  final String body;

  /// Waktu absolut (instant) kapan notifikasi tampil.
  final DateTime scheduledAt;
}

/// Pengingat meeting memakai notifikasi lokal — tanpa push server.
///
/// Semua pengingat dijadwalkan ulang setiap kali daftar meeting pada rentang
/// kalender dimuat. Karena itu jadwal baru tersinkron setelah pengguna membuka
/// kalender (di situlah datanya tersedia), dan pengingat lama dibatalkan agar
/// tidak ada duplikat.
class MeetingReminderService {
  MeetingReminderService._();

  static final instance = MeetingReminderService._();

  static const _channelId = 'meeting_reminders';
  static const _channelName = 'Pengingat meeting';
  static const _channelDescription =
      'Pemberitahuan sebelum meeting dimulai.';

  final _plugin = FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  bool _permissionRequested = false;

  /// Di unit/widget test plugin platform tidak terdaftar, jadi lewati semua
  /// panggilan native agar tidak menghasilkan error yang membingungkan.
  bool get _isTestEnvironment =>
      Platform.environment.containsKey('FLUTTER_TEST');

  /// Dipanggil saat notifikasi diketuk, membawa id meeting.
  ValueChanged<String>? onNotificationTap;

  Future<void> initialize() async {
    if (_initialized || _isTestEnvironment) return;
    _initialized = true;

    try {
      const settings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      );

      await _plugin.initialize(
        settings: settings,
        onDidReceiveNotificationResponse: (response) {
          final meetingId = response.payload;
          if (meetingId == null || meetingId.isEmpty) return;
          onNotificationTap?.call(meetingId);
        },
      );

      await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(
            const AndroidNotificationChannel(
              _channelId,
              _channelName,
              description: _channelDescription,
              importance: Importance.high,
            ),
          );
    } catch (error) {
      // Plugin tidak tersedia (mis. widget test) — jangan ganggu alur utama.
      debugPrint('MeetingReminderService.initialize gagal: $error');
    }
  }

  /// Menyinkronkan pengingat. [reminders] harus berisi seluruh meeting pada
  /// rentang yang sedang dimuat supaya tidak ada jadwal yang tertinggal.
  Future<void> sync(List<MeetingReminder> reminders) async {
    await initialize();
    if (_isTestEnvironment) return;

    try {
      await _requestPermissionOnce();
      await _plugin.cancelAll();

      final now = DateTime.now();
      var id = 0;
      for (final reminder in reminders) {
        if (!reminder.scheduledAt.isAfter(now)) continue;

        await _plugin.zonedSchedule(
          id: id++,
          title: reminder.title,
          body: reminder.body,
          scheduledDate: tz.TZDateTime.from(
            reminder.scheduledAt.toUtc(),
            tz.UTC,
          ),
          notificationDetails: const NotificationDetails(
            android: AndroidNotificationDetails(
              _channelId,
              _channelName,
              channelDescription: _channelDescription,
              importance: Importance.high,
              priority: Priority.high,
            ),
            iOS: DarwinNotificationDetails(),
          ),
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          payload: reminder.meetingId,
        );
      }
    } catch (error) {
      debugPrint('MeetingReminderService.sync gagal: $error');
    }
  }

  Future<void> _requestPermissionOnce() async {
    if (_permissionRequested) return;
    _permissionRequested = true;

    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android != null) {
      await android.requestNotificationsPermission();
      return;
    }

    await _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }
}
