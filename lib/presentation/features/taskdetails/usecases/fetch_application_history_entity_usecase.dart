import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_shared/core/database/entity/application_history_entity.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../repository/application/application_data_repository.dart';

/// [FetchApplicationHistoryEntityUseCase] to fetch application history
/// data from local data source
/// interacts with [ApplicationHistoryDataRepository] to complete the operation
/// [FetchTaskCountParams]
/// ---> Returns List[ApplicationHistoryEntity]
class FetchApplicationHistoryEntityUseCase
    implements
        UseCase<List<ApplicationHistoryEntity?>,
            FetchApplicationHistoryEntityParams> {
  const FetchApplicationHistoryEntityUseCase({required this.repository});

  final ApplicationHistoryDataRepository repository;

  @override
  Future<Either<Failure, List<ApplicationHistoryEntity?>>> call({
    required FetchApplicationHistoryEntityParams params,
  }) {
    return repository.fetchApplicationHistoryFromDb(
        applicationId: params.applicationId);
  }
}

/// Input params for application history

class FetchApplicationHistoryEntityParams extends Equatable {
  final int applicationId;

  const FetchApplicationHistoryEntityParams({required this.applicationId});

  @override
  List<Object?> get props => [applicationId];
}
