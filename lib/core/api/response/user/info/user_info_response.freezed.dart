// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) {
  return _UserInfoResponse.fromJson(json);
}

/// @nodoc
class _$UserInfoResponseTearOff {
  const _$UserInfoResponseTearOff();

  _UserInfoResponse call(
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
      String? email}) {
    return _UserInfoResponse(
      sub: sub,
      emailVerified: emailVerified,
      role: role,
      name: name,
      groups: groups,
      preferredUsername: preferredUsername,
      locale: locale,
      givenName: givenName,
      dashboards: dashboards,
      familyName: familyName,
      email: email,
    );
  }

  UserInfoResponse fromJson(Map<String, Object> json) {
    return UserInfoResponse.fromJson(json);
  }
}

/// @nodoc
const $UserInfoResponse = _$UserInfoResponseTearOff();

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
      _$UserInfoResponseCopyWithImpl<$Res>;
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
class _$UserInfoResponseCopyWithImpl<$Res>
    implements $UserInfoResponseCopyWith<$Res> {
  _$UserInfoResponseCopyWithImpl(this._value, this._then);

  final UserInfoResponse _value;
  // ignore: unused_field
  final $Res Function(UserInfoResponse) _then;

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
      sub: sub == freezed
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferredUsername: preferredUsername == freezed
          ? _value.preferredUsername
          : preferredUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: givenName == freezed
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      dashboards: dashboards == freezed
          ? _value.dashboards
          : dashboards // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      familyName: familyName == freezed
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserInfoResponseCopyWith<$Res>
    implements $UserInfoResponseCopyWith<$Res> {
  factory _$UserInfoResponseCopyWith(
          _UserInfoResponse value, $Res Function(_UserInfoResponse) then) =
      __$UserInfoResponseCopyWithImpl<$Res>;
  @override
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
class __$UserInfoResponseCopyWithImpl<$Res>
    extends _$UserInfoResponseCopyWithImpl<$Res>
    implements _$UserInfoResponseCopyWith<$Res> {
  __$UserInfoResponseCopyWithImpl(
      _UserInfoResponse _value, $Res Function(_UserInfoResponse) _then)
      : super(_value, (v) => _then(v as _UserInfoResponse));

  @override
  _UserInfoResponse get _value => super._value as _UserInfoResponse;

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
    return _then(_UserInfoResponse(
      sub: sub == freezed
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferredUsername: preferredUsername == freezed
          ? _value.preferredUsername
          : preferredUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: givenName == freezed
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      dashboards: dashboards == freezed
          ? _value.dashboards
          : dashboards // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      familyName: familyName == freezed
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
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
      this.role,
      this.name,
      @JsonKey(name: "groups") this.groups,
      @JsonKey(name: "preferred_username") this.preferredUsername,
      this.locale,
      @JsonKey(name: "given_name") this.givenName,
      this.dashboards,
      @JsonKey(name: "family_name") this.familyName,
      this.email});

  factory _$_UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_UserInfoResponseFromJson(json);

  @override
  final String? sub;
  @override
  @JsonKey(name: "email_verified")
  final bool? emailVerified;
  @override
  final List<String>? role;
  @override
  final String? name;
  @override
  @JsonKey(name: "groups")
  final List<String>? groups;
  @override
  @JsonKey(name: "preferred_username")
  final String? preferredUsername;
  @override
  final String? locale;
  @override
  @JsonKey(name: "given_name")
  final String? givenName;
  @override
  final List<String>? dashboards;
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
        (other is _UserInfoResponse &&
            (identical(other.sub, sub) ||
                const DeepCollectionEquality().equals(other.sub, sub)) &&
            (identical(other.emailVerified, emailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.emailVerified, emailVerified)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.groups, groups) ||
                const DeepCollectionEquality().equals(other.groups, groups)) &&
            (identical(other.preferredUsername, preferredUsername) ||
                const DeepCollectionEquality()
                    .equals(other.preferredUsername, preferredUsername)) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.givenName, givenName) ||
                const DeepCollectionEquality()
                    .equals(other.givenName, givenName)) &&
            (identical(other.dashboards, dashboards) ||
                const DeepCollectionEquality()
                    .equals(other.dashboards, dashboards)) &&
            (identical(other.familyName, familyName) ||
                const DeepCollectionEquality()
                    .equals(other.familyName, familyName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sub) ^
      const DeepCollectionEquality().hash(emailVerified) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(groups) ^
      const DeepCollectionEquality().hash(preferredUsername) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(givenName) ^
      const DeepCollectionEquality().hash(dashboards) ^
      const DeepCollectionEquality().hash(familyName) ^
      const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$UserInfoResponseCopyWith<_UserInfoResponse> get copyWith =>
      __$UserInfoResponseCopyWithImpl<_UserInfoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserInfoResponseToJson(this);
  }
}

abstract class _UserInfoResponse implements UserInfoResponse {
  const factory _UserInfoResponse(
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
      String? email}) = _$_UserInfoResponse;

  factory _UserInfoResponse.fromJson(Map<String, dynamic> json) =
      _$_UserInfoResponse.fromJson;

  @override
  String? get sub => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "email_verified")
  bool? get emailVerified => throw _privateConstructorUsedError;
  @override
  List<String>? get role => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "groups")
  List<String>? get groups => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "preferred_username")
  String? get preferredUsername => throw _privateConstructorUsedError;
  @override
  String? get locale => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "given_name")
  String? get givenName => throw _privateConstructorUsedError;
  @override
  List<String>? get dashboards => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "family_name")
  String? get familyName => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserInfoResponseCopyWith<_UserInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
