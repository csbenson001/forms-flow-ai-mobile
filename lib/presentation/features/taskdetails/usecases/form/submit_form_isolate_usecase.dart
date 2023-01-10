import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/api/post/form/form_submission_post_model.dart';
import '../../../../../core/api/response/base/base_response.dart';
import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../repository/task/task_data_repository.dart';

/// [SubmitFormIsolateUseCase] to submit the form in
/// the background
/// interacts with [FormDataRepository] to complete the operation
/// [SubmitFormIsolateParams]
/// ---> Returns [BaseResponse]
class SubmitFormIsolateUseCase
    implements UseCase<BaseResponse, SubmitFormIsolateParams> {
  const SubmitFormIsolateUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, BaseResponse>> call(
      {required SubmitFormIsolateParams params}) {
    return repository.submitFormIsolate(
        id: params.taskId,
        formSubmissionPostModel: params.formSubmissionPostModel);
  }
}

class SubmitFormIsolateParams extends Equatable {
  final String taskId;
  final FormSubmissionPostModel formSubmissionPostModel;

  const SubmitFormIsolateParams(
      {required this.taskId, required this.formSubmissionPostModel});

  @override
  List<Object?> get props => [taskId, formSubmissionPostModel];
}
