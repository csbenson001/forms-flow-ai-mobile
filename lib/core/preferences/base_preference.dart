import '../api/response/filter/get_filters_response.dart';
import '../api/response/form/roles/formio_roles_response.dart';

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

  bool isFormJwtTokenAdded();

  void setFormJwtTokenAdded(bool value);

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

  void setFormioRoleResponse(FormioRolesResponse response);

  FormioRolesResponse? getFormioRoleResponse();
}
