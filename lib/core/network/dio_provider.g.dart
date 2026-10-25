// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Instance Dio tunggal untuk seluruh aplikasi.
/// JANGAN buat `Dio()` baru di dalam fitur — selalu ambil lewat provider ini.

@ProviderFor(dio)
final dioProvider = DioProvider._();

/// Instance Dio tunggal untuk seluruh aplikasi.
/// JANGAN buat `Dio()` baru di dalam fitur — selalu ambil lewat provider ini.

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// Instance Dio tunggal untuk seluruh aplikasi.
  /// JANGAN buat `Dio()` baru di dalam fitur — selalu ambil lewat provider ini.
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'8905b407ea58650f17c6490de19618a35be0302e';
