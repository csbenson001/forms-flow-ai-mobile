import 'package:equatable/equatable.dart';

/// [Failure] base class to specify exception type
abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super();
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
