import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_shared/core/database/entity/task_entity.dart';

import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../repository/task/task_data_repository.dart';

/// [DeleteLocalTaskUseCase] to delete task from local data source
/// interacts with [TaskDataRepository] to complete the operation
/// [DeleteLocalTaskParams]
class DeleteLocalTaskUseCase implements UseCase<void, DeleteLocalTaskParams> {
  const DeleteLocalTaskUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, void>> call({
    required DeleteLocalTaskParams params,
  }) {
    return repository.deleteTask(task: params.task);
  }
}

class DeleteLocalTaskParams extends Equatable {
  final TaskEntity task;

  const DeleteLocalTaskParams({required this.task});

  @override
  List<Object?> get props => [task];
}
