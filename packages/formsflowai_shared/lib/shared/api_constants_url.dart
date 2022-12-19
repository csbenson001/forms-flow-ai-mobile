class ApiConstantUrl {
  // ------------------- BASE URLS AND BASE PROVIDERS  ---------------------

  static const String KEYCLOCK_AUTH_BASE_URL =
      'https://iam.aot-technologies.com/';

  static const String FORMSFLOWAI_BASE_URL =
      'https://bpm2.aot-technologies.com/';

  static const String FORMSFLOWAI_FORM_BASE_URL =
      'https://app2.aot-technologies.com/';

  static const String FORMSFLOWAI_APPLICATION_BASE_URL =
      'https://app2.aot-technologies.com/';

  static const String CAMUNDA_ENGINE_REST = 'camunda/engine-rest-ext/v1';

  static const String FILTER = 'filter';

  static const String PATH_ID = '{id}';

  static const String TASK = 'task';

  static const String FORM = 'formio/form';

  static const String PROCESS_DEFINITION_KEY = 'process-definition/key';

  static const String PROCESS_XML = 'xml';

  static const String FORM_SUBMISSION = 'submission';

  // ----------------------- USER  ---------------------

  static const String FETCH_TOKEN =
      'auth/realms/forms-flow-mahagony/protocol/openid-connect/token';

  static const String FETCH_TOKEN_OPEN_ID_CONNECT =
      '/auth/realms/forms-flow-mahagony/protocol/openid-connect';

  static const String FETCH_USER_INFO =
      'auth/realms/forms-flow-mahagony/protocol/openid-connect/userinfo';

  // ----------------------- TASK  ---------------------

  static const String FETCH_TASKS =
      '$CAMUNDA_ENGINE_REST/$FILTER/$PATH_ID/list?';

  static const String FETCH_TASKS_BY_ID = '$CAMUNDA_ENGINE_REST/$TASK/$PATH_ID';

  static const String FETCH_TASKS_LIST_COUNT =
      '$CAMUNDA_ENGINE_REST/$FILTER/$PATH_ID/count';

  static const String FETCH_FILTERS =
      '$CAMUNDA_ENGINE_REST/$FILTER?resourceType=Task&itemCount=true';

  static const String FETCH_PROCESS_DEIFINITION =
      '$CAMUNDA_ENGINE_REST/process-definition';

  static const String FETCH_TASKS_DETAILS_BY_ID =
      '$CAMUNDA_ENGINE_REST/$PATH_ID/';

  static const String FETCH_TASKS_DETAILS_VARIABLES =
      '$CAMUNDA_ENGINE_REST/$TASK/$PATH_ID/variables';

  static const String CLAIM_TASK = '$CAMUNDA_ENGINE_REST/$TASK/$PATH_ID/claim';

  static const String UPDATE_ASSIGNEE =
      '$CAMUNDA_ENGINE_REST/$TASK/$PATH_ID/assignee';

  static const String UNCLAIM_TASK =
      '$CAMUNDA_ENGINE_REST/$TASK/$PATH_ID/unclaim';

  static const String UPDATE_TASK = '$CAMUNDA_ENGINE_REST/$TASK/$PATH_ID';

  static const String TASK_GROUP =
      '$CAMUNDA_ENGINE_REST/$TASK/$PATH_ID/identity-links?type=candidate';

  static const String DELETE_GROUP =
      '$CAMUNDA_ENGINE_REST/$TASK/$PATH_ID/identity-links/delete';

  static const String FETCH_MEMBERS = '$CAMUNDA_ENGINE_REST/user';

  static const String SUBMIT_FORM =
      '$CAMUNDA_ENGINE_REST/$TASK/$PATH_ID/submit-form';

  // ----------------------- FORMS ---------------------

  static const String FETCH_FORMIO_ROLES = 'api/formio/roles';

  static const String FETCH_FORM_SUBMISSION_DATA =
      '$FORM/{formResourceId}/submission/{formSubmissionId}';

  static const String UPDATE_FORM_SUBMISSION_DATA =
      '$FORM/{formResourceId}/submission/{formSubmissionId}';

  static const String FETCH_FORM_JSON = '$FORM/{id}';

  static const String FETCH_FORM_ACCESS_CONSTANTS = 'access';

  // ----------------------- APPLICATION HISTORY ---------------------

  static const String FETCH_APPLICATION_HISTORY =
      'api/application/{id}/history';

  static const String FETCH_BPMN_DIAGRAM = 'api/process/onestepapproval/xml';

  static const String FETCH_BPMN_INSTANCES =
      'api/process/process-instance/$PATH_ID}/activity-instances';

// ------------------- SOCKET  ---------------------

  static const SOCKET_URL =
      "https://bpm2.aot-technologies.com/camunda/forms-flow-bpm-socket";
}
