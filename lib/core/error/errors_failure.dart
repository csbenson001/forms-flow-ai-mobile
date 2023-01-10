import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

/// [Failure] base class to specify exception type
abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

/// [ServerFailure] specifies server exception
class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// [TaskNotFoundFailure] specifies task not found in remote
class TaskNotFoundFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// [DataTypeFailure] specifies incorrect data type cast exception
class DataTypeFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// [AuthorizationTokenExpiredFailure] specifies token expired
class AuthorizationTokenExpiredFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// [CacheFailure] specifies cache failure
class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// [NoConnectionFailure] specifies connectivity failure
class NoConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// [NoResourceFoundFailure] specifies no resource found
class NoResourceFoundFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class RefreshTokenExpiredException extends DioError {
  RefreshTokenExpiredException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'refresh token expired';
  }
}
