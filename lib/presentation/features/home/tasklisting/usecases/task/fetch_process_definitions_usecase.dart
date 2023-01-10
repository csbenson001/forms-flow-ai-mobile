import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/api/response/processdefinition/process_definition_response.dart';
import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../repository/task/task_data_repository.dart';

/// [FetchProcessDefinitionUseCase] to fetch processDefinition response
/// interacts with [TaskDataRepository] to complete the operation
/// [FetchProcessDefinitionParams]
/// ---> Returns List[ProcessDefinitionResponse]
class FetchProcessDefinitionUseCase
    implements
        UseCase<List<ProcessDefinitionResponse>, FetchProcessDefinitionParams> {
  const FetchProcessDefinitionUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, List<ProcessDefinitionResponse>>> call({
    required FetchProcessDefinitionParams params,
  }) {
    return repository.fetchProcessDefinitions();
  }
}

class FetchProcessDefinitionParams extends Equatable {
  @override
  List<Object?> get props => [];
}
