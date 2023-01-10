import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolated_response;

import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../repository/task/task_data_repository.dart';

/// [FetchIsolatedTaskVariablesUseCase] to fetch task variables response in isolate
/// interacts with [TaskDataRepository] to complete the operation
/// [FetchIsolatedTaskVariablesParams]
/// [isolated_response.Response]
class FetchIsolatedTaskVariablesUseCase
    implements
        UseCase<isolated_response.Response, FetchIsolatedTaskVariablesParams> {
  const FetchIsolatedTaskVariablesUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, isolated_response.Response>> call(
      {required FetchIsolatedTaskVariablesParams params}) {
    return repository.fetchIsolatedTaskVariables(taskId: params.taskId);
  }
}

class FetchIsolatedTaskVariablesParams extends Equatable {
  final String taskId;

  const FetchIsolatedTaskVariablesParams({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}
