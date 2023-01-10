import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../repository/task/task_data_repository.dart';

/// [FetchTaskUseCase] to fetch task response
/// interacts with [TaskDataRepository] to complete the operation
/// [FetchTaskParams]
/// [Response]
class FetchTaskUseCase implements UseCase<Response, FetchTaskParams> {
  const FetchTaskUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, Response>> call({required FetchTaskParams params}) {
    return repository.fetchTask(taskId: params.taskId);
  }
}

class FetchTaskParams extends Equatable {
  final String taskId;

  const FetchTaskParams({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}
