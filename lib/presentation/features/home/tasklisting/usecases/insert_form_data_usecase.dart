import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/form/form_data_repository.dart';
import 'package:formsflowai_shared/core/database/entity/form_entity.dart';

import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';

/// [InsertFormDataUseCase] to fetch insert form data into local data source
/// interacts with [FormDataRepository] to complete the operation
/// [InsertFormDataParams]

class InsertFormDataUseCase implements UseCase<void, InsertFormDataParams> {
  const InsertFormDataUseCase({required this.repository});

  final FormDataRepository repository;

  @override
  Future<Either<Failure, void>> call({
    required InsertFormDataParams params,
  }) {
    return repository.insertFormData(formsFlowForm: params.formEntity);
  }
}

class InsertFormDataParams extends Equatable {
  final FormEntity formEntity;

  const InsertFormDataParams({required this.formEntity});

  @override
  List<Object?> get props => [formEntity];
}
