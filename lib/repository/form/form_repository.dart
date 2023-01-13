import 'package:dartz/dartz.dart';
import 'package:formsflowai/core/api/response/base/base_response.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolated_response;

import '../../core/api/response/form/submission/form_submission_response.dart';
import '../../core/database/entity/form_entity.dart';
import '../../core/error/errors_failure.dart';
import '../../presentation/features/taskdetails/model/form_dm.dart';

abstract class FormRepository<T> {
  Future<Either<Failure, void>> submitFormData(
      {required String formResourceId,
      required String formSubmissionId,
      required FormSubmissionResponse formSubmissionResponse});

  Future<Either<Failure, FormDM?>> fetchFormsData({required String id});

  Future<Either<Failure, FormEntity?>> fetchFormEntity(
      {required String formId});

  Future<Either<Failure, void>> insertFormData(
      {required FormEntity formsFlowForm});

  Future<Either<Failure, void>> updateFormData(
      {required FormEntity formsFlowForm});

  Future<Either<Failure, isolated_response.Response>> fetchIsolatedFormData(
      {required String formId});

  Future<Either<Failure, isolated_response.Response>>
      fetchFormSubmissionIsolated(
          {required String taskId,
          required String formResourceId,
          required String formSubmissionId});

  Future<Either<Failure, FormSubmissionResponse>> fetchFormSubmissionData(
      {required String formResourceId,
      required String formSubmissionId,
      required String taskId});

  Future<Either<Failure, BaseResponse>> submitFormDataIsolated(
      {required String formResourceId,
      required String formSubmissionId,
      required FormSubmissionResponse formSubmissionResponse});
}
