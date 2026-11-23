// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event_link_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(calendarEventLinkStore)
final calendarEventLinkStoreProvider = CalendarEventLinkStoreProvider._();

final class CalendarEventLinkStoreProvider
    extends
        $FunctionalProvider<
          CalendarEventLinkStore,
          CalendarEventLinkStore,
          CalendarEventLinkStore
        >
    with $Provider<CalendarEventLinkStore> {
  CalendarEventLinkStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calendarEventLinkStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calendarEventLinkStoreHash();

  @$internal
  @override
  $ProviderElement<CalendarEventLinkStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CalendarEventLinkStore create(Ref ref) {
    return calendarEventLinkStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CalendarEventLinkStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CalendarEventLinkStore>(value),
    );
  }
}

String _$calendarEventLinkStoreHash() =>
    r'c0dd8d755e16f75a1b1ff85e2d658964287c33f5';
