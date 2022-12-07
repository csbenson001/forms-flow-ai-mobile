// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _UserApiClient implements UserApiClient {
  _UserApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://iam.aot-technologies.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<KeyCloakLoginResponse> fetchToken(
    clientId,
    username,
    password,
    grantType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'client_id': clientId,
      'username': username,
      'password': password,
      'grant_type': grantType,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<KeyCloakLoginResponse>(Options(
      method: 'POST',
      headers: <String, dynamic>{},
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              'auth/realms/forms-flow-mahagony/protocol/openid-connect/token',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = KeyCloakLoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserInfoResponse> getUserInfo(accessToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserInfoResponse>(Options(
      method: 'POST',
      headers: <String, dynamic>{r'Authorization': accessToken},
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/realms/forms-flow-mahagony/protocol/openid-connect/userinfo',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserInfoResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<KeyCloakLoginResponse> refreshUserToken(
    clientId,
    clientSecret,
    refreshToken,
    grantType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'client_id': clientId,
      'client_secret': clientSecret,
      'refresh_token': refreshToken,
      'grant_type': grantType,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<KeyCloakLoginResponse>(Options(
      method: 'POST',
      headers: <String, dynamic>{},
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              'auth/realms/forms-flow-mahagony/protocol/openid-connect/token',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = KeyCloakLoginResponse.fromJson(_result.data!);
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
