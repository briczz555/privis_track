// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Nilai awal dibaca sekali di `main()` lalu di-override ke provider ini.
///
/// Default `false` agar instalasi baru selalu menampilkan onboarding; test
/// yang tidak menguji onboarding cukup meng-override menjadi `true`.

@ProviderFor(initialOnboardingSeen)
final initialOnboardingSeenProvider = InitialOnboardingSeenProvider._();

/// Nilai awal dibaca sekali di `main()` lalu di-override ke provider ini.
///
/// Default `false` agar instalasi baru selalu menampilkan onboarding; test
/// yang tidak menguji onboarding cukup meng-override menjadi `true`.

final class InitialOnboardingSeenProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Nilai awal dibaca sekali di `main()` lalu di-override ke provider ini.
  ///
  /// Default `false` agar instalasi baru selalu menampilkan onboarding; test
  /// yang tidak menguji onboarding cukup meng-override menjadi `true`.
  InitialOnboardingSeenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initialOnboardingSeenProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initialOnboardingSeenHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return initialOnboardingSeen(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$initialOnboardingSeenHash() =>
    r'24c25dea30c83ac8dd6916a3bb81f03cb1817172';

/// Status onboarding pada sesi berjalan.

@ProviderFor(OnboardingSeen)
final onboardingSeenProvider = OnboardingSeenProvider._();

/// Status onboarding pada sesi berjalan.
final class OnboardingSeenProvider
    extends $NotifierProvider<OnboardingSeen, bool> {
  /// Status onboarding pada sesi berjalan.
  OnboardingSeenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingSeenProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingSeenHash();

  @$internal
  @override
  OnboardingSeen create() => OnboardingSeen();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$onboardingSeenHash() => r'e490330ad31f0955f1d8350d164ef85cae62a7f9';

/// Status onboarding pada sesi berjalan.

abstract class _$OnboardingSeen extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
