import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/application/application_data_repository.dart';

import '../../../../../core/database/entity/application_history_entity.dart';
import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';

// [InsertLocalApplicationHistoryUseCase] to insert application history
/// data into local data source
/// interacts with [ApplicationHistoryDataRepository] to complete the operation
/// [InsertLocalApplicationHistoryParams]
class InsertLocalApplicationHistoryUseCase
    implements UseCase<void, InsertLocalApplicationHistoryParams> {
  const InsertLocalApplicationHistoryUseCase({required this.repository});

  final ApplicationHistoryDataRepository repository;

  @override
  Future<Either<Failure, void>> call({
    required InsertLocalApplicationHistoryParams params,
  }) {
    return repository.insertAllApplicationHistory(
        applicationEntityList: params.appplicationEntityList);
  }
}

class InsertLocalApplicationHistoryParams extends Equatable {
  final List<ApplicationHistoryEntity> appplicationEntityList;

  const InsertLocalApplicationHistoryParams(
      {required this.appplicationEntityList});

  @override
  List<Object?> get props => [appplicationEntityList];
}
