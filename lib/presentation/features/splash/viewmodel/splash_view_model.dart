import 'dart:async';

import 'package:formsflowai/presentation/features/splash/viewmodel/splash_state_notifier.dart';
import 'package:formsflowai_shared/core/base/base_view_model.dart';
import 'package:formsflowai_shared/core/networkmanager/network_manager_controller.dart';
import 'package:formsflowai_shared/core/preferences/app_preference.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    var _duration =
        const Duration(seconds: FormsFlowAIConstants.splashTimerSeconds);
    return Timer(_duration, navigationPage);
  }

  /// Navigate to next page based on login status
  void navigationPage() {
    ref.read(splashScreenStateProvider.notifier).updateState(value: true);
  }
}
