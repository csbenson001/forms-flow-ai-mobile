import 'dart:core';

class FormsFlowAIAPIConstants {
  static const CLIENT_ID = 'forms-flow-mobile';
  static const CLIENT_SECRET_KEY = 'e4bdbd25-1467-4f7f-b993-bc4b1944c943';
  static const TOKEN_GRANT_TYPE_PASSWORD = 'password';
  static const TOKEN_GRANT_TYPE_REFRESH_TOKEN = 'refresh_token';

  //Socket Constants
  static const socketAccessToken = 'accesstoken';
  static const socketTopicTaskEvent = '/topic/task-event';
  static const socketKeyTaskId = 'id';
  static const socketKeyEventName = 'eventName';
  static const socketEventUpdate = 'update';
  static const socketEventComplete = 'complete';
  static const socketEventCreate = 'create';

  static const String ASCENDING_ORDER = "asc";
  static const String DESCENDING_ORDER = "desc";

  // Tasks
  static const String ALL_TASKS = 'All tasks';

  // Forms
  static const String REVIEWER = 'REVIEWER';
  static const String RESOURCE_ID = 'RESOURCE_ID';
  // static const String USER_RESOURCE_ID = '61b857cef85e9220818f89fc';

  // Group member type
  static const String GROUP_CANDIDATE = 'candidate';

  // formsFlow.ai reviewer role key
  static const String FORMSFLOW_REVIEWER_ROLE = "formsflow/formsflow-reviewer";

  // Response status codes
  static const int statusCode200 = 200;
  static const int statusCode204 = 204;
  // Not Found Error
  static const int statusCode404 = 404;
  // Unauthorized Error
  static const int statusCode401 = 401;
  static const String statusSuccessMessage = "Success";
}
