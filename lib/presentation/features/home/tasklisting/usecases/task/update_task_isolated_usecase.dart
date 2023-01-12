import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolated_response;

import '../../../../../../core/api/post/task/update_task_post_model.dart';
import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../repository/task/task_data_repository.dart';

/// [UpdateTaskIsolatedUseCase] to update the task in remote isolate
/// interacts with [TaskDataRepository] to complete the operation
/// [UpdateIsolatedTaskParams]
/// ---> Returns[isolated_response.Response]

class UpdateTaskIsolatedUseCase
    implements UseCase<isolated_response.Response, UpdateIsolatedTaskParams> {
  const UpdateTaskIsolatedUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, isolated_response.Response>> call(
      {required UpdateIsolatedTaskParams params}) {
    return repository.updateTaskIsolated(
        updateTaskPostModel: params.updateTaskPostModel, taskId: params.taskId);
  }
}

class UpdateIsolatedTaskParams extends Equatable {
  final String taskId;
  final UpdateTaskPostModel updateTaskPostModel;

  const UpdateIsolatedTaskParams(
      {required this.taskId, required this.updateTaskPostModel});

  @override
  List<Object?> get props => [taskId, updateTaskPostModel];
}
