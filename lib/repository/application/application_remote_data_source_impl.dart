import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/application_history_data_model.dart';
import 'package:formsflowai_api/client/application/application_api_client.dart';
import 'package:formsflowai_api/client/user/user_api_client.dart';
import 'package:formsflowai_api/response/user/login/keycloak_login_response.dart';
import 'package:formsflowai_shared/shared/formsflow_api_constants.dart';

import '../../core/database/entity/application_history_entity.dart';
import '../../core/error/server_exception.dart';
import '../../core/preferences/app_preference.dart';
import 'application_repository.dart';

class ApplicationRemoteDataSourceImpl implements ApplicationHistoryRepository {
  final ApplicationApiClient applicationApiClient;
  final UserApiClient userApiClient;
  final AppPreferences appPreferences;

  ApplicationRemoteDataSourceImpl(
      {required this.applicationApiClient,
      required this.appPreferences,
      required this.userApiClient});

  /// Method to fetch application history from remote
  /// Parameters
  /// [ApplicationId]
  /// ---> Returns List[ApplicationHistoryDM]
  @override
  Future<Either<Failure, List<ApplicationHistoryDM>>> fetchApplicationHistory(
      {required int applicationId}) async {
    try {
      var response = await applicationApiClient.fetchApplicationHistory(
          appPreferences.getBearerAccessToken(), applicationId);

      return Right(
          ApplicationHistoryDM.transform(applicationHistoryResponse: response));
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        // if (e.response?.statusCode == 401) {
        //   // Check for the retry limit get data with the refresh token
        //   var newTokenResponse = await _fetchNewToken();
        //   newTokenResponse.fold((l) {
        //     return Left(AuthorizationTokenExpiredFailure());
        //   }, (tokenResponse) {
        //     appPreferences.setAccessToken(tokenResponse.accessToken);
        //     appPreferences.setRefreshToken(tokenResponse.refreshToken);
        //     return fetchApplicationHistory(applicationId: applicationId);
        //   });
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<ApplicationHistoryEntity?>>>
      fetchApplicationHistoryFromDb({required int applicationId}) {
    // TODO: implement fetchApplicationHistoryFromDb
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> insertAllApplicationHistory(
      {required List<ApplicationHistoryEntity> applicationEntityList}) {
    // TODO: implement insertAllApplicationHistory
    throw UnimplementedError();
  }

  // Method to get the new access token with the refresh token

  Future<Either<Failure, KeyCloakLoginResponse>> _fetchNewToken() async {
    try {
      var response = await userApiClient.refreshUserToken(
          FormsFlowAIAPIConstants.CLIENT_ID,
          FormsFlowAIAPIConstants.CLIENT_SECRET_KEY,
          appPreferences.getRefreshToken(),
          FormsFlowAIAPIConstants.TOKEN_GRANT_TYPE_REFRESH_TOKEN);
      return Right(response);
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
