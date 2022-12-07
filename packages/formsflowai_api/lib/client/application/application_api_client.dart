import 'package:dio/dio.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:retrofit/retrofit.dart';

import '../../response/application/history/application_history_response.dart';
import '../../response/diagram/activity_instance_response.dart';
import '../../response/diagram/bpmn_diagram_response.dart';

part 'application_api_client.g.dart';

@RestApi(baseUrl: ApiConstantUrl.FORMSFLOWAI_APPLICATION_BASE_URL)
abstract class ApplicationApiClient {
  factory ApplicationApiClient(Dio dio, {String? baseUrl}) =
      _ApplicationApiClient;

  @GET(ApiConstantUrl.FETCH_APPLICATION_HISTORY)
  Future<ApplicationHistoryResponse> fetchApplicationHistory(
      @Header("Authorization") String accessToken, @Path() int id);

  @GET(ApiConstantUrl.FETCH_BPMN_DIAGRAM)
  Future<BpmnDiagramResponse> fetchBpmnDiagram(
      @Header("Authorization") String accessToken);

  @GET(ApiConstantUrl.FETCH_BPMN_INSTANCES)
  Future<BpmnWorkflowInstancesResponse> fetchBpmnWorkflowInstance(
      @Header("Authorization") String accessToken, @Path() String id);
}
