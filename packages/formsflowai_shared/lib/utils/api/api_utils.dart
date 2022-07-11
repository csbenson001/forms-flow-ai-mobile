import '../../shared/api_constants_url.dart';

class APIUtils {
  static String getBearerToken(String token) {
    return 'bearer ' + token;
  }

  static Map<String, String> getFormsJwtTokenHeader(
      {required String jwtToken}) {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-jwt-token': jwtToken
    };
    return requestHeaders;
  }

  static Map<String, String> getTaskAuthorizationHeader(
      {required String acessToken}) {
    Map<String, String> requestHeadersVariables = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': getBearerToken(acessToken)
    };

    return requestHeadersVariables;
  }

  static Map<String, String> fetchClaimTaskPostBody({required String userId}) {
    Map<String, String> payload = {'userId': userId};
    return payload;
  }

  static Map<String, String> updateAssigneePostBody({required String userId}) {
    Map<String, String> payload = {'userId': userId};
    return payload;
  }

  static Map<String, dynamic> fetchSubmitFormPostBody(
      {required String formSubmissionData, required String formSubmissionId}) {
    Map<String, dynamic> payload = {
      '_id': formSubmissionId,
      'data': formSubmissionData
    };
    return payload;
  }

  static String getProcessInstancesUrl(String processId) {
    return '${ApiConstantUrl.FORMSFLOWAI_BASE_URL}camunda/engine-rest/process-instance/${processId}/activity-instances';
  }
}