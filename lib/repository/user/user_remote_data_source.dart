import 'package:dartz/dartz.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/login/usecases/fetch_user_info_usecase.dart';

import '../../core/api/response/user/info/user_info_response.dart';
import '../../presentation/features/login/usecases/login_keycloak_authenticator_usecase.dart';
import '../../presentation/features/login/usecases/refresk_keycloak_token_usecase.dart';

abstract class UserRemoteDataSource<T> {
  Future<Either<Failure, UserInfoResponse>> userInfo(
      {required FetchUserInfoParams fetchUserInfoParams});

  Future<Either<Failure, AuthorizationTokenResponse>>
      loginUserUsingKeycloakAuthenticator(
          {required LoginKeycloakAuthenticatorParams params});

  Future<Either<Failure, TokenResponse>> refreshKeycloakToken(
      {required RefreshKeycloakTokenParams params});
}
