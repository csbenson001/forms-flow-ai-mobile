import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../shared/api_constants_url.dart';
import '../../response/application/history/application_history_response.dart';
import '../../response/diagram/activity_instance_response.dart';
import '../../response/diagram/bpmn_diagram_response.dart';
import '../../response/form/roles/formio_roles_response.dart';

part 'application_history_api_client.g.dart';

@RestApi()
abstract class ApplicationHistoryApiClient {
  factory ApplicationHistoryApiClient(Dio dio, {String? baseUrl}) =
      _ApplicationHistoryApiClient;

  @GET(ApiConstantUrl.fetchApplicationHistory)
  Future<ApplicationHistoryResponse> fetchApplicationHistory(@Path() int id);

  @GET(ApiConstantUrl.fetchBpmnDiagram)
  Future<BpmnDiagramResponse> fetchBpmnDiagram(String accessToken);

  @GET(ApiConstantUrl.fetchBpmnInstances)
  Future<BpmnWorkflowInstancesResponse> fetchBpmnWorkflowInstance(
      @Path() String id);

  @GET(ApiConstantUrl.fetchFormioRoles)
  Future<FormioRolesResponse> getFormioRoles(
      @Header("Authorization") String token);
}
