import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../shared/api_constants_url.dart';
import '../../response/user/info/user_info_response.dart';

part 'user_api_client.g.dart';

@RestApi()
abstract class UserApiClient {
  factory UserApiClient(Dio dio, {String? baseUrl}) = _UserApiClient;

  @POST(ApiConstantUrl.fetchUserInfo)
  Future<UserInfoResponse> getUserInfo(
      @Header("Authorization") String accessToken, @Path() String realm);
}
