import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../repository/task/task_data_repository.dart';

/// [UpdateAssigneeUseCase] to update the task assignee
/// interacts with [TaskDataRepository] to complete the operation
/// [UpdateAssigneeParams]
class UpdateAssigneeUseCase implements UseCase<void, UpdateAssigneeParams> {
  const UpdateAssigneeUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, void>> call({
    required UpdateAssigneeParams params,
  }) {
    return repository.updateAssignee(
        taskId: params.taskId, payload: params.payload);
  }
}

class UpdateAssigneeParams extends Equatable {
  final String taskId;
  final Map<String, String> payload;

  const UpdateAssigneeParams({required this.taskId, required this.payload});

  @override
  List<Object?> get props => [taskId, payload];
}
