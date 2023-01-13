import 'dart:core';

class FormsFlowAIApiConstants {
  //Socket Constants
  static const socketAccessToken = 'accesstoken';
  static const socketTopicTaskEvent = '/topic/task-event';
  static const socketKeyTaskId = 'id';
  static const socketKeyEventName = 'eventName';
  static const socketEventUpdate = 'update';
  static const socketEventComplete = 'complete';
  static const socketEventCreate = 'create';

  static const String ascendingOrder = "asc";
  static const String descendingOrder = "desc";

  // Tasks
  static const String allTasks = 'All tasks';

  // Forms
  static const String reviewer = 'REVIEWER';
  static const String resourceId = 'RESOURCE_ID';

  // Group member type
  static const String groupCandidate = 'candidate';

  // formsFlow.ai reviewer role key
  static const String formsflowReviewerRole = "formsflow/formsflow-reviewer";

  // Response status codes
  static const int statusCode200 = 200;
  static const int statusCode204 = 204;
  // Not Found Error
  static const int statusCode404 = 404;
  // Unauthorized Error
  static const int statusCode401 = 401;
  static const String statusSuccessMessage = "Success";

  // Accept type
  static const String acceptTypeHalJson = "application/hal+json";
  static const String acceptTypeApplicationJson = "application/json";

  static const String bearerTokenType = "Bearer";
  static const String contentTypeApplicationJson = "application/json";

  /// Headers
  static const String headerAuthorization = "Authorization";
  static const String headerJwtToken = "x-jwt-token";
  static const String headerAccept = "Accept";
  static const String headerContentType = "Content-type";
}
