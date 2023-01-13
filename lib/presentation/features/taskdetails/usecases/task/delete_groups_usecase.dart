import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/api/post/task/delete_group_post_model.dart';
import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../repository/task/task_data_repository.dart';

/// [DeleteGroupsUseCase] to delete the group
/// interacts with [TaskDataRepository] to complete the operation
/// [DeleteGroupParams]
class DeleteGroupsUseCase implements UseCase<void, DeleteGroupParams> {
  const DeleteGroupsUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, void>> call({
    required DeleteGroupParams params,
  }) {
    return repository.deleteGroup(
        taskId: params.taskId, addGroupPostModel: params.deleteGroupPostModel);
  }
}

class DeleteGroupParams extends Equatable {
  final String taskId;
  final DeleteGroupPostModel deleteGroupPostModel;

  const DeleteGroupParams(
      {required this.taskId, required this.deleteGroupPostModel});

  @override
  List<Object?> get props => [taskId, deleteGroupPostModel];
}
