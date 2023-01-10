import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/form/form_data_repository.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolated_response;

import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';

/// [FetchIsolatedFormSubmissionDataUseCase] to fetch form
/// submission data in isolate
/// interacts with [FormDataRepository] to complete the operation
/// [FetchIsolatedFormSubmissionDataParams]
/// [isolated_response.Response]
class FetchIsolatedFormSubmissionDataUseCase
    implements
        UseCase<isolated_response.Response,
            FetchIsolatedFormSubmissionDataParams> {
  const FetchIsolatedFormSubmissionDataUseCase({required this.repository});

  final FormDataRepository repository;

  @override
  Future<Either<Failure, isolated_response.Response>> call(
      {required FetchIsolatedFormSubmissionDataParams params}) {
    return repository.fetchFormSubmissionIsolatedData(
        formResourceId: params.formResourceId,
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
