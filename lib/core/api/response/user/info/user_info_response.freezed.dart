// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) {
  return _UserInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$UserInfoResponse {
  String? get sub => throw _privateConstructorUsedError;
  @JsonKey(name: "email_verified")
  bool? get emailVerified => throw _privateConstructorUsedError;
  List<String>? get role => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "groups")
  List<String>? get groups => throw _privateConstructorUsedError;
  @JsonKey(name: "preferred_username")
  String? get preferredUsername => throw _privateConstructorUsedError;
  String? get locale => throw _privateConstructorUsedError;
  @JsonKey(name: "given_name")
  String? get givenName => throw _privateConstructorUsedError;
  List<String>? get dashboards => throw _privateConstructorUsedError;
  @JsonKey(name: "family_name")
  String? get familyName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoResponseCopyWith<UserInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoResponseCopyWith<$Res> {
  factory $UserInfoResponseCopyWith(
          UserInfoResponse value, $Res Function(UserInfoResponse) then) =
      _$UserInfoResponseCopyWithImpl<$Res, UserInfoResponse>;
  @useResult
  $Res call(
      {String? sub,
      @JsonKey(name: "email_verified") bool? emailVerified,
      List<String>? role,
      String? name,
      @JsonKey(name: "groups") List<String>? groups,
      @JsonKey(name: "preferred_username") String? preferredUsername,
      String? locale,
      @JsonKey(name: "given_name") String? givenName,
      List<String>? dashboards,
      @JsonKey(name: "family_name") String? familyName,
      String? email});
}

/// @nodoc
class _$UserInfoResponseCopyWithImpl<$Res, $Val extends UserInfoResponse>
    implements $UserInfoResponseCopyWith<$Res> {
  _$UserInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sub = freezed,
    Object? emailVerified = freezed,
    Object? role = freezed,
    Object? name = freezed,
    Object? groups = freezed,
    Object? preferredUsername = freezed,
    Object? locale = freezed,
    Object? givenName = freezed,
    Object? dashboards = freezed,
    Object? familyName = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      sub: freezed == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: freezed == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferredUsername: freezed == preferredUsername
          ? _value.preferredUsername
          : preferredUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      dashboards: freezed == dashboards
          ? _value.dashboards
          : dashboards // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      familyName: freezed == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoResponseCopyWith<$Res>
    implements $UserInfoResponseCopyWith<$Res> {
  factory _$$_UserInfoResponseCopyWith(
          _$_UserInfoResponse value, $Res Function(_$_UserInfoResponse) then) =
      __$$_UserInfoResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? sub,
      @JsonKey(name: "email_verified") bool? emailVerified,
      List<String>? role,
      String? name,
      @JsonKey(name: "groups") List<String>? groups,
      @JsonKey(name: "preferred_username") String? preferredUsername,
      String? locale,
      @JsonKey(name: "given_name") String? givenName,
      List<String>? dashboards,
      @JsonKey(name: "family_name") String? familyName,
      String? email});
}

/// @nodoc
class __$$_UserInfoResponseCopyWithImpl<$Res>
    extends _$UserInfoResponseCopyWithImpl<$Res, _$_UserInfoResponse>
    implements _$$_UserInfoResponseCopyWith<$Res> {
  __$$_UserInfoResponseCopyWithImpl(
      _$_UserInfoResponse _value, $Res Function(_$_UserInfoResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sub = freezed,
    Object? emailVerified = freezed,
    Object? role = freezed,
    Object? name = freezed,
    Object? groups = freezed,
    Object? preferredUsername = freezed,
    Object? locale = freezed,
    Object? givenName = freezed,
    Object? dashboards = freezed,
    Object? familyName = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_UserInfoResponse(
      sub: freezed == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      role: freezed == role
          ? _value._role
          : role // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: freezed == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferredUsername: freezed == preferredUsername
          ? _value.preferredUsername
          : preferredUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      dashboards: freezed == dashboards
          ? _value._dashboards
          : dashboards // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      familyName: freezed == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfoResponse implements _UserInfoResponse {
  const _$_UserInfoResponse(
      {this.sub,
      @JsonKey(name: "email_verified") this.emailVerified,
      final List<String>? role,
      this.name,
      @JsonKey(name: "groups") final List<String>? groups,
      @JsonKey(name: "preferred_username") this.preferredUsername,
      this.locale,
      @JsonKey(name: "given_name") this.givenName,
      final List<String>? dashboards,
      @JsonKey(name: "family_name") this.familyName,
      this.email})
      : _role = role,
        _groups = groups,
        _dashboards = dashboards;

  factory _$_UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoResponseFromJson(json);

  @override
  final String? sub;
  @override
  @JsonKey(name: "email_verified")
  final bool? emailVerified;
  final List<String>? _role;
  @override
  List<String>? get role {
    final value = _role;
    if (value == null) return null;
    if (_role is EqualUnmodifiableListView) return _role;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? name;
  final List<String>? _groups;
  @override
  @JsonKey(name: "groups")
  List<String>? get groups {
    final value = _groups;
    if (value == null) return null;
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "preferred_username")
  final String? preferredUsername;
  @override
  final String? locale;
  @override
  @JsonKey(name: "given_name")
  final String? givenName;
  final List<String>? _dashboards;
  @override
  List<String>? get dashboards {
    final value = _dashboards;
    if (value == null) return null;
    if (_dashboards is EqualUnmodifiableListView) return _dashboards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "family_name")
  final String? familyName;
  @override
  final String? email;

  @override
  String toString() {
    return 'UserInfoResponse(sub: $sub, emailVerified: $emailVerified, role: $role, name: $name, groups: $groups, preferredUsername: $preferredUsername, locale: $locale, givenName: $givenName, dashboards: $dashboards, familyName: $familyName, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoResponse &&
            (identical(other.sub, sub) || other.sub == sub) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            const DeepCollectionEquality().equals(other._role, _role) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.preferredUsername, preferredUsername) ||
                other.preferredUsername == preferredUsername) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.givenName, givenName) ||
                other.givenName == givenName) &&
            const DeepCollectionEquality()
                .equals(other._dashboards, _dashboards) &&
            (identical(other.familyName, familyName) ||
                other.familyName == familyName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sub,
      emailVerified,
      const DeepCollectionEquality().hash(_role),
      name,
      const DeepCollectionEquality().hash(_groups),
      preferredUsername,
      locale,
      givenName,
      const DeepCollectionEquality().hash(_dashboards),
      familyName,
      email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoResponseCopyWith<_$_UserInfoResponse> get copyWith =>
      __$$_UserInfoResponseCopyWithImpl<_$_UserInfoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoResponseToJson(
      this,
    );
  }
}

abstract class _UserInfoResponse implements UserInfoResponse {
  const factory _UserInfoResponse(
      {final String? sub,
      @JsonKey(name: "email_verified") final bool? emailVerified,
      final List<String>? role,
      final String? name,
      @JsonKey(name: "groups") final List<String>? groups,
      @JsonKey(name: "preferred_username") final String? preferredUsername,
      final String? locale,
      @JsonKey(name: "given_name") final String? givenName,
      final List<String>? dashboards,
      @JsonKey(name: "family_name") final String? familyName,
      final String? email}) = _$_UserInfoResponse;

  factory _UserInfoResponse.fromJson(Map<String, dynamic> json) =
      _$_UserInfoResponse.fromJson;

  @override
  String? get sub;
  @override
  @JsonKey(name: "email_verified")
  bool? get emailVerified;
  @override
  List<String>? get role;
  @override
  String? get name;
  @override
  @JsonKey(name: "groups")
  List<String>? get groups;
  @override
  @JsonKey(name: "preferred_username")
  String? get preferredUsername;
  @override
  String? get locale;
  @override
  @JsonKey(name: "given_name")
  String? get givenName;
  @override
  List<String>? get dashboards;
  @override
  @JsonKey(name: "family_name")
  String? get familyName;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoResponseCopyWith<_$_UserInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
