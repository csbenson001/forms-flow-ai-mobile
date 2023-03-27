// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormIoModel {
  String? get formComponents => throw _privateConstructorUsedError;
  String? get formData => throw _privateConstructorUsedError;
  String? get formUrl => throw _privateConstructorUsedError;
  String? get formSubmissionUrl => throw _privateConstructorUsedError;
  bool? get readOnly => throw _privateConstructorUsedError;
  String? get formResourceId => throw _privateConstructorUsedError;
  String? get formSubmissionId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormIoModelCopyWith<FormIoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormIoModelCopyWith<$Res> {
  factory $FormIoModelCopyWith(
          FormIoModel value, $Res Function(FormIoModel) then) =
      _$FormIoModelCopyWithImpl<$Res, FormIoModel>;
  @useResult
  $Res call(
      {String? formComponents,
      String? formData,
      String? formUrl,
      String? formSubmissionUrl,
      bool? readOnly,
      String? formResourceId,
      String? formSubmissionId});
}

/// @nodoc
class _$FormIoModelCopyWithImpl<$Res, $Val extends FormIoModel>
    implements $FormIoModelCopyWith<$Res> {
  _$FormIoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formComponents = freezed,
    Object? formData = freezed,
    Object? formUrl = freezed,
    Object? formSubmissionUrl = freezed,
    Object? readOnly = freezed,
    Object? formResourceId = freezed,
    Object? formSubmissionId = freezed,
  }) {
    return _then(_value.copyWith(
      formComponents: freezed == formComponents
          ? _value.formComponents
          : formComponents // ignore: cast_nullable_to_non_nullable
              as String?,
      formData: freezed == formData
          ? _value.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as String?,
      formUrl: freezed == formUrl
          ? _value.formUrl
          : formUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      formSubmissionUrl: freezed == formSubmissionUrl
          ? _value.formSubmissionUrl
          : formSubmissionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      readOnly: freezed == readOnly
          ? _value.readOnly
          : readOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      formResourceId: freezed == formResourceId
          ? _value.formResourceId
          : formResourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      formSubmissionId: freezed == formSubmissionId
          ? _value.formSubmissionId
          : formSubmissionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormIoModelCopyWith<$Res>
    implements $FormIoModelCopyWith<$Res> {
  factory _$$_FormIoModelCopyWith(
          _$_FormIoModel value, $Res Function(_$_FormIoModel) then) =
      __$$_FormIoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? formComponents,
      String? formData,
      String? formUrl,
      String? formSubmissionUrl,
      bool? readOnly,
      String? formResourceId,
      String? formSubmissionId});
}

/// @nodoc
class __$$_FormIoModelCopyWithImpl<$Res>
    extends _$FormIoModelCopyWithImpl<$Res, _$_FormIoModel>
    implements _$$_FormIoModelCopyWith<$Res> {
  __$$_FormIoModelCopyWithImpl(
      _$_FormIoModel _value, $Res Function(_$_FormIoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formComponents = freezed,
    Object? formData = freezed,
    Object? formUrl = freezed,
    Object? formSubmissionUrl = freezed,
    Object? readOnly = freezed,
    Object? formResourceId = freezed,
    Object? formSubmissionId = freezed,
  }) {
    return _then(_$_FormIoModel(
      formComponents: freezed == formComponents
          ? _value.formComponents
          : formComponents // ignore: cast_nullable_to_non_nullable
              as String?,
      formData: freezed == formData
          ? _value.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as String?,
      formUrl: freezed == formUrl
          ? _value.formUrl
          : formUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      formSubmissionUrl: freezed == formSubmissionUrl
          ? _value.formSubmissionUrl
          : formSubmissionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      readOnly: freezed == readOnly
          ? _value.readOnly
          : readOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      formResourceId: freezed == formResourceId
          ? _value.formResourceId
          : formResourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      formSubmissionId: freezed == formSubmissionId
          ? _value.formSubmissionId
          : formSubmissionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_FormIoModel implements _FormIoModel {
  const _$_FormIoModel(
      {this.formComponents,
      this.formData,
      this.formUrl,
      this.formSubmissionUrl,
      this.readOnly,
      this.formResourceId,
      this.formSubmissionId});

  @override
  final String? formComponents;
  @override
  final String? formData;
  @override
  final String? formUrl;
  @override
  final String? formSubmissionUrl;
  @override
  final bool? readOnly;
  @override
  final String? formResourceId;
  @override
  final String? formSubmissionId;

  @override
  String toString() {
    return 'FormIoModel(formComponents: $formComponents, formData: $formData, formUrl: $formUrl, formSubmissionUrl: $formSubmissionUrl, readOnly: $readOnly, formResourceId: $formResourceId, formSubmissionId: $formSubmissionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormIoModel &&
            (identical(other.formComponents, formComponents) ||
                other.formComponents == formComponents) &&
            (identical(other.formData, formData) ||
                other.formData == formData) &&
            (identical(other.formUrl, formUrl) || other.formUrl == formUrl) &&
            (identical(other.formSubmissionUrl, formSubmissionUrl) ||
                other.formSubmissionUrl == formSubmissionUrl) &&
            (identical(other.readOnly, readOnly) ||
                other.readOnly == readOnly) &&
            (identical(other.formResourceId, formResourceId) ||
                other.formResourceId == formResourceId) &&
            (identical(other.formSubmissionId, formSubmissionId) ||
                other.formSubmissionId == formSubmissionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formComponents, formData,
      formUrl, formSubmissionUrl, readOnly, formResourceId, formSubmissionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormIoModelCopyWith<_$_FormIoModel> get copyWith =>
      __$$_FormIoModelCopyWithImpl<_$_FormIoModel>(this, _$identity);
}

abstract class _FormIoModel implements FormIoModel {
  const factory _FormIoModel(
      {final String? formComponents,
      final String? formData,
      final String? formUrl,
      final String? formSubmissionUrl,
      final bool? readOnly,
      final String? formResourceId,
      final String? formSubmissionId}) = _$_FormIoModel;

  @override
  String? get formComponents;
  @override
  String? get formData;
  @override
  String? get formUrl;
  @override
  String? get formSubmissionUrl;
  @override
  bool? get readOnly;
  @override
  String? get formResourceId;
  @override
  String? get formSubmissionId;
  @override
  @JsonKey(ignore: true)
  _$$_FormIoModelCopyWith<_$_FormIoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
