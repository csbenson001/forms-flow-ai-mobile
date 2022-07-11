import 'package:formsflowai/presentation/features/splash/state/splash_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Defining [splashScreenStateProvider] as an auto disposable
/// provider ref object for the [ViewModel] class [SplashStateNotifier]
final splashScreenStateProvider =
    StateNotifierProvider.autoDispose<SplashStateNotifier, SplashState>((ref) {
  return SplashStateNotifier();
});

class SplashStateNotifier extends StateNotifier<SplashState> {
  SplashStateNotifier()
      : super(const SplashState(startNavigationToHome: false));

  /// Method to update splash screen state
  void updateState({required bool value}) {
    state = state.copyWith(startNavigationToHome: value);
  }
}
