import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_api/post/task/add_group_post_model.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../repository/task/task_data_repository.dart';

/// [AddGroupsUseCase] to add groups
/// interacts with [TaskDataRepository] to complete the operation
/// [AddGroupParams]
class AddGroupsUseCase implements UseCase<void, AddGroupParams> {
  const AddGroupsUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, void>> call({
    required AddGroupParams params,
  }) {
    return repository.addGroup(
        taskId: params.taskId, addGroupPostModel: params.addGroupPostModel);
  }
}

class AddGroupParams extends Equatable {
  final String taskId;
  final AddGroupPostModel addGroupPostModel;

  const AddGroupParams({required this.taskId, required this.addGroupPostModel});

  @override
  List<Object?> get props => [taskId, addGroupPostModel];
}
