import 'dart:convert';

import 'package:formsflowai/utils/general_util.dart';
import 'package:formsflowai_api/formsflowai_api.dart';
import 'package:formsflowai_api/response/filter/get_filters_response.dart';
import 'package:formsflowai_shared/utils/api/api_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_preference.dart';

class AppPreferences implements BasePreference {
  static const String PREF_USER_LOGGED_IN = "PREF_USER_LOGGED_IN";
  static const String PREF_USER_ID = "PREF_USER_ID";
  static const String PREF_USER_NAME = "PREF_USER_NAME";
  static const String PREF_USER_ASSIGNEE_NAME = "PREF_USER_ASSIGNEE_NAME";
  static const String PREF_USER_EMAIL = "PREF_USER_EMAIL";
  static const String PREF_USER_IMAGE = "PREF_USER_IMAGE";
  static const String PREF_INITIAL_API_CALLED = "PREF_INITIAL_API_CALLED";
  static const String PREF_USER_MOBILE = "PREF_USER_MOBILE";
  static const String PREF_USER_ACCESS_TOKEN = "PREF_USER_ACCESS_TOKEN";
  static const String PREF_USER_REFRESH_TOKEN = "PREF_USER_REFRESH_TOKEN";
  static const String PREF_FORM_JWT_TOKEN = "PREF_FORM_JWT_TOKEN";
  static const String PREF_JWT_TOKEN_ADDED = "PREF_JWT_TOKEN_ADDED";
  static const String PREF_FILTERS_DATA = "PREF_FILTERS_DATA";
  static const String PREF_GROUPS = "PREF_GROUPS";
  static const String PREF_ROLES = "PREF_ROLES";
  static const String PREF_USER_ROLE = "PREF_USER_ROLE";
  static const String PREF_USER_INFO = "PREF_USER_INFO";
  static const String PREF_FORM_ROLE_RESPONSE = "PREF_FORM_ROLE_RESPONSE";

  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  @override
  String getUserName() {
    return _sharedPreferences.getString(PREF_USER_NAME) ?? "";
  }

  @override
  bool isUserLoggedIn() {
    return _sharedPreferences.getBool(PREF_USER_LOGGED_IN) ?? false;
  }

  @override
  void setUserLoggedIn(bool value) {
    _sharedPreferences.setBool(PREF_USER_LOGGED_IN, value);
  }

  @override
  void setUserName(String userName) {
    _sharedPreferences.setString(PREF_USER_NAME, userName);
  }

  @override
  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }

  @override
  String getUserEmail() {
    return _sharedPreferences.getString(PREF_USER_EMAIL) ?? "";
  }

  @override
  String getUserImage() {
    return _sharedPreferences.getString(PREF_USER_IMAGE) ?? "";
  }

  @override
  bool isInitialApiCalled() {
    return _sharedPreferences.getBool(PREF_INITIAL_API_CALLED) ?? false;
  }

  @override
  void setInitialApiCalled(bool value) {
    _sharedPreferences.setBool(PREF_INITIAL_API_CALLED, value);
  }

  @override
  void setUserEmail(String userMail) {
    _sharedPreferences.setString(PREF_USER_EMAIL, userMail);
  }

  @override
  void setUserImage(String userImage) {
    _sharedPreferences.setString(PREF_USER_IMAGE, userImage);
  }

  @override
  String getUserId() {
    return _sharedPreferences.getString(PREF_USER_ID) ?? "0";
  }

  @override
  void setUserId(String userId) {
    _sharedPreferences.setString(PREF_USER_ID, userId);
  }

  @override
  String getPhoneNumber() {
    return _sharedPreferences.getString(PREF_USER_MOBILE) ?? "";
  }

  @override
  void setPhoneNumber(String phoneNumber) {
    _sharedPreferences.setString(PREF_USER_MOBILE, phoneNumber);
  }

  @override
  String getAccessToken() {
    return _sharedPreferences.getString(PREF_USER_ACCESS_TOKEN) ?? "";
  }

  @override
  void setAccessToken(String accessToken) {
    _sharedPreferences.setString(PREF_USER_ACCESS_TOKEN, accessToken);
  }

  @override
  String getFormJwtToken() {
    return _sharedPreferences.getString(PREF_FORM_JWT_TOKEN) ?? "";
  }

  @override
  bool isFormJwtTokenAdded() {
    return _sharedPreferences.getBool(PREF_JWT_TOKEN_ADDED) ?? false;
  }

  @override
  void setFormJWtToken(String accessToken) {
    _sharedPreferences.setString(PREF_FORM_JWT_TOKEN, accessToken);
  }

  @override
  void setFormJwtTokenAdded(bool value) {
    _sharedPreferences.setBool(PREF_JWT_TOKEN_ADDED, value);
  }

  @override
  List<FiltersResponse> getFiltersData() {
    List<FiltersResponse> data = [];
    String? filtersList = _sharedPreferences.getString(PREF_FILTERS_DATA);
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
    _sharedPreferences.setString(PREF_FILTERS_DATA, encodedData);
  }

  @override
  String getPreferredUserName() {
    return _sharedPreferences.getString(PREF_USER_ASSIGNEE_NAME) ?? "";
  }

  @override
  void setPreferredUserName(String preferredUserName) {
    _sharedPreferences.setString(PREF_USER_ASSIGNEE_NAME, preferredUserName);
  }

  @override
  List<String>? getGroups() {
    return _sharedPreferences.getStringList(PREF_GROUPS) ?? null;
  }

  @override
  List<String>? getRoles() {
    return _sharedPreferences.getStringList(PREF_ROLES) ?? null;
  }

  @override
  void setGroups(List<String> groupData) {
    _sharedPreferences.setStringList(PREF_GROUPS, groupData);
  }

  @override
  void setRoles(List<String> roles) {
    _sharedPreferences.setStringList(PREF_ROLES, roles);
  }

  @override
  String getUserRole() {
    return _sharedPreferences.getString(PREF_USER_ROLE) ?? "";
  }

  @override
  void setUserRole(String userRole) {
    _sharedPreferences.setString(PREF_USER_ROLE, userRole);
  }

  @override
  String getUserInfo() {
    return _sharedPreferences.getString(PREF_USER_INFO) ?? "";
  }

  @override
  void setUserInfo(String userInfo) {
    _sharedPreferences.setString(PREF_USER_INFO, userInfo);
  }

  @override
  String getBearerAccessToken() {
    return APIUtils.getBearerToken(getAccessToken());
  }

  @override
  String getRefreshToken() {
    return _sharedPreferences.getString(PREF_USER_REFRESH_TOKEN) ?? "";
  }

  @override
  void setRefreshToken(String refreshToken) {
    _sharedPreferences.setString(PREF_USER_REFRESH_TOKEN, refreshToken);
  }

  @override
  FormioRolesResponse? getFormioRoleResponse() {
    final data = _sharedPreferences.getString(PREF_USER_REFRESH_TOKEN) ?? "";
    if (!GeneralUtil.isStringEmpty(data)) {
      FormioRolesResponse formioRolesResponse = json.decode(data);
      return formioRolesResponse;
    }
    return null;
  }

  @override
  void setFormioRoleResponse(FormioRolesResponse response) {
    final String encodedData = json.encode(response);
    _sharedPreferences.setString(PREF_FORM_ROLE_RESPONSE, encodedData);
  }
}
