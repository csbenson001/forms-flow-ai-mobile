import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/application/application_data_repository.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../model/application_history_data_model.dart';

/// [FetchApplicationHistoryUseCase] to fetch application history
/// data from remote
/// interacts with [ApplicationHistoryDataRepository] to complete the operation
/// [FetchTaskCountParams]
/// ---> Returns List[ApplicationHistoryDM]
class FetchApplicationHistoryUseCase
    implements
        UseCase<List<ApplicationHistoryDM>, FetchApplicationHistoryParams> {
  const FetchApplicationHistoryUseCase({required this.repository});

  final ApplicationHistoryDataRepository repository;

  @override
  Future<Either<Failure, List<ApplicationHistoryDM>>> call({
    required FetchApplicationHistoryParams params,
  }) {
    return repository.fetchApplicationHistory(
        applicationId: params.applicationId);
  }
}

class FetchApplicationHistoryParams extends Equatable {
  final int applicationId;

  const FetchApplicationHistoryParams({required this.applicationId});

  @override
  List<Object?> get props => [applicationId];
}
