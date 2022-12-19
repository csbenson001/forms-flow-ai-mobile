import "dart:async";

import 'package:dio/dio.dart';
import 'package:formsflowai_api/response/form/roles/formio_roles_response.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:retrofit/retrofit.dart';

import '../../response/form/submission/form_submission_response.dart';

part 'forms_api_client.g.dart';

@RestApi(baseUrl: ApiConstantUrl.FORMSFLOWAI_FORM_BASE_URL)
abstract class FormsApiClient {
  factory FormsApiClient(Dio dio, {String? baseUrl}) = _FormsApiClient;

  @PUT(ApiConstantUrl.FETCH_FORM_SUBMISSION_DATA)
  Future<HttpResponse> submitFormData(
      @Path() String formResourceId,
      @Path() String formSubmissionId,
      @Body() FormSubmissionResponse formSubmissionResponse);

  @GET(ApiConstantUrl.FETCH_FORM_JSON)
  Future<HttpResponse> getFormIoJson(@Path() String id);

  @GET(ApiConstantUrl.FETCH_FORMIO_ROLES)
  Future<FormioRolesResponse> getFormioRoles(
      @Header("Authorization") String token);

  @GET(ApiConstantUrl.FETCH_FORM_SUBMISSION_DATA)
  Future<HttpResponse<FormSubmissionResponse>> fetchFormSubmissionData(
      @Path("formResourceId") String resourceId,
      @Path("formSubmissionId") String submissionId);
}
