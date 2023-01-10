import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:formsflowai/shared/env_key_constants.dart';

class ApiConstantUrl {
  // ------------------- BASE URLS AND BASE PROVIDERS  ---------------------

  static final String keycloakAuthBaseUrl =
      dotenv.get(EnvKeyConstants.envKeycloakUrlKey);

  static final String formsflowaiBaseUrl =
      dotenv.get(EnvKeyConstants.envFormsflowaiBaseUrlKey);

  static final String formsflowaiBpmBaseUrl =
      dotenv.get(EnvKeyConstants.envBpmApiUrlKey);

  static final String formsflowaiFormBaseUrl = formsflowaiBaseUrl;

  static const String camundaEngineRest = 'camunda/engine-rest-ext/v1';

  static const String filter = 'filter';

  static const String pathId = '{id}';

  static const String task = 'task';

  static const String form = 'formio/form';

  static const String processDefinitionKey = 'process-definition/key';

  static const String processXml = 'xml';

  static const String formSubmission = 'submission';

  // ----------------------- USER  ---------------------

  static final String realm = dotenv.get(EnvKeyConstants.envKeycloakRealmKey);

  static final String fetchToken =
      'auth/realms/$realm/protocol/openid-connect/token';

  static final String fetchTokenOpenIdConnect =
      '/auth/realms/$realm/protocol/openid-connect';

  static const String fetchUserInfo =
      'auth/realms/{realm}/protocol/openid-connect/userinfo';

  // ----------------------- TASK  ---------------------

  static const String fetchTasks = '$camundaEngineRest/$filter/$pathId/list?';

  static const String fetchTasksById = '$camundaEngineRest/$task/$pathId';

  static const String fetchTasksListCount =
      '$camundaEngineRest/$filter/$pathId/count';

  static const String fetchFilters =
      '$camundaEngineRest/$filter?resourceType=Task&itemCount=true';

  static const String fetchProcessDeifinition =
      '$camundaEngineRest/process-definition';

  static const String fetchTasksDetailsById = '$camundaEngineRest/$pathId/';

  static const String fetchTasksDetailsVariables =
      '$camundaEngineRest/$task/$pathId/variables';

  static const String claimTask = '$camundaEngineRest/$task/$pathId/claim';

  static const String updateAssignee =
      '$camundaEngineRest/$task/$pathId/assignee';

  static const String unclaimTask = '$camundaEngineRest/$task/$pathId/unclaim';

  static const String updateTask = '$camundaEngineRest/$task/$pathId';

  static const String taskGroup =
      '$camundaEngineRest/$task/$pathId/identity-links?type=candidate';

  static const String deleteGroup =
      '$camundaEngineRest/$task/$pathId/identity-links/delete';

  static const String fetchMembers = '$camundaEngineRest/user';

  static const String fetchMemberList = 'formsflow/formsflow-reviewer';

  static const String submitForm =
      '$camundaEngineRest/$task/$pathId/submit-form';

  // ----------------------- FORMS ---------------------

  static const String fetchFormioRoles = 'api/formio/roles';

  static const String fetchFormSubmissionData =
      '$form/{formResourceId}/submission/{formSubmissionId}';

  static const String updateFormSubmissionData =
      '$form/{formResourceId}/submission/{formSubmissionId}';

  static const String fetchFormJson = '$form/{id}';

  static const String fetchFormAccessConstants = 'access';

  // ----------------------- APPLICATION HISTORY ---------------------

  static const String fetchApplicationHistory = 'api/application/{id}/history';

  static const String fetchBpmnDiagram = 'api/process/onestepapproval/xml';

  static const String fetchBpmnInstances =
      'api/process/process-instance/$pathId}/activity-instances';

// ------------------- SOCKET  ---------------------

  static final socketUrl =
      "$formsflowaiBpmBaseUrl/camunda/forms-flow-bpm-socket";
}
