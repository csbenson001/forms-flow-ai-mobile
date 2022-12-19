import 'dart:async';

import 'package:formsflowai/presentation/features/splash/viewmodel/splash_state_notifier.dart';
import 'package:formsflowai/utils/jwttoken/jwttoken_utils.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/networkmanager/network_manager_controller.dart';
import '../../../../core/preferences/app_preference.dart';
import '../../../base/viewmodel/base_view_model.dart';
import '../../login/usecases/refresk_keycloak_token_usecase.dart';

/// [SplashViewModel] contains business logic related to
/// Splash Screen
class SplashViewModel extends BaseViewModel {
  final AppPreferences appPreferences;
  final NetworkManagerController networkManagerController;
  final Ref ref;
  final RefreshKeyCloakTokenUserCase refreshKeyCloakTokenUserCase;

  SplashViewModel(
      {required this.appPreferences,
      required this.ref,
      required this.refreshKeyCloakTokenUserCase,
      required this.networkManagerController});

  // onInit Method
  onInit() {
    initTimer();
  }

  /// Initialize Timer to display splash screen logo
  initTimer() async {
    if (appPreferences.isUserLoggedIn() &&
        TokenUtils.isTokenExpired(token: appPreferences.getAccessToken())) {
      refreshAccessTokenAndNavigateToNextScreen();
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
  void refreshAccessTokenAndNavigateToNextScreen() {
    refreshKeyCloakTokenUserCase
        .call(
            params: RefreshKeycloakTokenParams(
                refreshOfflineToken: appPreferences.getRefreshToken()))
        .then((value) {
      value.fold((l) {
        appPreferences.clear();
        navigateToNextScreen();
      }, (r) {
        appPreferences
            .setAccessToken(r.accessToken ?? appPreferences.getAccessToken());
        appPreferences.setRefreshToken(
            r.refreshToken ?? appPreferences.getRefreshToken());
        navigateToNextScreen();
      });
    });
  }
}
