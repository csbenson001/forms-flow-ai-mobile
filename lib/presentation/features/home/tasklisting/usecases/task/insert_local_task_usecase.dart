import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/database/entity/task_entity.dart';
import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../repository/task/task_data_repository.dart';

/// [InsertLocalTaskUseCase] to insert tasks into local data source
/// interacts with [TaskDataRepository] to complete the operation
/// [InsertLocalTaskParams]
class InsertLocalTaskUseCase implements UseCase<int, InsertLocalTaskParams> {
  const InsertLocalTaskUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, int>> call({
    required InsertLocalTaskParams params,
  }) {
    return repository.insertTask(task: params.task);
  }
}

class InsertLocalTaskParams extends Equatable {
  final TaskEntity task;

  const InsertLocalTaskParams({required this.task});

  @override
  List<Object?> get props => [task];
}
