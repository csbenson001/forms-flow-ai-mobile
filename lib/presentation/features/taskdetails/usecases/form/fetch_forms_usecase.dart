import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/form/form_data_repository.dart';

import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../model/form_dm.dart';

/// [FetchFormUseCase] to fetch form submission data
/// interacts with [FormDataRepository] to complete the operation
/// [FetchSubmissionParams]
/// ---> Returns [FormDM]
class FetchFormUseCase implements UseCase<FormDM?, FetchFormParams> {
  const FetchFormUseCase({required this.repository});

  final FormDataRepository repository;

  @override
  Future<Either<Failure, FormDM?>> call({required FetchFormParams params}) {
    return repository.fetchFormsData(id: params.formResourceId);
  }
}

class FetchFormParams extends Equatable {
  final String formResourceId;

  const FetchFormParams({required this.formResourceId});

  @override
  List<Object?> get props => [formResourceId];
}
