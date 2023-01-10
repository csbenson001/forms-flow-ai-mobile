import 'dart:convert';

import 'package:formsflowai/utils/general_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/response/filter/get_filters_response.dart';
import '../api/response/form/roles/formio_roles_response.dart';
import '../api/utils/api_utils.dart';
import 'base_preference.dart';

class AppPreferences implements BasePreference {
  static const String prefUserLoggedIn = "PREF_USER_LOGGED_IN";
  static const String prefUserId = "PREF_USER_ID";
  static const String prefUserName = "PREF_USER_NAME";
  static const String prefUserAssigneeName = "PREF_USER_ASSIGNEE_NAME";
  static const String prefUserEmail = "PREF_USER_EMAIL";
  static const String prefUserImage = "PREF_USER_IMAGE";
  static const String prefInitialApiCalled = "PREF_INITIAL_API_CALLED";
  static const String prefUserMobile = "PREF_USER_MOBILE";
  static const String prefUserAccessToken = "PREF_USER_ACCESS_TOKEN";
  static const String prefUserRefreshToken = "PREF_USER_REFRESH_TOKEN";
  static const String prefFormJWTToken = "PREF_FORM_JWT_TOKEN";
  static const String prefJWTTokenAdded = "PREF_JWT_TOKEN_ADDED";
  static const String prefFiltersData = "PREF_FILTERS_DATA";
  static const String prefGroups = "PREF_GROUPS";
  static const String prefRoles = "PREF_ROLES";
  static const String prefUserRole = "PREF_USER_ROLE";
  static const String prefUserInfo = "PREF_USER_INFO";
  static const String prefFormRoleResponse = "PREF_FORM_ROLE_RESPONSE";

  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  @override
  String getUserName() {
    return _sharedPreferences.getString(prefUserName) ?? "";
  }

  @override
  bool isUserLoggedIn() {
    return _sharedPreferences.getBool(prefUserLoggedIn) ?? false;
  }

  @override
  void setUserLoggedIn(bool value) {
    _sharedPreferences.setBool(prefUserLoggedIn, value);
  }

  @override
  void setUserName(String userName) {
    _sharedPreferences.setString(prefUserName, userName);
  }

  @override
  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

  @override
  String getUserEmail() {
    return _sharedPreferences.getString(prefUserEmail) ?? "";
  }

  @override
  String getUserImage() {
    return _sharedPreferences.getString(prefUserImage) ?? "";
  }

  @override
  bool isInitialApiCalled() {
    return _sharedPreferences.getBool(prefInitialApiCalled) ?? false;
  }

  @override
  void setInitialApiCalled(bool value) {
    _sharedPreferences.setBool(prefInitialApiCalled, value);
  }

  @override
  void setUserEmail(String userMail) {
    _sharedPreferences.setString(prefUserEmail, userMail);
  }

  @override
  void setUserImage(String userImage) {
    _sharedPreferences.setString(prefUserImage, userImage);
  }

  @override
  String getUserId() {
    return _sharedPreferences.getString(prefUserId) ?? "0";
  }

  @override
  void setUserId(String userId) {
    _sharedPreferences.setString(prefUserId, userId);
  }

  @override
  String getPhoneNumber() {
    return _sharedPreferences.getString(prefUserMobile) ?? "";
  }

  @override
  void setPhoneNumber(String phoneNumber) {
    _sharedPreferences.setString(prefUserMobile, phoneNumber);
  }

  @override
  String getAccessToken() {
    return _sharedPreferences.getString(prefUserAccessToken) ?? "";
  }

  @override
  void setAccessToken(String accessToken) {
    _sharedPreferences.setString(prefUserAccessToken, accessToken);
  }

  @override
  String getFormJwtToken() {
    return _sharedPreferences.getString(prefFormJWTToken) ?? "";
  }

  @override
  bool isFormJwtTokenAdded() {
    return _sharedPreferences.getBool(prefJWTTokenAdded) ?? false;
  }

  @override
  void setFormJWtToken(String accessToken) {
    _sharedPreferences.setString(prefFormJWTToken, accessToken);
  }

  @override
  void setFormJwtTokenAdded(bool value) {
    _sharedPreferences.setBool(prefJWTTokenAdded, value);
  }

  @override
  List<FiltersResponse> getFiltersData() {
    List<FiltersResponse> data = [];
    String? filtersList = _sharedPreferences.getString(prefFiltersData);
    if (filtersList != null && filtersList.isNotEmpty) {
      final List<dynamic> decodedFiltersData = json.decode(filtersList);
      data = decodedFiltersData
          .map((e) => FiltersResponse.fromJson(e))
          .toList(growable: false);
      return data;
    }
    return data;
  }

  @override
  void setFiltersResponse(List<FiltersResponse> filtersData) {
    final String encodedData = json.encode(filtersData);
    _sharedPreferences.setString(prefFiltersData, encodedData);
  }

  @override
  String getPreferredUserName() {
    return _sharedPreferences.getString(prefUserAssigneeName) ?? "";
  }

  @override
  void setPreferredUserName(String preferredUserName) {
    _sharedPreferences.setString(prefUserAssigneeName, preferredUserName);
  }

  @override
  List<String>? getGroups() {
    return _sharedPreferences.getStringList(prefGroups);
  }

  @override
  List<String>? getRoles() {
    return _sharedPreferences.getStringList(prefRoles);
  }

  @override
  void setGroups(List<String> groupData) {
    _sharedPreferences.setStringList(prefGroups, groupData);
  }

  @override
  void setRoles(List<String> roles) {
    _sharedPreferences.setStringList(prefRoles, roles);
  }

  @override
  String getUserRole() {
    return _sharedPreferences.getString(prefUserRole) ?? "";
  }

  @override
  void setUserRole(String userRole) {
    _sharedPreferences.setString(prefUserRole, userRole);
  }

  @override
  String getUserInfo() {
    return _sharedPreferences.getString(prefUserInfo) ?? "";
  }

  @override
  void setUserInfo(String userInfo) {
    _sharedPreferences.setString(prefUserInfo, userInfo);
  }

  @override
  String getBearerAccessToken() {
    return APIUtils.getBearerToken(getAccessToken());
  }

  @override
  String getRefreshToken() {
    return _sharedPreferences.getString(prefUserRefreshToken) ?? "";
  }

  @override
  void setRefreshToken(String refreshToken) {
    _sharedPreferences.setString(prefUserRefreshToken, refreshToken);
  }

  @override
  FormioRolesResponse? getFormioRoleResponse() {
    final data = _sharedPreferences.getString(prefFormRoleResponse) ?? "";
    if (!GeneralUtil.isStringEmpty(data)) {
      FormioRolesResponse formioRolesResponse = json.decode(data);
      return formioRolesResponse;
    }
    return null;
  }

  @override
  void setFormioRoleResponse(FormioRolesResponse response) {
    final String encodedData = json.encode(response);
    _sharedPreferences.setString(prefFormRoleResponse, encodedData);
  }
}
