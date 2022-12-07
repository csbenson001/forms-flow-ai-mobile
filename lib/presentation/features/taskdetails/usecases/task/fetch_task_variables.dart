import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../repository/task/task_data_repository.dart';
import '../../model/task_variable_dm.dart';

/// [FetchTaskVariablesUseCase] to fetch task count for the
/// selected filterId
/// interacts with [TaskDataRepository] to complete the operation
/// [FetchTaskVariablesParams]
/// ---> Returns[TaskVariableDM]
class FetchTaskVariablesUseCase
    implements UseCase<TaskVariableDM, FetchTaskVariablesParams> {
  const FetchTaskVariablesUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, TaskVariableDM>> call(
      {required FetchTaskVariablesParams params}) {
    return repository.fetchTaskVariables(id: params.taskId);
  }
}

class FetchTaskVariablesParams extends Equatable {
  final String taskId;

  FetchTaskVariablesParams({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}
