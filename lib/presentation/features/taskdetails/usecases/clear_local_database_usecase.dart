import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../repository/task/task_data_repository.dart';

/// [ClearLocalDatabaseUseCase] to delete local data source items
/// interacts with [TaskDataRepository] to complete the operation
/// [ClearLocalDatabaseUseCaseParams]

class ClearLocalDatabaseUseCase
    implements UseCase<void, ClearLocalDatabaseUseCaseParams> {
  const ClearLocalDatabaseUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, void>> call({
    required ClearLocalDatabaseUseCaseParams params,
  }) {
    return repository.clearDatabaseData();
  }
}

class ClearLocalDatabaseUseCaseParams extends Equatable {
  const ClearLocalDatabaseUseCaseParams();

  @override
  List<Object?> get props => [];
}
