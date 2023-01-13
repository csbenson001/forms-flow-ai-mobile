/// [BaseResponse] class
/// contains status, message, status code
class BaseResponse<T> {
  final bool? status;
  final int? statusCode;
  final String? message;
  final T? data;
  BaseResponse({this.status, this.statusCode, this.message, this.data});

  BaseResponse transform({int? code, String? message}) {
    return BaseResponse(statusCode: code, message: message);
  }
}
