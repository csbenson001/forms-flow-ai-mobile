import 'package:dio/dio.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:retrofit/retrofit.dart';

import '../../response/user/info/user_info_response.dart';
import '../../response/user/login/keycloak_login_response.dart';

part 'user_api_client.g.dart';

@RestApi(baseUrl: ApiConstantUrl.KEYCLOCK_AUTH_BASE_URL)
abstract class UserApiClient {
  factory UserApiClient(Dio dio, {String? baseUrl}) = _UserApiClient;

  @POST(ApiConstantUrl.FETCH_TOKEN)
  @FormUrlEncoded()
  Future<KeyCloakLoginResponse> fetchToken(
      @Field("client_id") String clientId,
      @Field("username") String username,
      @Field("password") String password,
      @Field("grant_type") String grantType);

  @POST(ApiConstantUrl.FETCH_USER_INFO)
  Future<UserInfoResponse> getUserInfo(
      @Header("Authorization") String accessToken);

  @POST(ApiConstantUrl.FETCH_TOKEN)
  @FormUrlEncoded()
  Future<KeyCloakLoginResponse> refreshUserToken(
      @Field("client_id") String clientId,
      @Field("client_secret") String clientSecret,
      @Field("refresh_token") String refreshToken,
      @Field("grant_type") String grantType);
}
