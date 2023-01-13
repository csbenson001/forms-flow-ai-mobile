import 'dart:async';

import 'package:formsflowai/presentation/features/splash/viewmodel/splash_state_notifier.dart';
import 'package:formsflowai/utils/general_util.dart';
import 'package:formsflowai/utils/jwttoken/jwttoken_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/networkmanager/network_manager_controller.dart';
import '../../../../core/preferences/app_preference.dart';
import '../../../../shared/formsflow_app_constants.dart';
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

  /// Initialize Timer to check if user logged in and token expiry
  initTimer() async {
    /// If userlogged in and refresh token is expired clear the session
    /// and navigate to the login screen
    const duration = Duration(seconds: FormsFlowAIConstants.splashTimerSeconds);
    try {
      if (appPreferences.isUserLoggedIn() &&
          !GeneralUtil.isStringEmpty(appPreferences.getRefreshToken()) &&
          TokenUtils.isTokenExpired(token: appPreferences.getRefreshToken())) {
        return Timer(duration, () async {
          await appPreferences.clear();
          navigateToNextScreen();
        });
      }

      /// If user logged in and access token is expired refresh token and
      /// navigate to home screen
      else if (appPreferences.isUserLoggedIn() &&
          TokenUtils.isTokenExpired(token: appPreferences.getAccessToken())) {
        refreshAccessTokenAndNavigateToNextScreen();
      } else {
        return Timer(duration, navigateToNextScreen);
      }
    } catch (e) {
      return Timer(duration, () async {
        await appPreferences.clear();
        navigateToNextScreen();
      });
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
      value.fold((l) async {
        await appPreferences.clear();
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
