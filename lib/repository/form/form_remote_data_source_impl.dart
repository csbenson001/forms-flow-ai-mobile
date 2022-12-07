import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:formsflowai_api/client/form/forms_api_client.dart';
import 'package:formsflowai_api/formsflowai_api.dart';
import 'package:formsflowai_api/response/base/base_response.dart';
import 'package:formsflowai_api/response/form/submission/form_submission_response.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:formsflowai_shared/shared/formsflow_api_constants.dart';
import 'package:formsflowai_shared/utils/api/api_utils.dart';
import 'package:isolated_http_client/isolated_http_client.dart';

import '../../core/database/entity/form_entity.dart';
import '../../core/error/errors_failure.dart';
import '../../core/error/server_exception.dart';
import '../../core/preferences/app_preference.dart';
import '../../presentation/features/taskdetails/model/form_dm.dart';
import 'form_repository.dart';

class FormRemoteDataSource implements FormRepository {
  final FormsApiClient formsApiClient;
  final AppPreferences appPreferences;
  final HttpClient isolatedHttpClient;

  FormRemoteDataSource(
      {required this.formsApiClient,
      required this.appPreferences,
      required this.isolatedHttpClient});

  @override
  Future<Either<Failure, FormEntity?>> fetchFormEntity(
      {required String formId}) async {
    throw UnimplementedError();
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
    try {
      var response = await formsApiClient.fetchFormSubmissionData(
          appPreferences.getFormJwtToken(), formResourceId, formSubmissionId);
      if (response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode200 ||
          response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode204) {
        return Right(response.data);
      } else {
        return Left(ServerFailure());
      }
    } on SocketException {
      return Left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(NoResourceFoundFailure());
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
      required String formSubmissionId}) async {
    try {
      var response = await isolatedHttpClient.get(
          host: host,
          headers: APIUtils.getFormsJwtTokenHeader(
              jwtToken: appPreferences.getFormJwtToken()));

      if (response.statusCode == FormsFlowAIAPIConstants.statusCode200 ||
          response.statusCode == FormsFlowAIAPIConstants.statusCode204) {
        return Right(response);
      }
      return left(ServerFailure());
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return left(NoResourceFoundFailure());
    }
  }

  /// Method to fetch formsData
  /// Parameters
  /// [Id]
  /// ---> Returns [FormDM]
  @override
  Future<Either<Failure, FormDM?>> fetchFormsData({required String id}) async {
    try {
      var response = await formsApiClient.getFormIoJson(
          appPreferences.getFormJwtToken(), id);
      if (response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode200 ||
          response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode204) {
        return Right(FormDM.transform(response.response));
      }
      return Left(ServerFailure());
    } on SocketException {
      return Left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(NoResourceFoundFailure());
    }
  }

  /// Method to fetch IsolatedFormData
  /// Parameters
  /// [Path]
  /// ---> Return [Response]
  @override
  Future<Either<Failure, Response>> fetchIsolatedFormData(
      {required String host, required String path}) async {
    try {
      var response = await isolatedHttpClient.get(
          host: host,
          path: path,
          headers: APIUtils.getFormsJwtTokenHeader(
              jwtToken: appPreferences.getFormJwtToken()));

      if (response.statusCode == FormsFlowAIAPIConstants.statusCode200 ||
          response.statusCode == FormsFlowAIAPIConstants.statusCode204) {
        return Right(response);
      }
      return left(ServerFailure());
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return left(NoResourceFoundFailure());
    }
  }

  @override
  Future<Either<Failure, void>> insertFormData(
      {required FormEntity formsFlowForm}) {
    // TODO: implement insertFormData
    throw UnimplementedError();
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
      required FormSubmissionResponse formSubmissionResponse}) async {
    try {
      var response = await formsApiClient.submitFormData(
          appPreferences.getFormJwtToken(),
          formResourceId,
          formSubmissionId,
          formSubmissionResponse);
      if (response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode200 ||
          response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode204) {
        return Right(BaseResponse(
            statusCode: response.response.statusCode, message: "Success"));
      }
      return Left(ServerFailure());
    } on SocketException {
      return Left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(NoResourceFoundFailure());
    }
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
      required FormSubmissionResponse formSubmissionResponse}) async {
    String apiUrl =
        "${ApiConstantUrl.FORMSFLOWAI_BASE_URL}${ApiConstantUrl.FORM}/${formResourceId}/${ApiConstantUrl.FORM_SUBMISSION}/${formSubmissionId}";
    try {
      var response = await isolatedHttpClient.put(
          host: apiUrl,
          body: formSubmissionResponse.toJson(),
          headers: APIUtils.getFormsJwtTokenHeader(
              jwtToken: appPreferences.getFormJwtToken()));

      if (response.statusCode == FormsFlowAIAPIConstants.statusCode200 ||
          response.statusCode == FormsFlowAIAPIConstants.statusCode204) {
        return Right(response);
      }
      return left(ServerFailure());
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return left(NoResourceFoundFailure());
    }
  }

  @override
  Future<Either<Failure, FormioRolesResponse>> fetchFormioRoles() async {
    try {
      var response = await formsApiClient
          .getFormioRoles(appPreferences.getBearerAccessToken());

      if (response.form != null) {
        return Right(response);
      }
      return Left(ServerFailure());
    } on SocketException {
      return Left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      print("--- Error ----");
      print(e);
      return Left(NoResourceFoundFailure());
    }
  }
}
