import 'package:dio/dio.dart';
import 'package:formsflowai/core/api/utils/api_constants_url.dart';
import 'package:formsflowai/core/dio/dio_application_history_auth_interceptor.dart';
import 'package:formsflowai/core/dio/dio_form_auth_interceptor.dart';

import '../di/injection.dart';
import 'dio_task_auth_interceptor.dart';

class DioHelper {
  Dio getUserDio() {
    final userDio = Dio(
      BaseOptions(
        baseUrl: ApiConstantUrl.keycloakAuthBaseUrl,
        receiveTimeout: 15000, // 15 seconds
        connectTimeout: 15000,
        sendTimeout: 15000,
      ),
    );

    // customization
    // userDio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: false,
    //   request: true,
    //   error: true,
    //   compact: true,
    // ));

    return userDio;
  }

  Dio getApplicationDio() {
    final applicationDio = Dio(
      BaseOptions(
        baseUrl: ApiConstantUrl.formsflowaiBaseUrl,
        receiveTimeout: 15000, // 15 seconds
        connectTimeout: 15000,
        sendTimeout: 15000,
      ),
    );
    // // customization
    // applicationDio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: false,
    //   request: true,
    //   error: true,
    //   compact: true,
    // ));

    applicationDio.interceptors.add(ApplicationHistoryAuthorizationInterceptor(
        flutterAppAuth: dl(), appPreferences: dl()));

    return applicationDio;
  }

  Dio getFormDio() {
    final formDio = Dio(
      BaseOptions(
        baseUrl: ApiConstantUrl.formsflowaiFormBaseUrl,
        receiveTimeout: 15000, // 5 seconds
        connectTimeout: 15000,
        sendTimeout: 15000,
      ),
    );
    // // customization
    // formDio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: false,
    //   request: true,
    //   error: true,
    //   compact: true,
    // ));

    formDio.interceptors.add(FormsAuthorizationInterceptor(
        flutterAppAuth: dl(), appPreferences: dl()));

    return formDio;
  }

  Dio getTaskDio() {
    final taskDio = Dio(
      BaseOptions(
        baseUrl: ApiConstantUrl.formsflowaiBpmBaseUrl,
        receiveTimeout: 15000, // 5 seconds
        connectTimeout: 15000,
        sendTimeout: 15000,
      ),
    );

    // // customization
    // taskDio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: false,
    //   request: true,
    //   error: true,
    //   compact: true,
    // ));
    taskDio.interceptors.add(TaskAuthorizationInterceptor(
        flutterAppAuth: dl(), appPreferences: dl()));
    return taskDio;
  }
}
