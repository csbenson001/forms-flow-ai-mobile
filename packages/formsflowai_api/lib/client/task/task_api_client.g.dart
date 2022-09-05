// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TaskApiClient implements TaskApiClient {
  _TaskApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://app2.aot-technologies.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<FiltersResponse>> fetchFilters(accessToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<
        List<FiltersResponse>>(Options(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': accessToken},
            extra: _extra)
        .compose(_dio.options,
            'camunda/engine-rest-ext/filter?resourceType=Task&itemCount=true',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => FiltersResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<ProcessDefinitionResponse>> fetchProcessDefinitions(
      accessToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ProcessDefinitionResponse>>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options, 'camunda/engine-rest-ext/process-definition',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            ProcessDefinitionResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<TaskListResponse>> fetchTasks(
      accessToken, id, firstResult, maxResults, taskSortingPostModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'firstResult': firstResult,
      r'maxResults': maxResults
    };
    final _data = <String, dynamic>{};
    _data.addAll(taskSortingPostModel.toJson());
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<TaskListResponse>>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options, 'camunda/engine-rest-ext/filter/$id/list?',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map(
            (dynamic i) => TaskListResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TaskCountResponse> fetchTaskCount(accessToken, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TaskCountResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options, 'camunda/engine-rest-ext/filter/$id/count',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskCountResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HttpResponse<TaskVariablesResponse>> fetchTaskVariables(
      accessToken, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<TaskVariablesResponse>>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options, 'camunda/engine-rest-ext/task/$id/variables',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskVariablesResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<TaskListResponse> fetchTaskById(accessToken, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TaskListResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options, 'camunda/engine-rest-ext/task/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HttpResponse<void>> claimTask(accessToken, id, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<void>(_setStreamType<HttpResponse<void>>(
        Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options, 'camunda/engine-rest-ext/task/$id/claim',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final httpResponse = HttpResponse(null, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<void>> unclaimTask(accessToken, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<void>(_setStreamType<HttpResponse<void>>(
        Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options, 'camunda/engine-rest-ext/task/$id/unclaim',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final httpResponse = HttpResponse(null, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<void>> submitForm(
      accessToken, id, formSubmissionPostModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(formSubmissionPostModel.toJson());
    final _result = await _dio.fetch<void>(_setStreamType<HttpResponse<void>>(
        Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(
                _dio.options, 'camunda/engine-rest-ext/task/$id/submit-form',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final httpResponse = HttpResponse(null, _result);
    return httpResponse;
  }

  @override
  Future<void> updateTask(accessToken, id, updateTaskPostModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateTaskPostModel.toJson());
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'PUT',
            headers: <String, dynamic>{r'Authorization': accessToken},
            extra: _extra)
        .compose(_dio.options, 'camunda/engine-rest-ext/task/$id',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<HttpResponse<List<TaskGroupsResponse>>> fetchTaskGroups(
      accessToken, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<
        HttpResponse<List<TaskGroupsResponse>>>(Options(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': accessToken},
            extra: _extra)
        .compose(_dio.options,
            'camunda/engine-rest-ext/task/$id/identity-links?type=candidate',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            TaskGroupsResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<void>> addGroup(
      accessToken, id, addGroupPostModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addGroupPostModel.toJson());
    final _result = await _dio.fetch<void>(_setStreamType<
        HttpResponse<void>>(Options(
            method: 'POST',
            headers: <String, dynamic>{r'Authorization': accessToken},
            extra: _extra)
        .compose(_dio.options,
            'camunda/engine-rest-ext/task/$id/identity-links?type=candidate',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final httpResponse = HttpResponse(null, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<ListMembersResponse>>> fetchMembersList(
      accessToken, memberOfGroup) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'memberOfGroup': memberOfGroup};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<ListMembersResponse>>>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options, 'camunda/engine-rest-ext/user',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            ListMembersResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<void>> deleteGroup(
      accessToken, id, deleteGroupPostModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(deleteGroupPostModel.toJson());
    final _result = await _dio.fetch<void>(_setStreamType<HttpResponse<void>>(
        Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options,
                'camunda/engine-rest-ext/task/$id/identity-links/delete',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final httpResponse = HttpResponse(null, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<void>> updateAssignee(accessToken, id, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<void>(_setStreamType<HttpResponse<void>>(
        Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': accessToken},
                extra: _extra)
            .compose(_dio.options, 'camunda/engine-rest-ext/task/$id/assignee',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final httpResponse = HttpResponse(null, _result);
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
