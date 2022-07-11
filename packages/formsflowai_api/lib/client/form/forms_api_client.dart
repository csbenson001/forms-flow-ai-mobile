import "dart:async";

import 'package:dio/dio.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:retrofit/retrofit.dart';

import '../../response/form/submission/form_submission_response.dart';

part 'forms_api_client.g.dart';

@RestApi(baseUrl: ApiConstantUrl.FORMSFLOWAI_BASE_URL)
abstract class FormsApiClient {
  factory FormsApiClient(Dio dio, {String? baseUrl}) = _FormsApiClient;

  @PUT(ApiConstantUrl.FETCH_FORM_SUBMISSION_DATA)
  Future<HttpResponse> submitFormData(
      @Header("x-jwt-token") String jwtToken,
      @Path() String formResourceId,
      @Path() String formSubmissionId,
      @Body() FormSubmissionResponse formSubmissionResponse);

  @GET(ApiConstantUrl.FETCH_FORM_JSON)
  Future<HttpResponse> getFormIoJson(
      @Header("x-jwt-token") String jwtToken, @Path() String id);

  @GET(ApiConstantUrl.FETCH_FORM_SUBMISSION_DATA)
  Future<HttpResponse<FormSubmissionResponse>> fetchFormSubmissionData(
      @Header("x-jwt-token") String jwtToken,
      @Path("formResourceId") String resourceId,
      @Path("formSubmissionId") String submissionId);
}