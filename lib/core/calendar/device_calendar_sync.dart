import 'dart:io';

import 'package:device_calendar_plus/device_calendar_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../storage/calendar_event_link_store.dart';

part 'device_calendar_sync.g.dart';

/// Satu meeting yang dicerminkan ke kalender bawaan perangkat.
@immutable
class DeviceCalendarEvent {
  const DeviceCalendarEvent({
    required this.meetingId,
    required this.title,
    required this.startAt,
    required this.endAt,
    this.description,
    this.location,
    this.isCancelled = false,
  });

  final String meetingId;
  final String title;
  final DateTime startAt;
  final DateTime endAt;
  final String? description;
  final String? location;
  final bool isCancelled;
}

@Riverpod(keepAlive: true)
DeviceCalendarSync deviceCalendarSync(Ref ref) {
  return DeviceCalendarSync(ref.watch(calendarEventLinkStoreProvider));
}

/// Mencerminkan meeting ke kalender bawaan HP agar alarm dikelola sistem —
/// tetap berbunyi walau aplikasi di-force-stop.
class DeviceCalendarSync {
  DeviceCalendarSync(this._links);

  /// Pengingat standar: 30 menit sebelum meeting.
  static const reminderLeadTime = Duration(minutes: 30);

  final CalendarEventLinkStore _links;
  final DeviceCalendar _calendar = DeviceCalendar.instance;

  bool _permissionRequested = false;

  /// Di unit/widget test plugin platform tidak terdaftar.
  bool get _isTestEnvironment =>
      Platform.environment.containsKey('FLUTTER_TEST');

  /// Membuat/memperbarui/menghapus event sesuai kondisi meeting.
  ///
  /// `events` sebaiknya berisi seluruh meeting terkait user pada rentang yang
  /// dimuat, supaya event yang dibatalkan ikut terhapus.
  Future<void> sync(List<DeviceCalendarEvent> events) async {
    if (_isTestEnvironment || events.isEmpty) return;
    if (!await _ensureFullAccess()) return;

    final links = await _links.load();

    for (final event in events) {
      final existingId = links[event.meetingId];

      try {
        if (event.isCancelled) {
          if (existingId == null) continue;
          await _calendar.deleteEvent(instanceId: existingId);
          await _links.remove(event.meetingId);
          links.remove(event.meetingId);
          continue;
        }

        if (existingId == null) {
          final createdId = await _calendar.createEvent(
            title: event.title,
            description: event.description,
            location: event.location,
            startDate: event.startAt,
            endDate: event.endAt,
            reminders: const [reminderLeadTime],
          );
          await _links.save(event.meetingId, createdId);
          links[event.meetingId] = createdId;
        } else {
          await _calendar.updateEvent(
            instanceId: existingId,
            title: event.title,
            startDate: event.startAt,
            endDate: event.endAt,
            description: _patch(event.description),
            location: _patch(event.location),
            reminders: const Patch.set([reminderLeadTime]),
          );
        }
      } on DeviceCalendarException catch (error) {
        // Event dihapus manual dari kalender: buang tautan agar dibuat ulang
        // pada sinkronisasi berikutnya.
        if (error.errorCode == DeviceCalendarError.notFound) {
          await _links.remove(event.meetingId);
          links.remove(event.meetingId);
        }
        debugPrint(
          'Sinkronisasi kalender gagal (${event.meetingId}): ${error.message}',
        );
      } catch (error) {
        debugPrint('Sinkronisasi kalender gagal (${event.meetingId}): $error');
      }
    }
  }

  Future<bool> _ensureFullAccess() async {
    try {
      final status = await _calendar.hasPermissions();
      if (status == CalendarPermissionStatus.granted) return true;
      if (_permissionRequested) return false;

      _permissionRequested = true;
      final requested = await _calendar.requestPermissions(
        level: CalendarAccessLevel.full,
      );
      return requested == CalendarPermissionStatus.granted;
    } catch (error) {
      debugPrint('Izin kalender gagal diproses: $error');
      return false;
    }
  }

  /// Field opsional: `Patch.set` bila ada isinya, `Patch.clear` bila kosong.
  Patch<String> _patch(String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) return const Patch.clear();
    return Patch.set(trimmed);
  }
}
