import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolatedResponse;

import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../repository/task/task_data_repository.dart';

/// [FetchIsolatedTaskUseCase] to fetch task response in isolate
/// interacts with [TaskDataRepository] to complete the operation
/// [FetchIsolatedTaskParams]
/// [isolatedResponse.Response]
class FetchIsolatedTaskUseCase
    implements UseCase<isolatedResponse.Response, FetchIsolatedTaskParams> {
  const FetchIsolatedTaskUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, isolatedResponse.Response>> call(
      {required FetchIsolatedTaskParams params}) {
    return repository.fetchTaskWithIsolate(
        host:
            '${ApiConstantUrl.FORMSFLOWAI_BASE_URL}${ApiConstantUrl.CAMUNDA_ENGINE_REST}/${ApiConstantUrl.TASK}/',
        taskId: params.taskId);
  }
}

class FetchIsolatedTaskParams extends Equatable {
  final String taskId;

  const FetchIsolatedTaskParams({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}
