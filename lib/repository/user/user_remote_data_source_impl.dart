import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_appauth_platform_interface/src/authorization_token_response.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/login/usecases/fetch_user_info_usecase.dart';
import 'package:formsflowai/presentation/features/login/usecases/login_keycloak_authenticator_usecase.dart';
import 'package:formsflowai/presentation/features/login/usecases/refresk_keycloak_token_usecase.dart';
import 'package:formsflowai/repository/user/user_remote_data_source.dart';
import 'package:formsflowai_api/client/user/user_api_client.dart';
import 'package:formsflowai_api/response/user/info/user_info_response.dart';
import 'package:formsflowai_api/response/user/login/keycloak_login_response.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';

import '../../presentation/features/login/usecases/login_user_usecase.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserApiClient userApiClient;

  final FlutterAppAuth flutterAppAuth;

  UserRemoteDataSourceImpl(
      {required this.userApiClient, required this.flutterAppAuth});

  /// Method to login user
  /// Parameters
  /// [LoginParams]
  /// ---> Returns [KeyCloakLoginResponse]
  @override
  Future<Either<Failure, KeyCloakLoginResponse>> loginUser(
      {required LoginParams loginParams}) async {
    try {
      var response = await userApiClient.fetchToken(
          FormsFlowAIConstants.CLIENT_ID,
          loginParams.userName,
          loginParams.password,
          FormsFlowAIConstants.TOKEN_GRANT_TYPE_PASSWORD);
      return Right(response);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        return left(NoConnectionFailure());
      }
      return Left(ServerFailure());
    }
  }

  /// Method to fetch User Info
  /// Parameters
  /// [FetchUserInfoParams]
  /// ---> Returns [UserInfoResponse]
  @override
  Future<Either<Failure, UserInfoResponse>> userInfo(
      {required FetchUserInfoParams fetchUserInfoParams}) async {
    try {
      var response =
          await userApiClient.getUserInfo(fetchUserInfoParams.accessToken);
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
    AuthorizationServiceConfiguration _serviceConfiguration =
        const AuthorizationServiceConfiguration(
      authorizationEndpoint:
          '${ApiConstantUrl.KEYCLOCK_AUTH_BASE_URL}${ApiConstantUrl.FETCH_TOKEN_OPEN_ID_CONNECT}/auth',
      tokenEndpoint:
          '${ApiConstantUrl.KEYCLOCK_AUTH_BASE_URL}${ApiConstantUrl.FETCH_TOKEN_OPEN_ID_CONNECT}/token',
      endSessionEndpoint:
          '${ApiConstantUrl.KEYCLOCK_AUTH_BASE_URL}${ApiConstantUrl.FETCH_TOKEN_OPEN_ID_CONNECT}/logout',
    );

    try {
      final AuthorizationTokenResponse? result =
          await flutterAppAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          params.clientId,
          params.redirectUrl,
          serviceConfiguration: _serviceConfiguration,
          scopes: params.scopes,
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
    AuthorizationServiceConfiguration _serviceConfiguration =
        const AuthorizationServiceConfiguration(
      authorizationEndpoint:
          '${ApiConstantUrl.KEYCLOCK_AUTH_BASE_URL}${ApiConstantUrl.FETCH_TOKEN_OPEN_ID_CONNECT}/auth',
      tokenEndpoint:
          '${ApiConstantUrl.KEYCLOCK_AUTH_BASE_URL}${ApiConstantUrl.FETCH_TOKEN_OPEN_ID_CONNECT}/token',
      endSessionEndpoint:
          '${ApiConstantUrl.KEYCLOCK_AUTH_BASE_URL}${ApiConstantUrl.FETCH_TOKEN_OPEN_ID_CONNECT}/logout',
    );

    try {
      final TokenResponse? result = await flutterAppAuth.token(
        TokenRequest(
          params.clientId,
          params.redirectUrl,
          refreshToken: params.refreshOfflineToken,
          // grantType: 'refresh_token',
          serviceConfiguration: _serviceConfiguration,
          scopes: params.scopes,
          allowInsecureConnections: false,
        ),
      );
      print("---- Token refresh Result ----");
      print(result?.accessToken);
      print(result?.accessTokenExpirationDateTime);
      if (result != null) {
        return Right(result);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      print("---- Token Refresh Error ---");
      print(e.toString());
      return Left(ServerFailure());
    }
  }
}
