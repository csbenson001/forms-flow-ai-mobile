import 'dart:async';

import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai/presentation/features/splash/viewmodel/splash_state_notifier.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/networkmanager/network_manager_controller.dart';
import '../../../../core/preferences/app_preference.dart';
import '../../../base/viewmodel/base_view_model.dart';

/// [SplashViewModel] contains bussiness logic related to
/// Splash Screen
class SplashViewModel extends BaseViewModel {
  final AppPreferences appPreferences;
  final NetworkManagerController networkManagerController;
  final Ref ref;

  SplashViewModel(
      {required this.appPreferences,
      required this.ref,
      required this.networkManagerController});

  // onInit Method
  onInit() {
    initTimer();
  }

  /// Initialize Timer to display splash screen logo
  initTimer() async {
    if (appPreferences.isUserLoggedIn()) {
      // refreshAccessToken();
      var _duration =
          const Duration(seconds: FormsFlowAIConstants.splashTimerSeconds);
      return Timer(_duration, navigateToNextScreen);
    } else {
      var _duration =
          const Duration(seconds: FormsFlowAIConstants.splashTimerSeconds);
      return Timer(_duration, navigateToNextScreen);
    }
  }

  /// Navigate to next page based on login status
  void navigateToNextScreen() {
    ref.read(splashScreenStateProvider.notifier).updateState(value: true);
  }

  /// Function to refresh the access token
  void refreshAccessToken() {
    ref.read(tokenServiceProvider).refreshKeycloakToken().then((value) {
      value.fold((l) {
        print("--- Refresh Failure ----");
        appPreferences.clear();
        navigateToNextScreen();
      }, (r) {
        appPreferences
            .setAccessToken(r.accessToken ?? appPreferences.getAccessToken());
        navigateToNextScreen();
      });
    });
  }
}
