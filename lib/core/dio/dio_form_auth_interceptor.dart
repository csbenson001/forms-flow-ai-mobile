import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

import '../../shared/formsflow_api_constants.dart';
import '../../utils/form/jwttoken/jwt_token_util.dart';
import '../api/response/form/roles/formio_roles_response.dart';
import '../error/errors_failure.dart';
import '../preferences/app_preference.dart';

class FormsAuthorizationInterceptor extends QueuedInterceptorsWrapper {
  final AppPreferences appPreferences;
  final FlutterAppAuth flutterAppAuth;

  FormsAuthorizationInterceptor(
      {required this.appPreferences, required this.flutterAppAuth});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String token = appPreferences.getFormJwtToken();
    if (token.isNotEmpty) {
      options.headers.addAll(
        <String, String>{
          'x-jwt-token': token,
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
            final formioRolesResponse = appPreferences.getFormioRoleResponse();
            if (formioRolesResponse != null &&
                formioRolesResponse.form != null) {
              try {
                Form? reviewer = formioRolesResponse.form?.singleWhere(
                    (element) =>
                        element.type == FormsFlowAIApiConstants.reviewer);

                Form? resourceId = formioRolesResponse.form?.singleWhere(
                    (element) =>
                        element.type == FormsFlowAIApiConstants.resourceId);

                if (reviewer != null) {
                  List<String> roles = List.empty(growable: true);
                  roles.add(reviewer.roleId ?? '');
                  appPreferences.setFormJWtToken(JwtTokenUtils.signJwtToken(
                      userResourceId: resourceId?.roleId ?? '', roles: roles));
                }
              } catch (e) {
                appPreferences.setFormJWtToken(JwtTokenUtils.signJwtToken());
              }
            } else {
              appPreferences.setFormJWtToken(JwtTokenUtils.signJwtToken());
            }

            try {
              Dio dio = Dio();
              final response = await dio.request(
                  requestOptions.baseUrl + requestOptions.path,
                  options: options,
                  cancelToken: requestOptions.cancelToken,
                  onReceiveProgress: requestOptions.onReceiveProgress,
                  data: requestOptions.data,
                  queryParameters: requestOptions.queryParameters);
              return handler.resolve(response);
            } catch (e) {
              () {};
            }
          } else {}
          break;

        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          throw NoInternetConnectionException(err.requestOptions);
      }
    }
  }
}
