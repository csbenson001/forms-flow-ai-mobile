import 'package:dartz/dartz.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/login/usecases/fetch_user_info_usecase.dart';
import 'package:formsflowai/presentation/features/login/usecases/login_keycloak_authenticator_usecase.dart';
import 'package:formsflowai/presentation/features/login/usecases/refresk_keycloak_token_usecase.dart';
import 'package:formsflowai/presentation/features/login/usecases/save_user_details_usecase.dart';
import 'package:formsflowai/repository/user/user_local_data_source.dart';
import 'package:formsflowai/repository/user/user_local_data_source_impl.dart';
import 'package:formsflowai/repository/user/user_remote_data_source.dart';
import 'package:formsflowai/repository/user/user_remote_data_source_impl.dart';

import '../../core/api/response/user/info/user_info_response.dart';

class UserDataRepository implements UserRemoteDataSource, UserLocalDataSource {
  final UserRemoteDataSourceImpl remoteDataSource;
  final UserLocalDataSourceImpl localDataSource;

  UserDataRepository(
      {required this.localDataSource, required this.remoteDataSource});

  /// Method to save user details
  /// Parameters
  /// [SaveUserDetailsParams]
  @override
  Future<Either<Failure, bool>> saveUserDetails(
      {required SaveUserDetailsParams params}) {
    return localDataSource.saveUserDetails(params: params);
  }

  /// Method to fetch User Info
  /// Parameters
  /// [FetchUserInfoParams]
  /// ---> Returns [UserInfoResponse]
  @override
  Future<Either<Failure, UserInfoResponse>> userInfo(
      {required FetchUserInfoParams fetchUserInfoParams}) {
    return remoteDataSource.userInfo(fetchUserInfoParams: fetchUserInfoParams);
  }

  @override
  Future<Either<Failure, AuthorizationTokenResponse>>
      loginUserUsingKeycloakAuthenticator(
          {required LoginKeycloakAuthenticatorParams params}) {
    return remoteDataSource.loginUserUsingKeycloakAuthenticator(params: params);
  }

  @override
  Future<Either<Failure, TokenResponse>> refreshKeycloakToken(
      {required RefreshKeycloakTokenParams params}) {
    return remoteDataSource.refreshKeycloakToken(params: params);
  }
}
