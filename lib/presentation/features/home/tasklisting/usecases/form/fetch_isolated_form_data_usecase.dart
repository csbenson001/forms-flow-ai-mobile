import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/form/form_data_repository.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolatedResponse;

import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';

/// [FetchIsolatedFormDataUseCase] to fetch form data in isolate
/// interacts with [FormDataRepository] to complete the operation
/// [FetchIsolatedFormDataParams]
/// [isolatedResponse.Response]
class FetchIsolatedFormDataUseCase
    implements UseCase<isolatedResponse.Response, FetchIsolatedFormDataParams> {
  const FetchIsolatedFormDataUseCase({required this.repository});

  final FormDataRepository repository;

  @override
  Future<Either<Failure, isolatedResponse.Response>> call(
      {required FetchIsolatedFormDataParams params}) {
    return repository.fetchIsolatedFormData(
        host: '${ApiConstantUrl.FORMSFLOWAI_BASE_URL}${ApiConstantUrl.FORM}/',
        path: params.formId);
  }
}

class FetchIsolatedFormDataParams extends Equatable {
  final String formId;

  const FetchIsolatedFormDataParams({required this.formId});

  @override
  List<Object?> get props => [formId];
}
