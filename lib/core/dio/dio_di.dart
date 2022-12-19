import 'package:dio/dio.dart';
import 'package:formsflowai/core/dio/dio_form_auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../di/injection.dart';
import 'dio_task_auth_interceptor.dart';

class DioHelper {
  final _userDio = Dio(
    BaseOptions(
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ),
  );

  final _taskDio = Dio(
    BaseOptions(
      receiveTimeout: 15000, // 5 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ),
  );

  final _formDio = Dio(
    BaseOptions(
      receiveTimeout: 15000, // 5 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ),
  );

  final _applicationDio = Dio(
    BaseOptions(
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ),
  );

  Dio getUserDio() {
    // customization
    _userDio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      request: true,
      error: true,
      compact: true,
    ));

    return _userDio;
  }

  Dio getApplicationDio() {
    // customization
    _applicationDio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      request: true,
      error: true,
      compact: true,
    ));

    _applicationDio.interceptors.add(TaskAuthorizationInterceptor(
        flutterAppAuth: dl(), appPreferences: dl()));

    return _applicationDio;
  }

  Dio getFormDio() {
    // customization
    _formDio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      request: true,
      error: true,
      compact: true,
    ));

    _formDio.interceptors.add(FormsAuthorizationInterceptor(
        flutterAppAuth: dl(), appPreferences: dl()));

    return _formDio;
  }

  Dio getTaskDio() {
    // customization
    _taskDio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      request: true,
      error: true,
      compact: true,
    ));
    _taskDio.interceptors.add(TaskAuthorizationInterceptor(
        flutterAppAuth: dl(), appPreferences: dl()));
    return _taskDio;
  }
}
