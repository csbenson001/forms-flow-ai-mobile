import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/toast/toast_message_provider.dart';

part 'login_state.freezed.dart';

/// [LoginState] freezed data class to hold login class state
@immutable
@freezed
class LoginState with _$LoginState {
  const factory LoginState(
      {required bool isPasswordVisible,
      required bool isSubmitted,
      required ToastStateDM toastStateDM,
      required bool isLoginSuccess,
      required bool isAgreedToTerms}) = _LoginState;
}
