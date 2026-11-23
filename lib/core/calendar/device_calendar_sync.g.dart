// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_calendar_sync.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deviceCalendarSync)
final deviceCalendarSyncProvider = DeviceCalendarSyncProvider._();

final class DeviceCalendarSyncProvider
    extends
        $FunctionalProvider<
          DeviceCalendarSync,
          DeviceCalendarSync,
          DeviceCalendarSync
        >
    with $Provider<DeviceCalendarSync> {
  DeviceCalendarSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceCalendarSyncProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceCalendarSyncHash();

  @$internal
  @override
  $ProviderElement<DeviceCalendarSync> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeviceCalendarSync create(Ref ref) {
    return deviceCalendarSync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceCalendarSync value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceCalendarSync>(value),
    );
  }
}

String _$deviceCalendarSyncHash() =>
    r'01d8df232a8460fc57cc81fff39b73b5e3a106e4';
