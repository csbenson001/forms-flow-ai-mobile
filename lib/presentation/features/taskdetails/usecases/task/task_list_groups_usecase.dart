import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_api/response/task/details/task_group_response.dart';

import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../repository/task/task_data_repository.dart';

/// [ListTaskGroupsUseCase] to fetch task groups
/// interacts with [TaskDataRepository] to complete the operation
/// [ListTaskGroupParams]
/// ---> Returns List[TaskGroupsResponse]
class ListTaskGroupsUseCase
    implements UseCase<List<TaskGroupsResponse>, ListTaskGroupParams> {
  const ListTaskGroupsUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, List<TaskGroupsResponse>>> call(
      {required ListTaskGroupParams params}) {
    return repository.fetchGroups(taskId: params.taskId);
  }
}

class ListTaskGroupParams extends Equatable {
  final String taskId;

  const ListTaskGroupParams({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}
