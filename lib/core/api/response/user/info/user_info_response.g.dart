// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfoResponse _$$_UserInfoResponseFromJson(Map<String, dynamic> json) =>
    _$_UserInfoResponse(
      sub: json['sub'] as String?,
      emailVerified: json['email_verified'] as bool?,
      role: (json['role'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
      groups:
          (json['groups'] as List<dynamic>?)?.map((e) => e as String).toList(),
      preferredUsername: json['preferred_username'] as String?,
      locale: json['locale'] as String?,
      givenName: json['given_name'] as String?,
      dashboards: (json['dashboards'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      familyName: json['family_name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$_UserInfoResponseToJson(_$_UserInfoResponse instance) =>
    <String, dynamic>{
      'sub': instance.sub,
      'email_verified': instance.emailVerified,
      'role': instance.role,
      'name': instance.name,
      'groups': instance.groups,
      'preferred_username': instance.preferredUsername,
      'locale': instance.locale,
      'given_name': instance.givenName,
      'dashboards': instance.dashboards,
      'family_name': instance.familyName,
      'email': instance.email,
    };
