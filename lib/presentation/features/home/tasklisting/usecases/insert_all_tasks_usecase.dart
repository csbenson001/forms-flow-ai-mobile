import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/task/task_data_repository.dart';
import 'package:formsflowai_shared/core/database/entity/task_entity.dart';

import '../../../../../../core/usecase/usecase.dart';
import '../../../../../core/error/errors_failure.dart';

/// [InsertAllTaskUseCase] to insert tasks into local data source
/// interacts with [TaskDataRepository] to complete the operation
/// [FetchTaskParams]
class InsertAllTaskUseCase implements UseCase<void, InsertAllTaskParams> {
  const InsertAllTaskUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, void>> call({
    required InsertAllTaskParams params,
  }) {
    return repository.insertAllTasks(tasks: params.tasks);
  }
}

class InsertAllTaskParams extends Equatable {
  final List<TaskEntity> tasks;

  const InsertAllTaskParams({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}
