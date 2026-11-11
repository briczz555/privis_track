// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cacheStore)
final cacheStoreProvider = CacheStoreProvider._();

final class CacheStoreProvider
    extends $FunctionalProvider<SnapshotCache, SnapshotCache, SnapshotCache>
    with $Provider<SnapshotCache> {
  CacheStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cacheStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cacheStoreHash();

  @$internal
  @override
  $ProviderElement<SnapshotCache> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SnapshotCache create(Ref ref) {
    return cacheStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SnapshotCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SnapshotCache>(value),
    );
  }
}

String _$cacheStoreHash() => r'74ffd26a76d0f231c513ab1e495babd8ab1a800f';
