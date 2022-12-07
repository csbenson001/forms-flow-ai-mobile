import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_api/response/filter/task_count_response.dart';

import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../repository/task/task_data_repository.dart';

/// [FetchTaskCountUseCase] to fetch task count for the
/// selected filterId
/// interacts with [TaskDataRepository] to complete the operation
/// [FetchTaskCountParams]
/// ---> Returns[TaskCountResponse]
class FetchTaskCountUseCase
    implements UseCase<TaskCountResponse, FetchTaskCountParams> {
  const FetchTaskCountUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, TaskCountResponse>> call({
    required FetchTaskCountParams params,
  }) {
    return repository.fetchTaskCount(params.filterId);
  }
}

/// Input params for task count usecase

class FetchTaskCountParams extends Equatable {
  final String filterId;

  const FetchTaskCountParams({required this.filterId});

  @override
  List<Object?> get props => [];
}
