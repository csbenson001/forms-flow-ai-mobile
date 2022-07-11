import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_shared/core/database/entity/task_entity.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../repository/task/task_data_repository.dart';

/// [FetchLocalTaskUseCase] to fetch task from local data source
/// interacts with [TaskDataRepository] to complete the operation
/// [FetchLocalTaskParams]
/// ---> Returns[TaskEntity]
class FetchLocalTaskUseCase
    implements UseCase<TaskEntity?, FetchLocalTaskParams> {
  const FetchLocalTaskUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, TaskEntity?>> call({
    required FetchLocalTaskParams params,
  }) {
    return repository.fetchTaskByIdFromLocalDb(taskId: params.taskId);
  }
}

class FetchLocalTaskParams extends Equatable {
  final String taskId;

  const FetchLocalTaskParams({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}
