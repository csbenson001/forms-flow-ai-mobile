import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/form/form_data_repository.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolated_response;

import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';

/// [FetchIsolatedFormDataUseCase] to fetch form data in isolate
/// interacts with [FormDataRepository] to complete the operation
/// [FetchIsolatedFormDataParams]
/// [isolated_response.Response]
class FetchIsolatedFormDataUseCase
    implements
        UseCase<isolated_response.Response, FetchIsolatedFormDataParams> {
  const FetchIsolatedFormDataUseCase({required this.repository});

  final FormDataRepository repository;

  @override
  Future<Either<Failure, isolated_response.Response>> call(
      {required FetchIsolatedFormDataParams params}) {
    return repository.fetchIsolatedFormData(formId: params.formId);
  }
}

class FetchIsolatedFormDataParams extends Equatable {
  final String formId;

  const FetchIsolatedFormDataParams({required this.formId});

  @override
  List<Object?> get props => [formId];
}
