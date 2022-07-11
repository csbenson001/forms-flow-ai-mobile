import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../repository/task/task_data_repository.dart';

/// [UnClaimTaskUseCase] to unclaim task
/// interacts with [TaskDataRepository] to complete the operation
/// [UnClaimTaskParams]
class UnClaimTaskUseCase implements UseCase<void, UnClaimTaskParams> {
  const UnClaimTaskUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, void>> call({required UnClaimTaskParams params}) {
    return repository.unClaimTask(taskId: params.taskId);
  }
}

class UnClaimTaskParams extends Equatable {
  final String taskId;

  const UnClaimTaskParams({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}
