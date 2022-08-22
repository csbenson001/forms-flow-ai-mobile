import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/form_dm.dart';
import 'package:formsflowai/repository/form/form_local_data_source_impl.dart';
import 'package:formsflowai/repository/form/form_remote_data_source_impl.dart';
import 'package:formsflowai/repository/form/form_repository.dart';
import 'package:formsflowai_api/response/base/base_response.dart';
import 'package:formsflowai_api/response/form/submission/form_submission_response.dart';
import 'package:formsflowai_shared/core/database/entity/form_entity.dart';
import 'package:formsflowai_shared/core/networkmanager/network_manager_controller.dart';
import 'package:isolated_http_client/src/response.dart';

class FormDataRepository implements FormRepository {
  final FormLocalDataSource localDataSource;
  final FormRemoteDataSource remoteDataSource;
  final NetworkManagerController networkManagerController;

  FormDataRepository(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkManagerController});

  /// Method to fetch form entity
  /// Parameters
  /// [FormId]
  /// ---> Returns [FormEntity]
  @override
  Future<Either<Failure, FormEntity?>> fetchFormEntity(
      {required String formId}) {
    return localDataSource.fetchFormEntity(formId: formId);
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
      required String taskId}) {
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      return remoteDataSource.fetchFormSubmissionData(
          formResourceId: formResourceId,
          formSubmissionId: formSubmissionId,
          taskId: taskId);
    } else {
      return localDataSource.fetchFormSubmissionData(
          formResourceId: formResourceId,
          formSubmissionId: formSubmissionId,
          taskId: taskId);
    }
  }

  /// Method to fetch formSubmissionIsolated data
  /// Parameters
  /// [FormSubmissionId]
  /// [TaskId]
  /// ---> Returns [Response]
  @override
  Future<Either<Failure, Response>> fetchFormSubmissionIsolatedData(
      {required String host,
      required String taskId,
      required String formSubmissionId}) {
    return remoteDataSource.fetchFormSubmissionIsolatedData(
        host: host, taskId: taskId, formSubmissionId: formSubmissionId);
  }

  /// Method to fetch formsData
  /// Parameters
  /// [Id]
  /// ---> Returns [FormDM]
  @override
  Future<Either<Failure, FormDM?>> fetchFormsData({required String id}) {
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      return remoteDataSource.fetchFormsData(id: id);
    } else {
      return localDataSource.fetchFormsData(id: id);
    }
  }

  /// Method to fetch IsolatedFormData
  /// Parameters
  /// [Path]
  /// ---> Return [Response]
  @override
  Future<Either<Failure, Response>> fetchIsolatedFormData(
      {required String host, required String path}) {
    return remoteDataSource.fetchIsolatedFormData(host: host, path: path);
  }

  /// Method to insert form data
  /// Parameters
  /// [FormEntity]
  @override
  Future<Either<Failure, void>> insertFormData(
      {required FormEntity formsFlowForm}) {
    return localDataSource.insertFormData(formsFlowForm: formsFlowForm);
  }

  /// Method to submit form Data
  /// Parameters
  /// [FormResourceId]
  /// [FormSubmissionId]
  /// [FormSubmissionResponse]
  @override
  Future<Either<Failure, BaseResponse>> submitFormData(
      {required String formResourceId,
      required String formSubmissionId,
      required FormSubmissionResponse formSubmissionResponse}) {
    return remoteDataSource.submitFormData(
        formResourceId: formResourceId,
        formSubmissionId: formSubmissionId,
        formSubmissionResponse: formSubmissionResponse);
  }

  @override
  Future<Either<Failure, void>> updateFormData(
      {required FormEntity formsFlowForm}) {
    // TODO: implement updateFormData
    throw UnimplementedError();
  }

  /// Method to submit form
  /// Parameters
  /// [FormResourceId]
  /// [FormSubmissionId]
  /// [FormSubmissionResponse]
  @override
  Future<Either<Failure, void>> submitFormDataIsolate(
      {required String formResourceId,
      required String formSubmissionId,
      required FormSubmissionResponse formSubmissionResponse}) {
    return remoteDataSource.submitFormDataIsolate(
        formResourceId: formResourceId,
        formSubmissionId: formSubmissionId,
        formSubmissionResponse: formSubmissionResponse);
  }
}
