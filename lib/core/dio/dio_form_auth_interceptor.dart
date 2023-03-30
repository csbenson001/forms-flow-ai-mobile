import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:formsflowai/core/api/utils/api_constants_url.dart';

import '../../shared/formsflow_api_constants.dart';
import '../error/errors_failure.dart';
import '../preferences/app_preference.dart';

class FormsAuthorizationInterceptor extends QueuedInterceptorsWrapper {
  final AppPreferences appPreferences;
  final FlutterAppAuth flutterAppAuth;

  FormsAuthorizationInterceptor({
    required this.appPreferences,
    required this.flutterAppAuth,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final String token = appPreferences.getFormJwtToken();
    if (token.isNotEmpty) {
      options.headers.addAll(
        <String, String>{
          FormsFlowAIApiConstants.headerJwtToken: token,
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
          if (err.response?.statusCode == 401 ||
              err.response?.statusCode == 400) {
            RequestOptions requestOptions = err.requestOptions;
            final options = Options(
                method: requestOptions.method,
                contentType: requestOptions.contentType,
                headers: requestOptions.headers);
            try {
              Dio dio = Dio();
              final result = await refreshFormioToken(dio: dio);
              if (result != null) {
                appPreferences.setFormJWtToken(result);
                if (result.isNotEmpty) {
                  options.headers?.addAll(
                    <String, String>{
                      FormsFlowAIApiConstants.headerJwtToken: result,
                    },
                  );
                }
                final response = await dio.request(
                    requestOptions.baseUrl + requestOptions.path,
                    options: options,
                    onReceiveProgress: requestOptions.onReceiveProgress,
                    data: requestOptions.data,
                    queryParameters: requestOptions.queryParameters);
                return handler.resolve(response);
              }
            } catch (e) {
              handler.next(RefreshTokenExpiredException(err.requestOptions));
            }
          } else {
            handler.next(RefreshTokenExpiredException(err.requestOptions));
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
  Future<String?> refreshFormioToken({required Dio dio}) async {
    var options = Options(receiveTimeout: 15000, sendTimeout: 15000, headers: {
      FormsFlowAIApiConstants.headerAuthorization:
          appPreferences.getBearerAccessToken(),
    });
    try {
      final formioRoleResponse = await dio.get(
        ApiConstantUrl.formsflowaiBaseUrl + ApiConstantUrl.fetchFormioRoles,
        options: options,
      );

      if (formioRoleResponse.statusCode == 200 ||
          formioRoleResponse.statusCode == 204 ||
          formioRoleResponse.statusCode == 201) {
        List<String> jwtTokenList = formioRoleResponse
                .headers.map[FormsFlowAIApiConstants.headerJwtToken] ??
            [];
        if (jwtTokenList.isNotEmpty) {
          String jwtToken = jwtTokenList[0].toString();
          return jwtToken;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
