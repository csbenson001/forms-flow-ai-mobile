// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_form_submission_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$ViewFormSubmissionStateCopyWithImpl<$Res, ViewFormSubmissionState>;
  @useResult
  $Res call(
      {bool? isNoFormResourceFound,
      FormIoModel? formIoModel,
      bool? isLoadingForm});

  $FormIoModelCopyWith<$Res>? get formIoModel;
}

/// @nodoc
class _$ViewFormSubmissionStateCopyWithImpl<$Res,
        $Val extends ViewFormSubmissionState>
    implements $ViewFormSubmissionStateCopyWith<$Res> {
  _$ViewFormSubmissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNoFormResourceFound = freezed,
    Object? formIoModel = freezed,
    Object? isLoadingForm = freezed,
  }) {
    return _then(_value.copyWith(
      isNoFormResourceFound: freezed == isNoFormResourceFound
          ? _value.isNoFormResourceFound
          : isNoFormResourceFound // ignore: cast_nullable_to_non_nullable
              as bool?,
      formIoModel: freezed == formIoModel
          ? _value.formIoModel
          : formIoModel // ignore: cast_nullable_to_non_nullable
              as FormIoModel?,
      isLoadingForm: freezed == isLoadingForm
          ? _value.isLoadingForm
          : isLoadingForm // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FormIoModelCopyWith<$Res>? get formIoModel {
    if (_value.formIoModel == null) {
      return null;
    }

    return $FormIoModelCopyWith<$Res>(_value.formIoModel!, (value) {
      return _then(_value.copyWith(formIoModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ViewFormSubmissionStateCopyWith<$Res>
    implements $ViewFormSubmissionStateCopyWith<$Res> {
  factory _$$_ViewFormSubmissionStateCopyWith(_$_ViewFormSubmissionState value,
          $Res Function(_$_ViewFormSubmissionState) then) =
      __$$_ViewFormSubmissionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isNoFormResourceFound,
      FormIoModel? formIoModel,
      bool? isLoadingForm});

  @override
  $FormIoModelCopyWith<$Res>? get formIoModel;
}

/// @nodoc
class __$$_ViewFormSubmissionStateCopyWithImpl<$Res>
    extends _$ViewFormSubmissionStateCopyWithImpl<$Res,
        _$_ViewFormSubmissionState>
    implements _$$_ViewFormSubmissionStateCopyWith<$Res> {
  __$$_ViewFormSubmissionStateCopyWithImpl(_$_ViewFormSubmissionState _value,
      $Res Function(_$_ViewFormSubmissionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNoFormResourceFound = freezed,
    Object? formIoModel = freezed,
    Object? isLoadingForm = freezed,
  }) {
    return _then(_$_ViewFormSubmissionState(
      isNoFormResourceFound: freezed == isNoFormResourceFound
          ? _value.isNoFormResourceFound
          : isNoFormResourceFound // ignore: cast_nullable_to_non_nullable
              as bool?,
      formIoModel: freezed == formIoModel
          ? _value.formIoModel
          : formIoModel // ignore: cast_nullable_to_non_nullable
              as FormIoModel?,
      isLoadingForm: freezed == isLoadingForm
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
        (other.runtimeType == runtimeType &&
            other is _$_ViewFormSubmissionState &&
            (identical(other.isNoFormResourceFound, isNoFormResourceFound) ||
                other.isNoFormResourceFound == isNoFormResourceFound) &&
            (identical(other.formIoModel, formIoModel) ||
                other.formIoModel == formIoModel) &&
            (identical(other.isLoadingForm, isLoadingForm) ||
                other.isLoadingForm == isLoadingForm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isNoFormResourceFound, formIoModel, isLoadingForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewFormSubmissionStateCopyWith<_$_ViewFormSubmissionState>
      get copyWith =>
          __$$_ViewFormSubmissionStateCopyWithImpl<_$_ViewFormSubmissionState>(
              this, _$identity);
}

abstract class _ViewFormSubmissionState implements ViewFormSubmissionState {
  const factory _ViewFormSubmissionState(
      {final bool? isNoFormResourceFound,
      final FormIoModel? formIoModel,
      final bool? isLoadingForm}) = _$_ViewFormSubmissionState;

  @override
  bool? get isNoFormResourceFound;
  @override
  FormIoModel? get formIoModel;
  @override
  bool? get isLoadingForm;
  @override
  @JsonKey(ignore: true)
  _$$_ViewFormSubmissionStateCopyWith<_$_ViewFormSubmissionState>
      get copyWith => throw _privateConstructorUsedError;
}
