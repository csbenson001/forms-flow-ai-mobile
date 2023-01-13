import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:formsflowai/utils/general_util.dart';
import 'package:formsflowai/utils/jwttoken/jwttoken_utils.dart';

import '../../shared/flutter_auth_utils.dart';
import '../../shared/formsflow_app_constants.dart';
import '../error/errors_failure.dart';
import '../preferences/app_preference.dart';

class TaskAuthorizationInterceptor extends QueuedInterceptorsWrapper {
  final AppPreferences appPreferences;
  final FlutterAppAuth flutterAppAuth;
  bool isRefreshingToken = false;

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
        if (tokenExpiryDuration.isNegative &&
            tokenExpiryDuration.inSeconds <= 60 &&
            (!isRefreshingToken) &&
            !TokenUtils.isTokenExpired(
                token: appPreferences.getRefreshToken())) {
          updateRefreshBeforeTokenExpiry();
        }
      } catch (e) {
        () {};
      }

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
      bool isTokenExpired = false;

      try {
        isTokenExpired =
            TokenUtils.isTokenExpired(token: appPreferences.getRefreshToken());
        if (err.response?.statusCode == 401 && isTokenExpired) {
          handler.next(RefreshTokenExpiredException(err.requestOptions));
        } else if (err.response?.statusCode == 401) {
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

              final String token = appPreferences.getBearerAccessToken();
              if (token.isNotEmpty) {
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
      } catch (e) {
        handler.next(RefreshTokenExpiredException(err.requestOptions));
      }
    }
  }

  /// Method to update Refresh token using Authenticator
  Future<TokenResponse?> refreshKeycloakToken() async {
    String clientId = FormsFlowAIConstants.clientId;
    const String redirectUrl = FormsFlowAIConstants.keycloakRedirectUrl;
    const List<String> scopes = FormsFlowAIConstants.keycloakScopes;

    final serviceConfiguration =
        FlutterAuthUtils.fetchAuthorizationConfiguration();

    return await flutterAppAuth.token(
      TokenRequest(
        clientId,
        redirectUrl,
        refreshToken: appPreferences.getRefreshToken(),
        serviceConfiguration: serviceConfiguration,
        scopes: scopes,
        allowInsecureConnections: false,
      ),
    );
  }

  /// Method to update Refresh token before 60 seconds of its expiration time
  void updateRefreshBeforeTokenExpiry() {
    isRefreshingToken = true;
    try {
      refreshKeycloakToken().then((TokenResponse? result) {
        if (result != null) {
          appPreferences.setAccessToken(
              result.accessToken ?? appPreferences.getAccessToken());
          appPreferences.setRefreshToken(
              result.refreshToken ?? appPreferences.getRefreshToken());
          isRefreshingToken = false;
        }
      });
    } catch (e) {
      isRefreshingToken = false;
    }
  }
}
