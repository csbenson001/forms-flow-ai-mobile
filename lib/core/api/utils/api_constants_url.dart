import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:formsflowai/shared/env_key_constants.dart';

import '../../../shared/formsflow_api_constants.dart';

class ApiConstantUrl {
  // ------------------- BASE URLS AND BASE PROVIDERS  ---------------------

  static final String keycloakAuthBaseUrl =
      "${dotenv.get(EnvKeyConstants.envKeycloakUrlKey)}/";

  static final String formsflowaiBaseUrl =
      '${dotenv.get(EnvKeyConstants.envFormsflowaiBaseUrlKey)}/';

  static final String formsflowaiBpmBaseUrl =
      '${dotenv.get(EnvKeyConstants.envBpmApiUrlKey)}/';

  static final String formsflowaiFormBaseUrl =
      '${dotenv.get(EnvKeyConstants.envFormioProjectUrl)}/';

  static const String bpmV1 = 'engine-rest-ext/v1';

  static const String filter = 'filter';

  static const String pathId = '{id}';

  static const String task = 'task';

  static const String form = 'formio/form';

  static const String processDefinitionKey = 'process-definition/key';

  static const String processXml = 'xml';

  static const String formSubmission = 'submission';

  // ----------------------- USER  ---------------------

  static final String fetchToken =
      'auth/realms/${FormsFlowAIApiConstants.realm}/protocol/openid-connect/token';

  static final String fetchTokenOpenIdConnect =
      '/auth/realms/${FormsFlowAIApiConstants.realm}/protocol/openid-connect';

  static const String fetchUserInfo =
      'auth/realms/{realm}/protocol/openid-connect/userinfo';

  static const String logoutKeycloak =
      'auth/realms/{realm}/protocol/openid-connect/logout';

  // ----------------------- TASK  ---------------------

  static const String fetchTasks = '$bpmV1/$filter/$pathId/list?';

  static const String fetchTasksById = '$bpmV1/$task/$pathId';

  static const String fetchTasksListCount = '$bpmV1/$filter/$pathId/count';

  static const String fetchFilters =
      '$bpmV1/$filter?resourceType=Task&itemCount=true';

  static const String fetchProcessDefinition = '$bpmV1/process-definition';

  static const String fetchTasksDetailsById = '$bpmV1/$pathId/';

  static const String fetchTasksDetailsVariables =
      '$bpmV1/$task/$pathId/variables';

  static const String claimTask = '$bpmV1/$task/$pathId/claim';

  static const String updateAssignee = '$bpmV1/$task/$pathId/assignee';

  static const String unclaimTask = '$bpmV1/$task/$pathId/unclaim';

  static const String updateTask = '$bpmV1/$task/$pathId';

  static const String taskGroup =
      '$bpmV1/$task/$pathId/identity-links?type=candidate';

  static const String deleteGroup =
      '$bpmV1/$task/$pathId/identity-links/delete';

  static const String fetchMembers = '$bpmV1/user';

  static const String fetchMemberList = 'formsflow/formsflow-reviewer';

  static const String submitForm = '$bpmV1/$task/$pathId/submit-form';

  // ----------------------- FORMS ---------------------

  static const String fetchFormioRoles = 'formio/roles';

  static const String fetchFormSubmissionData =
      '$form/{formResourceId}/submission/{formSubmissionId}';

  static const String updateFormSubmissionData =
      '$form/{formResourceId}/submission/{formSubmissionId}';

  static const String fetchFormJson = '$form/{id}';

  static const String fetchFormAccessConstants = 'access';

  // ----------------------- APPLICATION HISTORY ---------------------

  static const String fetchApplicationHistory = 'application/{id}/history';

  static const String fetchBpmnDiagram = 'process/onestepapproval/xml';

  static const String fetchBpmnInstances =
      'api/process/process-instance/$pathId}/activity-instances';

// ------------------- SOCKET  ---------------------

  static final socketUrl = "${formsflowaiBpmBaseUrl}forms-flow-bpm-socket";
}
