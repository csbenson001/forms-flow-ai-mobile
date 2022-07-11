import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

/// [SplashState] freezed class to hold splash screen state
@immutable
@freezed
class SplashState with _$SplashState {
  const factory SplashState({required bool startNavigationToHome}) =
      _SplashState;
}
