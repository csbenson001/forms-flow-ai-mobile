// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApplicationApiClient implements ApplicationApiClient {
  _ApplicationApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://app2.aot-technologies.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApplicationHistoryResponse> fetchApplicationHistory(
      accessToken, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApplicationHistoryResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options, 'api/application/$id/history',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApplicationHistoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BpmnDiagramResponse> fetchBpmnDiagram(accessToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BpmnDiagramResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options, 'api/process/onestepapproval/xml',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BpmnDiagramResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BpmnWorkflowInstancesResponse> fetchBpmnWorkflowInstance(
      accessToken, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BpmnWorkflowInstancesResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options,
                'api/process/process-instance/$id}/activity-instances',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BpmnWorkflowInstancesResponse.fromJson(_result.data!);
    return value;
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
