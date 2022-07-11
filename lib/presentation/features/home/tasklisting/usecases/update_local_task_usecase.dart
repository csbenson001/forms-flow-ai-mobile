import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_shared/core/database/entity/task_entity.dart';

import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../repository/task/task_data_repository.dart';

/// [UpdateLocalTaskUseCase] to update task in local data source
/// interacts with [TaskDataRepository] to complete the operation
/// [UpdateLocalTaskParams]
class UpdateLocalTaskUseCase implements UseCase<void, UpdateLocalTaskParams> {
  const UpdateLocalTaskUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, void>> call({
    required UpdateLocalTaskParams params,
  }) {
    return repository.updateTaskInLocalDB(task: params.task);
  }
}

class UpdateLocalTaskParams extends Equatable {
  final TaskEntity task;

  const UpdateLocalTaskParams({required this.task});

  @override
  List<Object?> get props => [task];
}
