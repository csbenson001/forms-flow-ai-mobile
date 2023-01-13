import 'package:formsflowai/shared/formsflow_api_constants.dart';

import 'api_constants_url.dart';

/// [ApiUtils] class contains methods used to
/// return access token, headers, generate urls
class ApiUtils {
  /// Function to fetch Bearer access token
  /// Input Parameters
  /// [Token]
  /// ---> Returns [Bearer Access Token]
  static String getBearerToken(String token) {
    return '${FormsFlowAIApiConstants.bearerTokenType} $token';
  }

  /// Function to return headers used in isolated api calls
  /// Input Parameters
  /// [JWTToken]
  /// ---> Returns [Map] headers
  static Map<String, String> fetchFormsJwtTokenHeader(
      {required String jwtToken}) {
    Map<String, String> requestHeaders = {
      FormsFlowAIApiConstants.headerContentType: 'application/json',
      FormsFlowAIApiConstants.headerAccept: 'application/json',
      FormsFlowAIApiConstants.headerJwtToken: jwtToken
    };
    return requestHeaders;
  }

  /// Function to return headers used in isolated api calls
  /// Input Parameters
  /// [AccessToken]
  /// ---> Returns [Map] headers
  static Map<String, String> fetchTaskAuthorizationHeader(
      {required String acessToken}) {
    Map<String, String> requestHeadersVariables = {
      FormsFlowAIApiConstants.headerContentType: 'application/json',
      FormsFlowAIApiConstants.headerAccept: 'application/json',
      FormsFlowAIApiConstants.headerAuthorization: getBearerToken(acessToken)
    };
    return requestHeadersVariables;
  }

  /// Function to return headers used in isolated api call to claim task
  /// Input Parameters
  /// [userID] - UserId of the claimed user
  /// ---> Returns [Map] headers
  static Map<String, String> fetchClaimTaskPostBody({required String userId}) {
    Map<String, String> payload = {'userId': userId};
    return payload;
  }

  /// Function to return headers used in isolated api call to update assignee
  /// Input Parameters
  /// [userID] - UserId of the assigned user
  /// ---> Returns [Map] headers
  static Map<String, String> fetchUpdateAssigneePostBody(
      {required String userId}) {
    Map<String, String> payload = {'userId': userId};
    return payload;
  }

  /// Function to return headers used in isolated api call to update
  /// fetch submit form post body
  /// Input Parameters
  /// [FormSubmissionData] - Form submission data with the updated custom
  /// action data
  /// [FormSubmissionID] - Form submission Id
  /// ---> Returns [Map] headers
  static Map<String, dynamic> fetchSubmitFormPostBody(
      {required String formSubmissionData, required String formSubmissionId}) {
    Map<String, dynamic> payload = {
      '_id': formSubmissionId,
      'data': formSubmissionData
    };
    return payload;
  }

  /// Function to generate process instances url
  /// fetch submit form post body
  /// Input Parameters
  /// [ProcessID] - ProcessId
  /// ---> Returns [ProcessInstanceURl] String
  static String getProcessInstancesUrl(String processId) {
    return '${ApiConstantUrl.formsflowaiBpmBaseUrl}${ApiConstantUrl.bpmV1}/process-instance/$processId/activity-instances';
  }
}
