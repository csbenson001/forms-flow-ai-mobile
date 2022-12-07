import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:formsflowai/repository/form/form_repository.dart';
import 'package:formsflowai_api/response/form/roles/formio_roles_response.dart';
import 'package:formsflowai_api/response/form/submission/form_submission_response.dart';
import 'package:isolated_http_client/isolated_http_client.dart';

import '../../core/database/dao/formsflowforms_dao.dart';
import '../../core/database/dao/task_dao.dart';
import '../../core/database/entity/form_entity.dart';
import '../../core/error/errors_failure.dart';
import '../../presentation/features/taskdetails/model/form_dm.dart';
import '../../utils/general_util.dart';

class FormLocalDataSource implements FormRepository {
  final FormsFlowFormsDao formsDao;

  final TaskDao taskDao;

  FormLocalDataSource({required this.formsDao, required this.taskDao});

  /// Method to fetch form entity
  /// Parameters
  /// [FormId]
  /// ---> Returns [FormEntity]
  @override
  Future<Either<Failure, FormEntity?>> fetchFormEntity(
      {required String formId}) async {
    var formData = await formsDao.findFormByFormId(formId);
    if (formData != null) {
      return Right(formData);
    }
    return const Right(null);
  }

  /// Method to fetch form submission data
  /// Parameters
  /// [FormResourceId]
  /// [FormSubmissionId]
  /// [TaskId]
  /// ---> Returns [FormSubmissionResponse]
  @override
  Future<Either<Failure, FormSubmissionResponse>> fetchFormSubmissionData(
      {required String formResourceId,
      required String formSubmissionId,
      required String taskId}) async {
    var task = await taskDao.findTaskByTaskId(taskId);
    if (task != null &&
        task.isFormSubmissionDataUpdated != null &&
        !GeneralUtil.isStringEmpty(task.formSubmissionData)) {
      if (task.formSubmissionData != null) {
        final formSubmission = FormSubmissionResponse.fromJson(
            json.decode(task.formSubmissionData ?? ''));
        return Right(formSubmission);
      }
      return const Right(FormSubmissionResponse());
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Response>> fetchFormSubmissionIsolatedData(
      {required String host,
      required String taskId,
      required String formSubmissionId}) {
    // TODO: implement fetchFormSubmissionIsolatedData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, FormDM?>> fetchFormsData({required String id}) async {
    var formData = await formsDao.findFormByFormId(id);
    if (formData != null && !GeneralUtil.isStringEmpty(formData.formId)) {
      return Right(FormDM.transformFromFromData(formData));
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Response>> fetchIsolatedFormData(
      {required String host, required String path}) {
    // TODO: implement fetchIsolatedFormData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> insertFormData(
      {required FormEntity formsFlowForm}) async {
    return Right(await formsDao.insertForm(formsFlowForm));
  }

  @override
  Future<Either<Failure, void>> submitFormData(
      {required String formResourceId,
      required String formSubmissionId,
      required FormSubmissionResponse formSubmissionResponse}) {
    // TODO: implement submitFormData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateFormData(
      {required FormEntity formsFlowForm}) async {
    return Right(await formsDao.updateForm(formsFlowForm));
  }

  @override
  Future<Either<Failure, void>> submitFormDataIsolate(
      {required String formResourceId,
      required String formSubmissionId,
      required FormSubmissionResponse formSubmissionResponse}) {
    // TODO: implement submitFormDataIsolate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, FormioRolesResponse>> fetchFormioRoles() {
    return Future(() => Left(NoConnectionFailure()));
  }
}
