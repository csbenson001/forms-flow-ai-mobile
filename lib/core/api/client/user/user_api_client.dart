import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../response/user/info/user_info_response.dart';
import '../../utils/api_constants_url.dart';

part 'user_api_client.g.dart';

@RestApi()
abstract class UserApiClient {
  factory UserApiClient(Dio dio, {String? baseUrl}) = _UserApiClient;

  /// Function to fetch keycloak userInfo
  /// Input Parameters
  /// [AccessToken] - logged in user's access Token
  /// [Realm] - Keycloak realm
  /// ---> Returns [UserInfoResponse]
  @POST(ApiConstantUrl.fetchUserInfo)
  Future<UserInfoResponse> getUserInfo(
      @Header("Authorization") String accessToken, @Path() String realm);
}