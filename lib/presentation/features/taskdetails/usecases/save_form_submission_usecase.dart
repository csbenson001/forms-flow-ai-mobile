import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/form/form_data_repository.dart';
import 'package:formsflowai_api/response/base/base_response.dart';
import 'package:formsflowai_api/response/form/submission/form_submission_response.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';

/// [SaveFormSubmissionUseCase] to save form submission
/// interacts with [FormDataRepository] to complete the operation
/// [SaveFormSubmissionParams]
class SaveFormSubmissionUseCase
    implements UseCase<void, SaveFormSubmissionParams> {
  const SaveFormSubmissionUseCase({required this.repository});

  final FormDataRepository repository;

  @override
  Future<Either<Failure, BaseResponse>> call(
      {required SaveFormSubmissionParams params}) {
    return repository.submitFormData(
        formResourceId: params.formResourceId,
        formSubmissionId: params.formSubmissionId,
        formSubmissionResponse: params.formSubmissionResponse);
  }
}

class SaveFormSubmissionParams extends Equatable {
  final String formResourceId;
  final String formSubmissionId;
  final FormSubmissionResponse formSubmissionResponse;

  const SaveFormSubmissionParams(
      {required this.formSubmissionResponse,
      required this.formResourceId,
      required this.formSubmissionId});

  @override
  List<Object?> get props =>
      [formResourceId, formSubmissionId, formSubmissionResponse];
}
