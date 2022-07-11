import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolatedResponse;

import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../repository/task/task_data_repository.dart';

/// [FetchIsolatedTaskVariablesUseCase] to fetch task variables response in isolate
/// interacts with [TaskDataRepository] to complete the operation
/// [FetchIsolatedTaskVariablesParams]
/// [isolatedResponse.Response]
class FetchIsolatedTaskVariablesUseCase
    implements
        UseCase<isolatedResponse.Response, FetchIsolatedTaskVariablesParams> {
  const FetchIsolatedTaskVariablesUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, isolatedResponse.Response>> call(
      {required FetchIsolatedTaskVariablesParams params}) {
    return repository.fetchIsolatedTaskVariables(
        host:
            '${ApiConstantUrl.FORMSFLOWAI_BASE_URL}${ApiConstantUrl.CAMUNDA_ENGINE_REST}/${ApiConstantUrl.TASK}/${params.taskId}/variables');
  }
}

class FetchIsolatedTaskVariablesParams extends Equatable {
  final String taskId;

  const FetchIsolatedTaskVariablesParams({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}
