// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'view_form_submission_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ViewFormSubmissionStateTearOff {
  const _$ViewFormSubmissionStateTearOff();

  _ViewFormSubmissionState call(
      {bool? isNoFormResourceFound,
      FormIoModel? formIoModel,
      bool? isLoadingForm}) {
    return _ViewFormSubmissionState(
      isNoFormResourceFound: isNoFormResourceFound,
      formIoModel: formIoModel,
      isLoadingForm: isLoadingForm,
    );
  }
}

/// @nodoc
const $ViewFormSubmissionState = _$ViewFormSubmissionStateTearOff();

/// @nodoc
mixin _$ViewFormSubmissionState {
  bool? get isNoFormResourceFound => throw _privateConstructorUsedError;
  FormIoModel? get formIoModel => throw _privateConstructorUsedError;
  bool? get isLoadingForm => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewFormSubmissionStateCopyWith<ViewFormSubmissionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewFormSubmissionStateCopyWith<$Res> {
  factory $ViewFormSubmissionStateCopyWith(ViewFormSubmissionState value,
          $Res Function(ViewFormSubmissionState) then) =
      _$ViewFormSubmissionStateCopyWithImpl<$Res>;
  $Res call(
      {bool? isNoFormResourceFound,
      FormIoModel? formIoModel,
      bool? isLoadingForm});

  $FormIoModelCopyWith<$Res>? get formIoModel;
}

/// @nodoc
class _$ViewFormSubmissionStateCopyWithImpl<$Res>
    implements $ViewFormSubmissionStateCopyWith<$Res> {
  _$ViewFormSubmissionStateCopyWithImpl(this._value, this._then);

  final ViewFormSubmissionState _value;
  // ignore: unused_field
  final $Res Function(ViewFormSubmissionState) _then;

  @override
  $Res call({
    Object? isNoFormResourceFound = freezed,
    Object? formIoModel = freezed,
    Object? isLoadingForm = freezed,
  }) {
    return _then(_value.copyWith(
      isNoFormResourceFound: isNoFormResourceFound == freezed
          ? _value.isNoFormResourceFound
          : isNoFormResourceFound // ignore: cast_nullable_to_non_nullable
              as bool?,
      formIoModel: formIoModel == freezed
          ? _value.formIoModel
          : formIoModel // ignore: cast_nullable_to_non_nullable
              as FormIoModel?,
      isLoadingForm: isLoadingForm == freezed
          ? _value.isLoadingForm
          : isLoadingForm // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $FormIoModelCopyWith<$Res>? get formIoModel {
    if (_value.formIoModel == null) {
      return null;
    }

    return $FormIoModelCopyWith<$Res>(_value.formIoModel!, (value) {
      return _then(_value.copyWith(formIoModel: value));
    });
  }
}

/// @nodoc
abstract class _$ViewFormSubmissionStateCopyWith<$Res>
    implements $ViewFormSubmissionStateCopyWith<$Res> {
  factory _$ViewFormSubmissionStateCopyWith(_ViewFormSubmissionState value,
          $Res Function(_ViewFormSubmissionState) then) =
      __$ViewFormSubmissionStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? isNoFormResourceFound,
      FormIoModel? formIoModel,
      bool? isLoadingForm});

  @override
  $FormIoModelCopyWith<$Res>? get formIoModel;
}

/// @nodoc
class __$ViewFormSubmissionStateCopyWithImpl<$Res>
    extends _$ViewFormSubmissionStateCopyWithImpl<$Res>
    implements _$ViewFormSubmissionStateCopyWith<$Res> {
  __$ViewFormSubmissionStateCopyWithImpl(_ViewFormSubmissionState _value,
      $Res Function(_ViewFormSubmissionState) _then)
      : super(_value, (v) => _then(v as _ViewFormSubmissionState));

  @override
  _ViewFormSubmissionState get _value =>
      super._value as _ViewFormSubmissionState;

  @override
  $Res call({
    Object? isNoFormResourceFound = freezed,
    Object? formIoModel = freezed,
    Object? isLoadingForm = freezed,
  }) {
    return _then(_ViewFormSubmissionState(
      isNoFormResourceFound: isNoFormResourceFound == freezed
          ? _value.isNoFormResourceFound
          : isNoFormResourceFound // ignore: cast_nullable_to_non_nullable
              as bool?,
      formIoModel: formIoModel == freezed
          ? _value.formIoModel
          : formIoModel // ignore: cast_nullable_to_non_nullable
              as FormIoModel?,
      isLoadingForm: isLoadingForm == freezed
          ? _value.isLoadingForm
          : isLoadingForm // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_ViewFormSubmissionState implements _ViewFormSubmissionState {
  const _$_ViewFormSubmissionState(
      {this.isNoFormResourceFound, this.formIoModel, this.isLoadingForm});

  @override
  final bool? isNoFormResourceFound;
  @override
  final FormIoModel? formIoModel;
  @override
  final bool? isLoadingForm;

  @override
  String toString() {
    return 'ViewFormSubmissionState(isNoFormResourceFound: $isNoFormResourceFound, formIoModel: $formIoModel, isLoadingForm: $isLoadingForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ViewFormSubmissionState &&
            (identical(other.isNoFormResourceFound, isNoFormResourceFound) ||
                const DeepCollectionEquality().equals(
                    other.isNoFormResourceFound, isNoFormResourceFound)) &&
            (identical(other.formIoModel, formIoModel) ||
                const DeepCollectionEquality()
                    .equals(other.formIoModel, formIoModel)) &&
            (identical(other.isLoadingForm, isLoadingForm) ||
                const DeepCollectionEquality()
                    .equals(other.isLoadingForm, isLoadingForm)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isNoFormResourceFound) ^
      const DeepCollectionEquality().hash(formIoModel) ^
      const DeepCollectionEquality().hash(isLoadingForm);

  @JsonKey(ignore: true)
  @override
  _$ViewFormSubmissionStateCopyWith<_ViewFormSubmissionState> get copyWith =>
      __$ViewFormSubmissionStateCopyWithImpl<_ViewFormSubmissionState>(
          this, _$identity);
}

abstract class _ViewFormSubmissionState implements ViewFormSubmissionState {
  const factory _ViewFormSubmissionState(
      {bool? isNoFormResourceFound,
      FormIoModel? formIoModel,
      bool? isLoadingForm}) = _$_ViewFormSubmissionState;

  @override
  bool? get isNoFormResourceFound => throw _privateConstructorUsedError;
  @override
  FormIoModel? get formIoModel => throw _privateConstructorUsedError;
  @override
  bool? get isLoadingForm => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ViewFormSubmissionStateCopyWith<_ViewFormSubmissionState> get copyWith =>
      throw _privateConstructorUsedError;
}
