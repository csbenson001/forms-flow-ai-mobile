// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'formio_roles_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FormioRolesResponse _$FormioRolesResponseFromJson(Map<String, dynamic> json) {
  return _FormioRolesResponse.fromJson(json);
}

/// @nodoc
class _$FormioRolesResponseTearOff {
  const _$FormioRolesResponseTearOff();

  _FormioRolesResponse call({List<Form>? form}) {
    return _FormioRolesResponse(
      form: form,
    );
  }

  FormioRolesResponse fromJson(Map<String, Object> json) {
    return FormioRolesResponse.fromJson(json);
  }
}

/// @nodoc
const $FormioRolesResponse = _$FormioRolesResponseTearOff();

/// @nodoc
mixin _$FormioRolesResponse {
  List<Form>? get form => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormioRolesResponseCopyWith<FormioRolesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormioRolesResponseCopyWith<$Res> {
  factory $FormioRolesResponseCopyWith(
          FormioRolesResponse value, $Res Function(FormioRolesResponse) then) =
      _$FormioRolesResponseCopyWithImpl<$Res>;
  $Res call({List<Form>? form});
}

/// @nodoc
class _$FormioRolesResponseCopyWithImpl<$Res>
    implements $FormioRolesResponseCopyWith<$Res> {
  _$FormioRolesResponseCopyWithImpl(this._value, this._then);

  final FormioRolesResponse _value;
  // ignore: unused_field
  final $Res Function(FormioRolesResponse) _then;

  @override
  $Res call({
    Object? form = freezed,
  }) {
    return _then(_value.copyWith(
      form: form == freezed
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as List<Form>?,
    ));
  }
}

/// @nodoc
abstract class _$FormioRolesResponseCopyWith<$Res>
    implements $FormioRolesResponseCopyWith<$Res> {
  factory _$FormioRolesResponseCopyWith(_FormioRolesResponse value,
          $Res Function(_FormioRolesResponse) then) =
      __$FormioRolesResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<Form>? form});
}

/// @nodoc
class __$FormioRolesResponseCopyWithImpl<$Res>
    extends _$FormioRolesResponseCopyWithImpl<$Res>
    implements _$FormioRolesResponseCopyWith<$Res> {
  __$FormioRolesResponseCopyWithImpl(
      _FormioRolesResponse _value, $Res Function(_FormioRolesResponse) _then)
      : super(_value, (v) => _then(v as _FormioRolesResponse));

  @override
  _FormioRolesResponse get _value => super._value as _FormioRolesResponse;

  @override
  $Res call({
    Object? form = freezed,
  }) {
    return _then(_FormioRolesResponse(
      form: form == freezed
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as List<Form>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FormioRolesResponse implements _FormioRolesResponse {
  const _$_FormioRolesResponse({this.form});

  factory _$_FormioRolesResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_FormioRolesResponseFromJson(json);

  @override
  final List<Form>? form;

  @override
  String toString() {
    return 'FormioRolesResponse(form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FormioRolesResponse &&
            (identical(other.form, form) ||
                const DeepCollectionEquality().equals(other.form, form)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(form);

  @JsonKey(ignore: true)
  @override
  _$FormioRolesResponseCopyWith<_FormioRolesResponse> get copyWith =>
      __$FormioRolesResponseCopyWithImpl<_FormioRolesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FormioRolesResponseToJson(this);
  }
}

abstract class _FormioRolesResponse implements FormioRolesResponse {
  const factory _FormioRolesResponse({List<Form>? form}) =
      _$_FormioRolesResponse;

  factory _FormioRolesResponse.fromJson(Map<String, dynamic> json) =
      _$_FormioRolesResponse.fromJson;

  @override
  List<Form>? get form => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FormioRolesResponseCopyWith<_FormioRolesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Form _$FormFromJson(Map<String, dynamic> json) {
  return _Form.fromJson(json);
}

/// @nodoc
class _$FormTearOff {
  const _$FormTearOff();

  _Form call({String? roleId, String? type}) {
    return _Form(
      roleId: roleId,
      type: type,
    );
  }

  Form fromJson(Map<String, Object> json) {
    return Form.fromJson(json);
  }
}

/// @nodoc
const $Form = _$FormTearOff();

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
      _$FormCopyWithImpl<$Res>;
  $Res call({String? roleId, String? type});
}

/// @nodoc
class _$FormCopyWithImpl<$Res> implements $FormCopyWith<$Res> {
  _$FormCopyWithImpl(this._value, this._then);

  final Form _value;
  // ignore: unused_field
  final $Res Function(Form) _then;

  @override
  $Res call({
    Object? roleId = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      roleId: roleId == freezed
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$FormCopyWith<$Res> implements $FormCopyWith<$Res> {
  factory _$FormCopyWith(_Form value, $Res Function(_Form) then) =
      __$FormCopyWithImpl<$Res>;
  @override
  $Res call({String? roleId, String? type});
}

/// @nodoc
class __$FormCopyWithImpl<$Res> extends _$FormCopyWithImpl<$Res>
    implements _$FormCopyWith<$Res> {
  __$FormCopyWithImpl(_Form _value, $Res Function(_Form) _then)
      : super(_value, (v) => _then(v as _Form));

  @override
  _Form get _value => super._value as _Form;

  @override
  $Res call({
    Object? roleId = freezed,
    Object? type = freezed,
  }) {
    return _then(_Form(
      roleId: roleId == freezed
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
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

  factory _$_Form.fromJson(Map<String, dynamic> json) =>
      _$_$_FormFromJson(json);

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
        (other is _Form &&
            (identical(other.roleId, roleId) ||
                const DeepCollectionEquality().equals(other.roleId, roleId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(roleId) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$FormCopyWith<_Form> get copyWith =>
      __$FormCopyWithImpl<_Form>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FormToJson(this);
  }
}

abstract class _Form implements Form {
  const factory _Form({String? roleId, String? type}) = _$_Form;

  factory _Form.fromJson(Map<String, dynamic> json) = _$_Form.fromJson;

  @override
  String? get roleId => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FormCopyWith<_Form> get copyWith => throw _privateConstructorUsedError;
}
