import "dart:async";

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../shared/api_constants_url.dart';
import '../../response/form/submission/form_submission_response.dart';

part 'forms_api_client.g.dart';

@RestApi()
abstract class FormsApiClient {
  factory FormsApiClient(Dio dio, {String? baseUrl}) = _FormsApiClient;

  @PUT(ApiConstantUrl.fetchFormSubmissionData)
  Future<HttpResponse> submitFormData(
      @Path() String formResourceId,
      @Path() String formSubmissionId,
      @Body() FormSubmissionResponse formSubmissionResponse);

  @GET(ApiConstantUrl.fetchFormJson)
  Future<HttpResponse> getFormIoJson(@Path() String id);

  @GET(ApiConstantUrl.fetchFormSubmissionData)
  Future<HttpResponse<FormSubmissionResponse>> fetchFormSubmissionData(
      @Path("formResourceId") String resourceId,
      @Path("formSubmissionId") String submissionId);
}
