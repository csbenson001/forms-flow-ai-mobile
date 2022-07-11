import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/task/task_data_repository.dart';
import 'package:formsflowai_api/response/filter/get_filters_response.dart';

import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';

/// [FetchFiltersUseCase] to fetch task filters response
/// interacts with [TaskDataRepository] to complete the operation
/// [FetchFiltersParams]
/// ---> Returns List[FiltersResponse]
class FetchFiltersUseCase
    implements UseCase<List<FiltersResponse>, FetchFiltersParams> {
  const FetchFiltersUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, List<FiltersResponse>>> call({
    required FetchFiltersParams params,
  }) {
    return repository.fetchFilters();
  }
}

class FetchFiltersParams extends Equatable {
  @override
  List<Object?> get props => [];
}
