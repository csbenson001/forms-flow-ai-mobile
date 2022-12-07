import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_api/response/task/details/list_members_response.dart';

import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../repository/task/task_data_repository.dart';

/// [ListMembersUseCase] to fetch member list to assign tasks
/// interacts with [TaskDataRepository] to complete the operation
/// [ListMembersParams]
/// ---> Returns List[ListMembersResponse]
class ListMembersUseCase
    implements UseCase<List<ListMembersResponse>, ListMembersParams> {
  const ListMembersUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, List<ListMembersResponse>>> call(
      {required ListMembersParams params}) {
    return repository.fetchMembers();
  }
}

class ListMembersParams extends Equatable {
  final String memberGroupName;

  const ListMembersParams(this.memberGroupName);

  @override
  List<Object?> get props => [memberGroupName];
}
