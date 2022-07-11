import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/form/form_data_repository.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolatedResponse;

import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';

/// [FetchIsolatedFormSubmissionDataUseCase] to fetch form
/// submission data in isolate
/// interacts with [FormDataRepository] to complete the operation
/// [FetchIsolatedFormSubmissionDataParams]
/// [isolatedResponse.Response]
class FetchIsolatedFormSubmissionDataUseCase
    implements
        UseCase<isolatedResponse.Response,
            FetchIsolatedFormSubmissionDataParams> {
  const FetchIsolatedFormSubmissionDataUseCase({required this.repository});

  final FormDataRepository repository;

  @override
  Future<Either<Failure, isolatedResponse.Response>> call(
      {required FetchIsolatedFormSubmissionDataParams params}) {
    return repository.fetchFormSubmissionIsolatedData(
        host:
            '${ApiConstantUrl.FORMSFLOWAI_BASE_URL}${ApiConstantUrl.FORM}/${params.formResourceId}${ApiConstantUrl.FORM_SUBMISSION}/${params.formSubmissionId}',
        formSubmissionId: params.formSubmissionId,
        taskId: params.taskId);
  }
}

class FetchIsolatedFormSubmissionDataParams extends Equatable {
  final String formResourceId;
  final String formSubmissionId;
  final String taskId;

  const FetchIsolatedFormSubmissionDataParams(
      {required this.formResourceId,
      required this.formSubmissionId,
      required this.taskId});

  @override
  List<Object?> get props => [formResourceId, formSubmissionId, taskId];
}
