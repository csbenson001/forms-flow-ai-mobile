import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/form/form_data_repository.dart';

import '../../../../../../core/database/entity/form_entity.dart';
import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';

/// [FetchFormEntityUseCase] to fetch form entity from local data source
/// interacts with [FormDataRepository] to complete the operation
/// [FetchFormEntityParams]
/// --> Returns Optional Nullable[FormEntity]
class FetchFormEntityUseCase
    implements UseCase<FormEntity?, FetchFormEntityParams> {
  const FetchFormEntityUseCase({required this.repository});

  final FormDataRepository repository;

  @override
  Future<Either<Failure, FormEntity?>> call({
    required FetchFormEntityParams params,
  }) {
    return repository.fetchFormEntity(formId: params.formId);
  }
}

class FetchFormEntityParams extends Equatable {
  final String formId;

  const FetchFormEntityParams({required this.formId});

  @override
  List<Object?> get props => [formId];
}
