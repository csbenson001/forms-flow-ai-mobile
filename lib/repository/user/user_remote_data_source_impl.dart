import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/login/usecases/fetch_user_info_usecase.dart';
import 'package:formsflowai/repository/user/user_remote_data_source.dart';
import 'package:formsflowai_api/client/user/user_api_client.dart';
import 'package:formsflowai_api/response/user/info/user_info_response.dart';
import 'package:formsflowai_api/response/user/login/keycloak_login_response.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';

import '../../core/error/server_exception.dart';
import '../../presentation/features/login/usecases/login_user_usecase.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserApiClient userApiClient;

  UserRemoteDataSourceImpl({required this.userApiClient});

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
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
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
}
