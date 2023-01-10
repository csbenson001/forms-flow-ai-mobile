import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/application/application_data_repository.dart';

import '../../../../../../core/api/response/form/roles/formio_roles_response.dart';
import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';

/// [FetchFormioRolesUseCase] to fetch formio roles from remote data source
/// interacts with [ApplicationHistoryDataRepository] to complete the operation
/// [FetchFormioRolesParams]
/// --> Returns [FormioRolesResponse]
class FetchFormioRolesUseCase
    implements UseCase<FormioRolesResponse, FetchFormioRolesParams> {
  const FetchFormioRolesUseCase({required this.repository});

  final ApplicationHistoryDataRepository repository;

  @override
  Future<Either<Failure, FormioRolesResponse>> call({
    required FetchFormioRolesParams params,
  }) {
    return repository.fetchFormioRoles();
  }
}

class FetchFormioRolesParams extends Equatable {
  const FetchFormioRolesParams();

  @override
  List<Object?> get props => [];
}
