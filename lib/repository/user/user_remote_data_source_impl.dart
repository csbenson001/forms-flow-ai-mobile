import 'package:dartz/dartz.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/login/usecases/fetch_user_info_usecase.dart';
import 'package:formsflowai/presentation/features/login/usecases/login_keycloak_authenticator_usecase.dart';
import 'package:formsflowai/presentation/features/login/usecases/refresk_keycloak_token_usecase.dart';
import 'package:formsflowai/repository/user/user_remote_data_source.dart';

import '../../core/api/client/user/user_api_client.dart';
import '../../core/api/response/user/info/user_info_response.dart';
import '../../core/api/utils/api_constants_url.dart';
import '../../shared/flutter_auth_utils.dart';
import '../../shared/formsflow_app_constants.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserApiClient userApiClient;

  final FlutterAppAuth flutterAppAuth;

  UserRemoteDataSourceImpl(
      {required this.userApiClient, required this.flutterAppAuth});

  /// Method to fetch User Info
  /// Parameters
  /// [FetchUserInfoParams]
  /// ---> Returns [UserInfoResponse]
  @override
  Future<Either<Failure, UserInfoResponse>> userInfo(
      {required FetchUserInfoParams fetchUserInfoParams}) async {
    try {
      var response = await userApiClient.getUserInfo(
          fetchUserInfoParams.accessToken, ApiConstantUrl.realm);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  /// Method to login user using Keycloak Authenticator
  /// Parameters
  /// [LoginKeycloakAuthenticatorParams]
  /// ---> Returns [AuthorizationTokenResponse]
  @override
  Future<Either<Failure, AuthorizationTokenResponse>>
      loginUserUsingKeycloakAuthenticator(
          {required LoginKeycloakAuthenticatorParams params}) async {
    String clientId = FormsFlowAIConstants.clientId;
    const String redirectUrl = FormsFlowAIConstants.keycloakRedirectUrl;
    const List<String> scopes = FormsFlowAIConstants.keycloakScopes;

    final serviceConfiguration =
        FlutterAuthUtils.fetchAuthorizationConfiguration();

    try {
      final AuthorizationTokenResponse? result =
          await flutterAppAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          redirectUrl,
          serviceConfiguration: serviceConfiguration,
          scopes: scopes,
          preferEphemeralSession: false,
          allowInsecureConnections: false,
        ),
      );
      if (result != null) {
        return Right(result);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  /// Method to refresh keycloak access token using Authenticator
  /// Parameters
  /// [RefreshKeycloakTokenParams]
  /// ---> Returns [TokenResponse]
  @override
  Future<Either<Failure, TokenResponse>> refreshKeycloakToken(
      {required RefreshKeycloakTokenParams params}) async {
    String clientId = FormsFlowAIConstants.clientId;
    const String redirectUrl = FormsFlowAIConstants.keycloakRedirectUrl;
    const List<String> scopes = FormsFlowAIConstants.keycloakScopes;

    final serviceConfiguration =
        FlutterAuthUtils.fetchAuthorizationConfiguration();

    try {
      final TokenResponse? result = await flutterAppAuth.token(
        TokenRequest(
          clientId,
          redirectUrl,
          refreshToken: params.refreshOfflineToken,
          serviceConfiguration: serviceConfiguration,
          scopes: scopes,
          allowInsecureConnections: false,
        ),
      );

      if (result != null) {
        return Right(result);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
