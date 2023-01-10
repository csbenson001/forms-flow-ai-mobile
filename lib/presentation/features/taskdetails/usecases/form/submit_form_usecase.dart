import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/api/post/form/form_submission_post_model.dart';
import '../../../../../core/api/response/base/base_response.dart';
import '../../../../../core/error/errors_failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../repository/task/task_data_repository.dart';

/// [SubmitFormUseCase] to submit the form
/// interacts with [FormDataRepository] to complete the operation
/// [SubmitFormParams]
/// ---> Returns [BaseResponse]
class SubmitFormUseCase implements UseCase<BaseResponse, SubmitFormParams> {
  const SubmitFormUseCase({required this.repository});

  final TaskDataRepository repository;

  @override
  Future<Either<Failure, BaseResponse>> call(
      {required SubmitFormParams params}) {
    return repository.submitForm(
        id: params.taskId,
        formSubmissionPostModel: params.formSubmissionPostModel);
  }
}

class SubmitFormParams extends Equatable {
  final String taskId;
  final FormSubmissionPostModel formSubmissionPostModel;

  const SubmitFormParams(
      {required this.taskId, required this.formSubmissionPostModel});

  @override
  List<Object?> get props => [taskId, formSubmissionPostModel];
}
