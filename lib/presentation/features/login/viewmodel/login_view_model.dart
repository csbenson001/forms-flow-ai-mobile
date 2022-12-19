import 'package:flutter/scheduler.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/base/viewmodel/base_notifier_view_model.dart';
import 'package:formsflowai/presentation/features/login/usecases/fetch_user_info_usecase.dart';
import 'package:formsflowai/presentation/features/login/usecases/login_user_usecase.dart';
import 'package:formsflowai/presentation/features/login/usecases/save_user_details_usecase.dart';
import 'package:formsflowai/presentation/features/login/viewmodel/login_state_notifier.dart';
import 'package:formsflowai/shared/app_status.dart';
import 'package:formsflowai_shared/utils/api/api_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/preferences/app_preference.dart';
import '../../../../shared/app_strings.dart';
import '../usecases/login_keycloak_authenticator_usecase.dart';

/// [LoginViewModel] to hold all bussiness logic related to
/// Login Screen
class LoginViewModel extends BaseNotifierViewModel {
  LoginViewModel(
      {required this.appPreferences,
      required this.loginUserCase,
      required this.fetchUserInfoUseCase,
      required this.saveUserDetailsUsecase,
      required this.loginKeycloakAuthenticatorUserCase,
      required this.ref});

  /// UseCases
  final LoginUserCase loginUserCase;
  final FetchUserInfoUseCase fetchUserInfoUseCase;
  final AppPreferences appPreferences;
  final LoginKeycloakAuthenticatorUserCase loginKeycloakAuthenticatorUserCase;
  final SaveUserDetailsUseCase saveUserDetailsUsecase;
  final Ref ref;

  LoginStatus _showLoginApiLoadingProgress = LoginStatus.initial;
  LoginStatus get showLoginApiLoadingProgress => _showLoginApiLoadingProgress;

  /// Function to update password visibility
  void updatePasswordVisible() {
    ref.read(loginStateProvider.notifier).updatePasswordVisible();
  }

  /// Function to update submitted status
  void updateSubmittedStatus() {
    ref.read(loginStateProvider.notifier).updateSubmittedStatus();
  }

  /// Function to update submitted status
  /// Input Parameters
  /// [AgreeToTerms]
  void updateAgreedToTermsAndConditions({required bool isAgreed}) {
    ref
        .read(loginStateProvider.notifier)
        .updateAgreedToTermsAndConditions(isAgreed: isAgreed);
  }

  /// Function to call api to login User
  /// fold response and handle the on recieve response on right
  /// after successful login call [_fetchUserInfo] function to get
  /// user info response
  /// Input Parameters
  /// [UserName]
  /// [Password]
  void loginUser({required String userName, required String password}) {
    showProgressLoading();
    loginUserCase
        .call(
            params: LoginParams(
                userName: userName.trim(), password: password.trim()))
        .then((value) {
      value.fold((error) {
        dismissProgressLoading();
        if (error is NoConnectionFailure) {
          ref
              .read(loginStateProvider.notifier)
              .showToastMessage(error: Strings.loginErrorNoInternet);
        } else {
          ref
              .read(loginStateProvider.notifier)
              .showToastMessage(error: Strings.loginErrorInvalidCredentials);
        }
      }, (tokenResponse) async {
        await _fetchUserInfo(
            accessToken: tokenResponse.accessToken ?? '',
            refreshToken: tokenResponse.refreshToken ?? '');
      });
    });
  }

  /// Function to call api to login User
  /// fold response and handle the on recieve response on right
  /// after successful login call [_fetchUserInfo] function to get
  /// user info response
  /// Input Parameters
  /// [UserName]
  /// [Password]
  Future<void> loginUserKeycloakExternal() async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _showLoginApiLoadingProgress = LoginStatus.launched;
      notifyListeners();
    });
    try {
      final loginAuthenticatorResponse =
          await loginKeycloakAuthenticatorUserCase.call(
              params: const LoginKeycloakAuthenticatorParams());
      loginAuthenticatorResponse.fold((l) {
        _showLoginApiLoadingProgress = LoginStatus.failure;
        notifyListeners();
      }, (result) async {
        _showLoginApiLoadingProgress = LoginStatus.success;
        notifyListeners();

        await _fetchUserInfo(
            accessToken: result.accessToken ?? '',
            refreshToken: result.refreshToken ?? '');
      });
    } catch (e) {
      _showLoginApiLoadingProgress = LoginStatus.failure;
      notifyListeners();
    }
  }

  /// Function to fetch User Info after the successful login
  /// Input Parameters
  /// [AccessToken]
  /// [RefreshToken]
  Future<void> _fetchUserInfo(
      {required String accessToken, required String refreshToken}) async {
    var userInfoResponse = await fetchUserInfoUseCase.call(
        params: FetchUserInfoParams(
            accessToken: APIUtils.getBearerToken(accessToken)));
    userInfoResponse.fold((l) {
      _showLoginApiLoadingProgress = LoginStatus.failure;
      notifyListeners();
    }, (infoResponse) async {
      _showLoginApiLoadingProgress = LoginStatus.success;
      notifyListeners();

      ref
          .read(loginStateProvider.notifier)
          .showToastMessage(info: Strings.loginLabelSuccess);

      /// Call save details useCase to add user info into the shared preference
      saveUserDetailsUsecase.call(
          params: SaveUserDetailsParams(
              userInfoResponse: infoResponse,
              accessToken: accessToken,
              refreshToken: refreshToken));
      _navigateToHomeScreen();
    });
  }

  /// Function to navigate to home screen
  void _navigateToHomeScreen() async {
    ref.read(loginStateProvider.notifier).updateLoginSuccess();
  }

  /// Function to open launcher to load terms and conditions webpage
  void openTermsAndConditionsUrlLauncher() {
    launch("https://formsflow.ai/service/");
  }
}
