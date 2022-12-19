import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:formsflowai/utils/general_util.dart';
import 'package:formsflowai/utils/jwttoken/jwttoken_utils.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';

import '../error/errors_failure.dart';
import '../preferences/app_preference.dart';

class TaskAuthorizationInterceptor extends QueuedInterceptorsWrapper {
  final AppPreferences appPreferences;
  final FlutterAppAuth flutterAppAuth;

  TaskAuthorizationInterceptor(
      {required this.appPreferences, required this.flutterAppAuth});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String token = appPreferences.getAccessToken();

    if (!GeneralUtil.isStringEmpty(token)) {
      try {
        final tokenExpiryDuration = TokenUtils.tokenExpiryTime(token: token);
        if (!tokenExpiryDuration.isNegative &&
            tokenExpiryDuration.inSeconds <= 60) {
          updateRefreshBeforeTokenExpiry();
        }
      } catch (e) {}

      options.headers.addAll(
        <String, String>{
          'Authorization': appPreferences.getBearerAccessToken(),
        },
      );
    }
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      switch (err.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          throw DeadlineExceededException(err.requestOptions);
        case DioErrorType.response:
          if (err.response?.statusCode == 401) {
            RequestOptions requestOptions = err.requestOptions;
            final options = Options(
                method: requestOptions.method,
                contentType: requestOptions.contentType,
                headers: requestOptions.headers);

            try {
              final result = await refreshKeycloakToken();
              if (result != null) {
                appPreferences.setAccessToken(
                    result.accessToken ?? appPreferences.getRefreshToken());
                appPreferences.setRefreshToken(
                    result.refreshToken ?? appPreferences.getRefreshToken());

                final String? token = appPreferences.getBearerAccessToken();
                if (token != null && token.isNotEmpty) {
                  options.headers?.addAll(
                    <String, String>{
                      'Authorization': token,
                    },
                  );
                }
                Dio dio = Dio();
                final response = await dio.request(
                    requestOptions.baseUrl + requestOptions.path,
                    options: options,
                    cancelToken: requestOptions.cancelToken,
                    onReceiveProgress: requestOptions.onReceiveProgress,
                    data: requestOptions.data,
                    queryParameters: requestOptions.queryParameters);
                return handler.resolve(response);
              }
            } catch (e) {
              handler.next(RefreshTokenExpiredException(err.requestOptions));
            }
          } else {
            handler.next(err);
          }
          break;

        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          throw NoInternetConnectionException(err.requestOptions);
      }
    }
  }

  /// Method to update Refresh token using Authenticator
  Future<TokenResponse?> refreshKeycloakToken() async {
    const String _clientId = FormsFlowAIConstants.CLIENT_ID;
    const String _redirectUrl = FormsFlowAIConstants.KEYCLOAK_REDIRECT_URL;
    const List<String> _scopes = FormsFlowAIConstants.KEYCLOAK_SCOPES;

    AuthorizationServiceConfiguration _serviceConfiguration =
        const AuthorizationServiceConfiguration(
      authorizationEndpoint:
          '${ApiConstantUrl.KEYCLOCK_AUTH_BASE_URL}${ApiConstantUrl.FETCH_TOKEN_OPEN_ID_CONNECT}/auth',
      tokenEndpoint:
          '${ApiConstantUrl.KEYCLOCK_AUTH_BASE_URL}${ApiConstantUrl.FETCH_TOKEN_OPEN_ID_CONNECT}/token',
      endSessionEndpoint:
          '${ApiConstantUrl.KEYCLOCK_AUTH_BASE_URL}${ApiConstantUrl.FETCH_TOKEN_OPEN_ID_CONNECT}/logout',
    );

    return await flutterAppAuth.token(
      TokenRequest(
        _clientId,
        _redirectUrl,
        refreshToken: appPreferences.getRefreshToken(),
        serviceConfiguration: _serviceConfiguration,
        scopes: _scopes,
        allowInsecureConnections: false,
      ),
    );
  }

  /// Method to update Refresh token before 60 seconds of its expiration time
  void updateRefreshBeforeTokenExpiry() {
    try {
      refreshKeycloakToken().then((TokenResponse? result) {
        if (result != null) {
          appPreferences.setAccessToken(
              result.accessToken ?? appPreferences.getAccessToken());
          appPreferences.setRefreshToken(
              result.refreshToken ?? appPreferences.getRefreshToken());
        }
      });
    } catch (e) {}
  }
}
