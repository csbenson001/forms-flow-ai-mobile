import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/application_history_data_model.dart';
import 'package:formsflowai_api/client/application/application_api_client.dart';
import 'package:formsflowai_api/client/user/user_api_client.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:formsflowai_shared/shared/formsflow_api_constants.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';

import '../../core/database/entity/application_history_entity.dart';
import '../../core/preferences/app_preference.dart';
import '../../presentation/features/login/usecases/refresk_keycloak_token_usecase.dart';
import 'application_repository.dart';

class ApplicationRemoteDataSourceImpl implements ApplicationHistoryRepository {
  final ApplicationApiClient applicationApiClient;
  final UserApiClient userApiClient;
  final AppPreferences appPreferences;
  final FlutterAppAuth flutterAppAuth;

  ApplicationRemoteDataSourceImpl(
      {required this.applicationApiClient,
      required this.appPreferences,
      required this.flutterAppAuth,
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
    } catch (e) {
      return _handleDioError(
          e, () => fetchApplicationHistory(applicationId: applicationId));
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

  /// Method to handle error
  _handleDioError(dynamic e, Function() requestFunction) async {
    if (e is TypeError) {
      return Left(DataTypeFailure());
    } else if (e is DioError) {
      if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
        var newTokenResponse = await _fetchNewToken(
                params: RefreshKeycloakTokenParams(
                    refreshOfflineToken: appPreferences.getRefreshToken()))
            .onError((error, stackTrace) {
       
          return Left(AuthorizationTokenExpiredFailure());
        });
        ;
        newTokenResponse.fold((l) {
  
          return Left(AuthorizationTokenExpiredFailure());
        }, (tokenResponse) {
          appPreferences.setAccessToken(
              tokenResponse.accessToken ?? appPreferences.getAccessToken());
          appPreferences.setRefreshToken(
              tokenResponse.refreshToken ?? appPreferences.getRefreshToken());
          return requestFunction();
        });
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  // Method to get the new access token with the refresh token
  Future<Either<Failure, TokenResponse>> _fetchNewToken(
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

    const String _clientId = FormsFlowAIConstants.CLIENT_ID;
    const String _redirectUrl = FormsFlowAIConstants.KEYCLOAK_REDIRECT_URL;
    const List<String> _scopes = FormsFlowAIConstants.KEYCLOAK_SCOPES;

    try {
      final TokenResponse? result = await flutterAppAuth.token(
        TokenRequest(
          _clientId,
          _redirectUrl,
          refreshToken: params.refreshOfflineToken,
          serviceConfiguration: _serviceConfiguration,
          scopes: _scopes,
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
