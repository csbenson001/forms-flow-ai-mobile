import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_api/post/task/update_task_post_model.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolatedResponse;

import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../repository/task/task_data_repository.dart';

/// [UpdateIsolatedTaskUseCase] to update the task in remote isolate
/// interacts with [TaskDataRepository] to complete the operation
/// [UpdateIsolatedTaskParams]
/// ---> Returns[isolatedResponse.Response]

class UpdateIsolatedTaskUseCase
    implements UseCase<isolatedResponse.Response, UpdateIsolatedTaskParams> {
  const UpdateIsolatedTaskUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, isolatedResponse.Response>> call(
      {required UpdateIsolatedTaskParams params}) {
    String url =
        "${ApiConstantUrl.FORMSFLOWAI_BASE_URL}${ApiConstantUrl.CAMUNDA_ENGINE_REST}/${ApiConstantUrl.TASK}/${params.taskId}";
    return repository.updateTaskWithIsolates(
        url: url,
        updateTaskPostModel: params.updateTaskPostModel,
        taskId: params.taskId);
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
