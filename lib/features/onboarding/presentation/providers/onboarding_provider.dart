import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_provider.g.dart';

/// Key penyimpanan status onboarding di SharedPreferences.
const onboardingSeenKey = 'onboarding_seen';

/// Nilai awal dibaca sekali di `main()` lalu di-override ke provider ini.
///
/// Default `false` agar instalasi baru selalu menampilkan onboarding; test
/// yang tidak menguji onboarding cukup meng-override menjadi `true`.
@Riverpod(keepAlive: true)
bool initialOnboardingSeen(Ref ref) => false;

/// Status onboarding pada sesi berjalan.
@Riverpod(keepAlive: true)
class OnboardingSeen extends _$OnboardingSeen {
  @override
  bool build() => ref.watch(initialOnboardingSeenProvider);

  /// Dipanggil saat user menekan "Lewati" atau "Mulai".
  Future<void> complete() async {
    state = true;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingSeenKey, true);
  }
}
