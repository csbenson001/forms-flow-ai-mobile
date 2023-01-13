import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/database/entity/task_entity.dart';
import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../repository/task/task_data_repository.dart';

/// [FetchLocalAllTasksUseCase] to fetch all taks from local data source
/// interacts with [TaskDataRepository] to complete the operation
/// [FetchLocalAllTasksParams]
/// --> Returns List[TaskEntity]
class FetchLocalAllTasksUseCase
    implements UseCase<List<TaskEntity>, FetchLocalAllTasksParams> {
  const FetchLocalAllTasksUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, List<TaskEntity>>> call({
    required FetchLocalAllTasksParams params,
  }) {
    return repository.fetchAllTasksFromLocalDb();
  }
}

class FetchLocalAllTasksParams extends Equatable {
  const FetchLocalAllTasksParams();

  @override
  List<Object?> get props => [];
}
