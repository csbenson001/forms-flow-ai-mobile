import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/form/form_data_repository.dart';
import 'package:formsflowai_api/response/form/submission/form_submission_response.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';

/// [SaveFormSubmissionIsolateUseCase] to save form submission in
/// the background
/// interacts with [FormDataRepository] to complete the operation
/// [SaveFormSubmissionIsolateParams]
class SaveFormSubmissionIsolateUseCase
    implements UseCase<void, SaveFormSubmissionIsolateParams> {
  const SaveFormSubmissionIsolateUseCase({required this.repository});

  final FormDataRepository repository;

  @override
  Future<Either<Failure, void>> call(
      {required SaveFormSubmissionIsolateParams params}) {
    return repository.submitFormData(
        formResourceId: params.formResourceId,
        formSubmissionId: params.formSubmissionId,
        formSubmissionResponse: params.formSubmissionResponse);
  }
}

class SaveFormSubmissionIsolateParams extends Equatable {
  final String formResourceId;
  final String formSubmissionId;
  final FormSubmissionResponse formSubmissionResponse;

  const SaveFormSubmissionIsolateParams(
      {required this.formSubmissionResponse,
      required this.formResourceId,
      required this.formSubmissionId});

  @override
  List<Object?> get props =>
      [formResourceId, formSubmissionId, formSubmissionResponse];
}
