import "dart:async";

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../response/form/submission/form_submission_response.dart';
import '../../utils/api_constants_url.dart';

part 'forms_api_client.g.dart';

@RestApi()
abstract class FormsApiClient {
  factory FormsApiClient(Dio dio, {String? baseUrl}) = _FormsApiClient;

  /// Function to submit form data
  /// Input Parameters
  /// [FormSubmissionId] - form submission id
  /// [FormResourceId] - form resource id
  /// [FormSubmissionResponse] - form submission response
  /// ---> Returns [Response]
  @PUT(ApiConstantUrl.fetchFormSubmissionData)
  Future<HttpResponse> submitFormData(
      @Path() String formResourceId,
      @Path() String formSubmissionId,
      @Body() FormSubmissionResponse formSubmissionResponse);

  /// Function to fetch form data
  /// Input Parameters
  /// [id] - form resource id
  /// ---> Returns [Response]
  @GET(ApiConstantUrl.fetchFormJson)
  Future<HttpResponse> getFormIoJson(@Path() String id);

  /// Function to fetch form submission data
  /// Input Parameters
  /// [FormSubmissionId] - form submission id
  /// [FormResourceId] - form resource id
  /// ---> Returns [FormSubmissionResponse]
  @GET(ApiConstantUrl.fetchFormSubmissionData)
  Future<HttpResponse<FormSubmissionResponse>> fetchFormSubmissionData(
      @Path("formResourceId") String resourceId,
      @Path("formSubmissionId") String submissionId);
}
