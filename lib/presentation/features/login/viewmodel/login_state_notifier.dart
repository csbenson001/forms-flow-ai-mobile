import 'package:formsflowai/presentation/features/login/state/login_state.dart';
import 'package:formsflowai/shared/toast/toast_message_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [loginStateProvider] state notifier disposable provider for the
/// [LoginStateNotifier] class
final loginStateProvider =
    StateNotifierProvider.autoDispose<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});

/// [LoginStateNotifier] to hold and update login state
class LoginStateNotifier extends StateNotifier<LoginState> {
  // We initialize the values for login state
  LoginStateNotifier()
      : super(const LoginState(
            isPasswordVisible: false,
            isSubmitted: false,
            toastStateDM: ToastStateDM(),
            isLoginSuccess: false,
            isAgreedToTerms: false));

  /// Method to update show/hide password
  void updatePasswordVisible() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  /// Method to update submitted status to start page immediate
  /// validation
  void updateSubmittedStatus() {
    state = state.copyWith(isSubmitted: true);
  }

  /// Method to update agree to terms and conditions
  void updateAgreedToTermsAndConditions({required bool isAgreed}) {
    state = state.copyWith(isAgreedToTerms: isAgreed);
  }

  /// Method to show toast message
  /// Input Parameters
  /// [Error]
  /// [Info]
  void showToastMessage({String? error, String? info}) {
    if (info != null) {
      state =
          state.copyWith(toastStateDM: state.toastStateDM.copyWith(info: info));
    } else if (error != null) {
      state = state.copyWith(
          toastStateDM: state.toastStateDM.copyWith(error: error));
    }
  }

  /// Method to update login Success
  void updateLoginSuccess() {
    state = state.copyWith(isLoginSuccess: true);
  }
}
