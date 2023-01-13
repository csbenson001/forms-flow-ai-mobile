// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_response.freezed.dart';
part 'user_info_response.g.dart';

/// [UserInfoResponse] class to parse
/// user info after the keycloak login
@freezed
class UserInfoResponse with _$UserInfoResponse {
  const factory UserInfoResponse({
    String? sub,
    @JsonKey(name: "email_verified") bool? emailVerified,
    List<String>? role,
    String? name,
    @JsonKey(name: "groups") List<String>? groups,
    @JsonKey(name: "preferred_username") String? preferredUsername,
    String? locale,
    @JsonKey(name: "given_name") String? givenName,
    List<String>? dashboards,
    @JsonKey(name: "family_name") String? familyName,
    String? email,
  }) = _UserInfoResponse;

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);
}
