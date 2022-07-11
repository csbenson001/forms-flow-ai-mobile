import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../repository/task/task_data_repository.dart';

/// [ClaimTaskUseCase] to claim task
/// interacts with [TaskDataRepository] to complete the operation
/// [ClaimTaskParams]
class ClaimTaskUseCase implements UseCase<void, ClaimTaskParams> {
  const ClaimTaskUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, void>> call({required ClaimTaskParams params}) {
    return repository.claimTask(taskId: params.taskId, payload: params.payload);
  }
}

class ClaimTaskParams extends Equatable {
  final String taskId;
  final Map<String, String> payload;

  const ClaimTaskParams({required this.taskId, required this.payload});

  @override
  List<Object?> get props => [taskId, payload];
}
