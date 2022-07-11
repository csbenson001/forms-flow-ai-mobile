import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/model/task_base_response.dart';
import 'package:formsflowai_api/post/task/tasklist_sort.dart';
import 'package:formsflowai_api/response/processdefinition/process_definition_response.dart';

import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../repository/task/task_data_repository.dart';

/// [FetchTasksUseCase] to fetch tasks from remote
/// [FetchTaskParams]
/// interacts with [TaskDataRepository] to complete the operation
/// ---> Returns[TaskBaseDataResponse]
class FetchTasksUseCase
    implements UseCase<TaskBaseDataResponse, FetchTaskParams> {
  const FetchTasksUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, TaskBaseDataResponse>> call({
    required FetchTaskParams params,
  }) {
    return repository.fetchTasks(
        params.id,
        params.firstResult,
        params.maxResults,
        params.taskSortingPostModel,
        params.definitionResponse);
  }
}

class FetchTaskParams extends Equatable {
  final String id;
  final int firstResult;
  final int maxResults;
  final TaskSortPostModel taskSortingPostModel;
  final List<ProcessDefinitionResponse>? definitionResponse;

  const FetchTaskParams(
      {required this.id,
      required this.firstResult,
      required this.maxResults,
      required this.taskSortingPostModel,
      this.definitionResponse});

  @override
  List<Object?> get props => [];
}
