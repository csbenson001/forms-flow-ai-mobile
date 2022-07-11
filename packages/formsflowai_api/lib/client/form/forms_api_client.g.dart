// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forms_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _FormsApiClient implements FormsApiClient {
  _FormsApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://app2.aot-technologies.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<dynamic>> submitFormData(jwtToken, formResourceId,
      formSubmissionId, formSubmissionResponse) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(formSubmissionResponse.toJson());
    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(
                method: 'PUT',
                headers: <String, dynamic>{r'x-jwt-token': jwtToken},
                extra: _extra)
            .compose(_dio.options,
                'formio/form/$formResourceId/submission/$formSubmissionId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> getFormIoJson(jwtToken, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(
                method: 'GET',
                headers: <String, dynamic>{r'x-jwt-token': jwtToken},
                extra: _extra)
            .compose(_dio.options, 'formio/form/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<FormSubmissionResponse>> fetchFormSubmissionData(
      jwtToken, resourceId, submissionId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<FormSubmissionResponse>>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'x-jwt-token': jwtToken},
                extra: _extra)
            .compose(_dio.options,
                'formio/form/$resourceId/submission/$submissionId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FormSubmissionResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}