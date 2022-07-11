// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  _LoginState call(
      {required bool isPasswordVisible,
      required bool isSubmitted,
      required ToastStateDM toastStateDM,
      required bool isLoginSuccess,
      required bool isAgreedToTerms}) {
    return _LoginState(
      isPasswordVisible: isPasswordVisible,
      isSubmitted: isSubmitted,
      toastStateDM: toastStateDM,
      isLoginSuccess: isLoginSuccess,
      isAgreedToTerms: isAgreedToTerms,
    );
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  bool get isSubmitted => throw _privateConstructorUsedError;
  ToastStateDM get toastStateDM => throw _privateConstructorUsedError;
  bool get isLoginSuccess => throw _privateConstructorUsedError;
  bool get isAgreedToTerms => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {bool isPasswordVisible,
      bool isSubmitted,
      ToastStateDM toastStateDM,
      bool isLoginSuccess,
      bool isAgreedToTerms});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? isPasswordVisible = freezed,
    Object? isSubmitted = freezed,
    Object? toastStateDM = freezed,
    Object? isLoginSuccess = freezed,
    Object? isAgreedToTerms = freezed,
  }) {
    return _then(_value.copyWith(
      isPasswordVisible: isPasswordVisible == freezed
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitted: isSubmitted == freezed
          ? _value.isSubmitted
          : isSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      toastStateDM: toastStateDM == freezed
          ? _value.toastStateDM
          : toastStateDM // ignore: cast_nullable_to_non_nullable
              as ToastStateDM,
      isLoginSuccess: isLoginSuccess == freezed
          ? _value.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreedToTerms: isAgreedToTerms == freezed
          ? _value.isAgreedToTerms
          : isAgreedToTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) then) =
      __$LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isPasswordVisible,
      bool isSubmitted,
      ToastStateDM toastStateDM,
      bool isLoginSuccess,
      bool isAgreedToTerms});
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(
      _LoginState _value, $Res Function(_LoginState) _then)
      : super(_value, (v) => _then(v as _LoginState));

  @override
  _LoginState get _value => super._value as _LoginState;

  @override
  $Res call({
    Object? isPasswordVisible = freezed,
    Object? isSubmitted = freezed,
    Object? toastStateDM = freezed,
    Object? isLoginSuccess = freezed,
    Object? isAgreedToTerms = freezed,
  }) {
    return _then(_LoginState(
      isPasswordVisible: isPasswordVisible == freezed
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitted: isSubmitted == freezed
          ? _value.isSubmitted
          : isSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      toastStateDM: toastStateDM == freezed
          ? _value.toastStateDM
          : toastStateDM // ignore: cast_nullable_to_non_nullable
              as ToastStateDM,
      isLoginSuccess: isLoginSuccess == freezed
          ? _value.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreedToTerms: isAgreedToTerms == freezed
          ? _value.isAgreedToTerms
          : isAgreedToTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  const _$_LoginState(
      {required this.isPasswordVisible,
      required this.isSubmitted,
      required this.toastStateDM,
      required this.isLoginSuccess,
      required this.isAgreedToTerms});

  @override
  final bool isPasswordVisible;
  @override
  final bool isSubmitted;
  @override
  final ToastStateDM toastStateDM;
  @override
  final bool isLoginSuccess;
  @override
  final bool isAgreedToTerms;

  @override
  String toString() {
    return 'LoginState(isPasswordVisible: $isPasswordVisible, isSubmitted: $isSubmitted, toastStateDM: $toastStateDM, isLoginSuccess: $isLoginSuccess, isAgreedToTerms: $isAgreedToTerms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginState &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                const DeepCollectionEquality()
                    .equals(other.isPasswordVisible, isPasswordVisible)) &&
            (identical(other.isSubmitted, isSubmitted) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitted, isSubmitted)) &&
            (identical(other.toastStateDM, toastStateDM) ||
                const DeepCollectionEquality()
                    .equals(other.toastStateDM, toastStateDM)) &&
            (identical(other.isLoginSuccess, isLoginSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isLoginSuccess, isLoginSuccess)) &&
            (identical(other.isAgreedToTerms, isAgreedToTerms) ||
                const DeepCollectionEquality()
                    .equals(other.isAgreedToTerms, isAgreedToTerms)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isPasswordVisible) ^
      const DeepCollectionEquality().hash(isSubmitted) ^
      const DeepCollectionEquality().hash(toastStateDM) ^
      const DeepCollectionEquality().hash(isLoginSuccess) ^
      const DeepCollectionEquality().hash(isAgreedToTerms);

  @JsonKey(ignore: true)
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {required bool isPasswordVisible,
      required bool isSubmitted,
      required ToastStateDM toastStateDM,
      required bool isLoginSuccess,
      required bool isAgreedToTerms}) = _$_LoginState;

  @override
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  @override
  bool get isSubmitted => throw _privateConstructorUsedError;
  @override
  ToastStateDM get toastStateDM => throw _privateConstructorUsedError;
  @override
  bool get isLoginSuccess => throw _privateConstructorUsedError;
  @override
  bool get isAgreedToTerms => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
