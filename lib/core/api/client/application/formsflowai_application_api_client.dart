import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../response/application/history/application_history_response.dart';
import '../../response/diagram/activity_instance_response.dart';
import '../../response/diagram/bpmn_diagram_response.dart';
import '../../response/form/roles/formio_roles_response.dart';
import '../../utils/api_constants_url.dart';

part 'formsflowai_application_api_client.g.dart';

@RestApi()
abstract class FormsFlowAIApplicationApiClient {
  factory FormsFlowAIApplicationApiClient(Dio dio, {String? baseUrl}) =
      _FormsFlowAIApplicationApiClient;

  /// Function to fetch application history from remote
  /// Input Parameters
  /// [id] - TaskId
  /// ---> Returns [ApplicationHistoryResponse]
  @GET(ApiConstantUrl.fetchApplicationHistory)
  Future<ApplicationHistoryResponse> fetchApplicationHistory(@Path() int id);

  /// Function to fetch BPMN Diagram
  /// ---> Returns [BpmnDiagramResponse)
  @GET(ApiConstantUrl.fetchBpmnDiagram)
  Future<BpmnDiagramResponse> fetchBpmnDiagram();

  /// Function to fetch BPMN Workflow instances
  /// ---> Returns [BpmnWorkflowInstancesResponse)
  @GET(ApiConstantUrl.fetchBpmnInstances)
  Future<BpmnWorkflowInstancesResponse> fetchBpmnWorkflowInstance(
      @Path() String id);

  /// Function to fetch Formio Roles
  /// ---> Returns [FormioRolesResponse)
  /// Formio roleids are used in Formio JWT token signing used in
  /// form api headers
  @GET(ApiConstantUrl.fetchFormioRoles)
  Future<FormioRolesResponse> getFormioRoles();
}
