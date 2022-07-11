import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio getDio() {
  final dio = Dio(); // Provide a dio instance
// customization
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    request: true,
    error: true,
    compact: true,
  ));

  return dio;
}

Dio getDioWithHeaders(String? accessToken) {
  final dio = Dio(); // Provide a dio instance
// customization
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    request: true,
    error: true,
    compact: true,
  ));

  // if (!GeneralUtil.isStringEmpty(accessToken)) {
  //   Logger logger = Logger();
  //   logger.e("Added Header Token", accessToken);
  //   dio.options.headers["Authorization"] =
  //       ApiUtils.getBearerToken(accessToken ?? '');
  // }

  return dio;
}
