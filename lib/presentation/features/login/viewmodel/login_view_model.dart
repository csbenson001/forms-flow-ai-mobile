import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/login/usecases/fetch_user_info_usecase.dart';
import 'package:formsflowai/presentation/features/login/usecases/login_user_usecase.dart';
import 'package:formsflowai/presentation/features/login/usecases/save_user_details_usecase.dart';
import 'package:formsflowai/presentation/features/login/viewmodel/login_state_notifier.dart';
import 'package:formsflowai_shared/core/base/base_view_model.dart';
import 'package:formsflowai_shared/core/preferences/app_preference.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/utils/api/api_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [LoginViewModel] to hold all bussiness logic related to
/// Login Screen
class LoginViewModel extends BaseViewModel {
  LoginViewModel(
      {required this.appPreferences,
      required this.loginUserCase,
      required this.fetchUserInfoUseCase,
      required this.saveUserDetailsUsecase,
      required this.ref});

  /// UseCases
  final LoginUserCase loginUserCase;
  final FetchUserInfoUseCase fetchUserInfoUseCase;
  final AppPreferences appPreferences;
  final SaveUserDetailsUseCase saveUserDetailsUsecase;
  final Ref ref;

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
        if (Error is NoConnectionFailure) {
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
      dismissProgressLoading();
    }, (infoResponse) async {
      dismissProgressLoading();
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
}
