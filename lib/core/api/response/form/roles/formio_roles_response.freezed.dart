// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formio_roles_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FormioRolesResponse _$FormioRolesResponseFromJson(Map<String, dynamic> json) {
  return _FormioRolesResponse.fromJson(json);
}

/// @nodoc
mixin _$FormioRolesResponse {
  List<Form>? get form => throw _privateConstructorUsedError;
  String? get jwtToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormioRolesResponseCopyWith<FormioRolesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormioRolesResponseCopyWith<$Res> {
  factory $FormioRolesResponseCopyWith(
          FormioRolesResponse value, $Res Function(FormioRolesResponse) then) =
      _$FormioRolesResponseCopyWithImpl<$Res, FormioRolesResponse>;
  @useResult
  $Res call({List<Form>? form, String? jwtToken});
}

/// @nodoc
class _$FormioRolesResponseCopyWithImpl<$Res, $Val extends FormioRolesResponse>
    implements $FormioRolesResponseCopyWith<$Res> {
  _$FormioRolesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = freezed,
    Object? jwtToken = freezed,
  }) {
    return _then(_value.copyWith(
      form: freezed == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as List<Form>?,
      jwtToken: freezed == jwtToken
          ? _value.jwtToken
          : jwtToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormioRolesResponseCopyWith<$Res>
    implements $FormioRolesResponseCopyWith<$Res> {
  factory _$$_FormioRolesResponseCopyWith(_$_FormioRolesResponse value,
          $Res Function(_$_FormioRolesResponse) then) =
      __$$_FormioRolesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Form>? form, String? jwtToken});
}

/// @nodoc
class __$$_FormioRolesResponseCopyWithImpl<$Res>
    extends _$FormioRolesResponseCopyWithImpl<$Res, _$_FormioRolesResponse>
    implements _$$_FormioRolesResponseCopyWith<$Res> {
  __$$_FormioRolesResponseCopyWithImpl(_$_FormioRolesResponse _value,
      $Res Function(_$_FormioRolesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = freezed,
    Object? jwtToken = freezed,
  }) {
    return _then(_$_FormioRolesResponse(
      form: freezed == form
          ? _value._form
          : form // ignore: cast_nullable_to_non_nullable
              as List<Form>?,
      jwtToken: freezed == jwtToken
          ? _value.jwtToken
          : jwtToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FormioRolesResponse implements _FormioRolesResponse {
  const _$_FormioRolesResponse({final List<Form>? form, this.jwtToken = ""})
      : _form = form;

  factory _$_FormioRolesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FormioRolesResponseFromJson(json);

  final List<Form>? _form;
  @override
  List<Form>? get form {
    final value = _form;
    if (value == null) return null;
    if (_form is EqualUnmodifiableListView) return _form;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String? jwtToken;

  @override
  String toString() {
    return 'FormioRolesResponse(form: $form, jwtToken: $jwtToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormioRolesResponse &&
            const DeepCollectionEquality().equals(other._form, _form) &&
            (identical(other.jwtToken, jwtToken) ||
                other.jwtToken == jwtToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_form), jwtToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormioRolesResponseCopyWith<_$_FormioRolesResponse> get copyWith =>
      __$$_FormioRolesResponseCopyWithImpl<_$_FormioRolesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FormioRolesResponseToJson(
      this,
    );
  }
}

abstract class _FormioRolesResponse implements FormioRolesResponse {
  const factory _FormioRolesResponse(
      {final List<Form>? form,
      final String? jwtToken}) = _$_FormioRolesResponse;

  factory _FormioRolesResponse.fromJson(Map<String, dynamic> json) =
      _$_FormioRolesResponse.fromJson;

  @override
  List<Form>? get form;
  @override
  String? get jwtToken;
  @override
  @JsonKey(ignore: true)
  _$$_FormioRolesResponseCopyWith<_$_FormioRolesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Form _$FormFromJson(Map<String, dynamic> json) {
  return _Form.fromJson(json);
}

/// @nodoc
mixin _$Form {
  String? get roleId => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormCopyWith<Form> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormCopyWith<$Res> {
  factory $FormCopyWith(Form value, $Res Function(Form) then) =
      _$FormCopyWithImpl<$Res, Form>;
  @useResult
  $Res call({String? roleId, String? type});
}

/// @nodoc
class _$FormCopyWithImpl<$Res, $Val extends Form>
    implements $FormCopyWith<$Res> {
  _$FormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormCopyWith<$Res> implements $FormCopyWith<$Res> {
  factory _$$_FormCopyWith(_$_Form value, $Res Function(_$_Form) then) =
      __$$_FormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? roleId, String? type});
}

/// @nodoc
class __$$_FormCopyWithImpl<$Res> extends _$FormCopyWithImpl<$Res, _$_Form>
    implements _$$_FormCopyWith<$Res> {
  __$$_FormCopyWithImpl(_$_Form _value, $Res Function(_$_Form) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_Form(
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Form implements _Form {
  const _$_Form({this.roleId, this.type});

  factory _$_Form.fromJson(Map<String, dynamic> json) => _$$_FormFromJson(json);

  @override
  final String? roleId;
  @override
  final String? type;

  @override
  String toString() {
    return 'Form(roleId: $roleId, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Form &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roleId, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormCopyWith<_$_Form> get copyWith =>
      __$$_FormCopyWithImpl<_$_Form>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FormToJson(
      this,
    );
  }
}

abstract class _Form implements Form {
  const factory _Form({final String? roleId, final String? type}) = _$_Form;

  factory _Form.fromJson(Map<String, dynamic> json) = _$_Form.fromJson;

  @override
  String? get roleId;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_FormCopyWith<_$_Form> get copyWith => throw _privateConstructorUsedError;
}
