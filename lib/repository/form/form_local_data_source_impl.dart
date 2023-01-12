import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:formsflowai/core/api/response/base/base_response.dart';
import 'package:formsflowai/repository/form/form_repository.dart';
import 'package:isolated_http_client/isolated_http_client.dart';

import '../../core/api/response/form/submission/form_submission_response.dart';
import '../../core/database/dao/formsflowforms_dao.dart';
import '../../core/database/dao/task_dao.dart';
import '../../core/database/entity/form_entity.dart';
import '../../core/database/formsflow_database.dart';
import '../../core/error/errors_failure.dart';
import '../../presentation/features/taskdetails/model/form_dm.dart';
import '../../utils/database/database_query_util.dart';
import '../../utils/general_util.dart';

class FormLocalDataSource implements FormRepository {
  final FormsFlowFormsDao formsDao;

  final TaskDao taskDao;
  final FormsFlowDatabase formsFlowDatabase;

  FormLocalDataSource(
      {required this.formsDao,
      required this.taskDao,
      required this.formsFlowDatabase});

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
  Future<Either<Failure, Response>> fetchFormSubmissionIsolated(
      {required String taskId,
      required String formResourceId,
      required String formSubmissionId}) {
    // TODO: implement fetchFormSubmissionIsolatedData
    throw UnimplementedError();
  }

  /// Method to fetch forms data from local entity
  /// Params
  /// [id] - formId
  /// ---> returns [FormDM]
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
      {required String formId}) {
    // TODO: implement fetchIsolatedFormData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> insertFormData(
      {required FormEntity formsFlowForm}) async {
    final results = await formsFlowDatabase.database.rawQuery(
        DatabaseQueryUtil.generateFormAddedSqlQuery(
            formId: formsFlowForm.formId));
    final int? formCount = results[0]['COUNT(id)'] as int?;
    if (formCount == null || formCount == 0) {
      return Right(await formsDao.insertForm(formsFlowForm));
    } else {
      return Right(await formsDao.updateForm(formsFlowForm));
    }
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
  Future<Either<Failure, BaseResponse>> submitFormDataIsolated(
      {required String formResourceId,
      required String formSubmissionId,
      required FormSubmissionResponse formSubmissionResponse}) {
    // TODO: implement submitFormDataIsolate
    throw UnimplementedError();
  }
}
