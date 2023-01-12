import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolated_response;

import '../../core/api/client/form/forms_api_client.dart';
import '../../core/api/response/base/base_response.dart';
import '../../core/api/response/form/submission/form_submission_response.dart';
import '../../core/api/utils/api_utils.dart';
import '../../core/database/entity/form_entity.dart';
import '../../core/error/errors_failure.dart';
import '../../core/error/server_exception.dart';
import '../../core/preferences/app_preference.dart';
import '../../presentation/features/taskdetails/model/form_dm.dart';
import '../../shared/api_constants_url.dart';
import '../../shared/formsflow_api_constants.dart';
import 'form_repository.dart';

class FormRemoteDataSource implements FormRepository {
  final FormsApiClient formsApiClient;
  final AppPreferences appPreferences;
  final isolated_response.HttpClientIsolated isolatedHttpClient;
  final Dio formDio;

  FormRemoteDataSource(
      {required this.formsApiClient,
      required this.appPreferences,
      required this.formDio,
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
          formResourceId, formSubmissionId);
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
    } on RefreshTokenFailureException {
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
  Future<Either<Failure, isolated_response.Response>>
      fetchFormSubmissionIsolated(
          {required String taskId,
          required String formResourceId,
          required String formSubmissionId}) async {
    try {
      var response = await isolatedHttpClient.get(
          host:
              '${ApiConstantUrl.formsflowaiFormBaseUrl}${ApiConstantUrl.form}/$formResourceId/${ApiConstantUrl.formSubmission}/$formSubmissionId',
          headers: APIUtils.getFormsJwtTokenHeader(
              jwtToken: appPreferences.getFormJwtToken()));

      if (response.statusCode == FormsFlowAIAPIConstants.statusCode200 ||
          response.statusCode == FormsFlowAIAPIConstants.statusCode204) {
        return Right(response);
      }
      return left(ServerFailure());
    } on SocketException {
      return left(NoConnectionFailure());
    } on RefreshTokenFailureException {
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
      var response = await formsApiClient.getFormIoJson(id);
      if (response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode200 ||
          response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode204) {
        return Right(FormDM.transform(response.response));
      }
      return Left(ServerFailure());
    } on SocketException {
      return Left(NoConnectionFailure());
    } on RefreshTokenFailureException {
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
  Future<Either<Failure, isolated_response.Response>> fetchIsolatedFormData(
      {required String formId}) async {
    try {
      var response = await isolatedHttpClient.get(
          host:
              '${ApiConstantUrl.formsflowaiFormBaseUrl}${ApiConstantUrl.form}/',
          path: formId,
          headers: APIUtils.getFormsJwtTokenHeader(
              jwtToken: appPreferences.getFormJwtToken()));

      if (response.statusCode == FormsFlowAIAPIConstants.statusCode200 ||
          response.statusCode == FormsFlowAIAPIConstants.statusCode204) {
        return Right(response);
      }
      return left(ServerFailure());
    } on SocketException {
      return left(NoConnectionFailure());
    } on RefreshTokenFailureException {
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
          formResourceId, formSubmissionId, formSubmissionResponse);
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
    } on RefreshTokenFailureException {
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
  Future<Either<Failure, BaseResponse>> submitFormDataIsolated(
      {required String formResourceId,
      required String formSubmissionId,
      required FormSubmissionResponse formSubmissionResponse}) async {
    try {
      var response = await formDio.put(
          "${ApiConstantUrl.form}/$formResourceId/${ApiConstantUrl.formSubmission}/$formSubmissionId",
          data: json.encode(formSubmissionResponse.toJson()));

      if (response.statusCode == FormsFlowAIAPIConstants.statusCode200 ||
          response.statusCode == FormsFlowAIAPIConstants.statusCode204) {
        return Right(BaseResponse(
            message: FormsFlowAIAPIConstants.statusSuccessMessage));
      }
      return left(ServerFailure());
    } on SocketException {
      return left(NoConnectionFailure());
    } on RefreshTokenFailureException {
      return Left(ServerFailure());
    } catch (e) {
      return left(NoResourceFoundFailure());
    }
  }
}
