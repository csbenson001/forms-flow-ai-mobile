import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_api/response/form/submission/form_submission_response.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../repository/form/form_data_repository.dart';

/// [FetchFormSubmissionUseCase] to fetch form submission data
/// interacts with [FormDataRepository] to complete the operation
/// [FetchSubmissionParams]
/// ---> Returns [FormSubmissionResponse]
class FetchFormSubmissionUseCase
    implements UseCase<FormSubmissionResponse, FetchSubmissionParams> {
  const FetchFormSubmissionUseCase({required this.repository});

  final FormDataRepository repository;

  @override
  Future<Either<Failure, FormSubmissionResponse>> call(
      {required FetchSubmissionParams params}) {
    return repository.fetchFormSubmissionData(
        taskId: params.taskId,
        formSubmissionId: params.formSubmissionId,
        formResourceId: params.formResourceId);
  }
}

class FetchSubmissionParams extends Equatable {
  final String formResourceId;
  final String formSubmissionId;
  final String taskId;

  const FetchSubmissionParams(
      {required this.formResourceId,
      required this.formSubmissionId,
      required this.taskId});

  @override
  List<Object?> get props => [formResourceId, formSubmissionId, taskId];
}
