import 'package:formsflowai_api/response/filter/get_filters_response.dart';

abstract class BasePreference<T> {
  void setUserLoggedIn(bool value);

  bool isUserLoggedIn();

  void setUserId(String userId);

  String getUserId();

  void setUserName(String userName);

  String getUserName();

  Future<bool> clear();

  bool isInitialApiCalled();

  void setInitialApiCalled(bool value);

  void setUserImage(String userImage);

  String getUserImage();

  void setUserEmail(String userMail);

  String getUserEmail();

  void setPhoneNumber(String phoneNumber);

  String getPhoneNumber();

  void setAccessToken(String accessToken);

  String getAccessToken();

  String getBearerAccessToken();

  void setRefreshToken(String refreshToken);

  String getRefreshToken();

  void setFormJWtToken(String accessToken);

  String getFormJwtToken();

  bool isJwtTokenAdded();

  void setJwtTokenAdded(bool value);

  void setFiltersResponse(List<FiltersResponse> filtersData);

  List<FiltersResponse>? getFiltersData();

  void setPreferredUserName(String preferredUserName);

  String getPreferredUserName();

  void setGroups(List<String> groups);

  List<String>? getGroups();

  void setRoles(List<String> roles);

  List<String>? getRoles();

  void setUserRole(String userRole);

  String getUserRole();

  void setUserInfo(String userInfo);

  String getUserInfo();
}
