class BaseResponse {
  int? statusCode;
  String? message;

  BaseResponse({this.statusCode, this.message});

  BaseResponse transform({int? code, String? message}) {
    return BaseResponse(statusCode: code, message: message);
  }
}
