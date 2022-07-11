import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_api/post/task/update_task_post_model.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../repository/task/task_data_repository.dart';

/// [UpdateRemoteTaskUseCase] to update the task update in remote
/// interacts with [TaskDataRepository] to complete the operation
/// [UpdateRemoteTaskParams]
class UpdateRemoteTaskUseCase implements UseCase<void, UpdateRemoteTaskParams> {
  const UpdateRemoteTaskUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, void>> call({required UpdateRemoteTaskParams params}) {
    return repository.updateRemoteTask(
        updateTaskPostModel: params.updateTaskPostModel, taskId: params.taskId);
  }
}

class UpdateRemoteTaskParams extends Equatable {
  final String taskId;
  final UpdateTaskPostModel updateTaskPostModel;

  const UpdateRemoteTaskParams(
      {required this.taskId, required this.updateTaskPostModel});

  @override
  List<Object?> get props => [taskId, updateTaskPostModel];
}
