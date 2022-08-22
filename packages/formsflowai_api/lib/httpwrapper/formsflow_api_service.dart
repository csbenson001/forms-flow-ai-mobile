import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:formsflowai_shared/utils/shared_general_util.dart';

import 'app_exceptions.dart';

class FormsFlowAIHttpService {
  final Dio dio;

  static const int TIME_OUT_DURATION = 20;
  String token = "";


  void init() {
    _initApiClient();
  }

  void initializeToken(String savedToken) {
    token = savedToken;
    _initApiClient();
  }

  Future<void> _initApiClient() async {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      if(!SharedGeneralUtil.isStringEmpty(token)) {
        options.headers["Authorization"] = "Bearer $token";
      }
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onResponse: (response, handler) async {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onError: (DioError e, handler) async {
      // Do something with response error

      if (e.response?.statusCode == 401) {
        RequestOptions origin = e.requestOptions;

        try {
          Response<dynamic> data = await dio.get("your_refresh_url");
          token = data.data['newToken'];
          // _customSharedPreferences.setToken(data.data['newToken']);
          origin.headers["Authorization"] = "Bearer " + data.data['newToken'];
          // return dio.request(origin.path, options: origin);
        } catch (err) {}
        return handler.next(e); //continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: `handler.resolve(response)`.
      }
    }));
  }



  FormsFlowAIHttpService(this.dio);
  //GET
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse("$baseUrl$api");
    try {
      var response = await dio
          .get(baseUrl + api)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse("$baseUrl$api");
    var payload = json.encode(payloadObj);
    try {
      var response = await dio
          .post(baseUrl + api, data: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //OTHER
  dynamic _processResponse(response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
