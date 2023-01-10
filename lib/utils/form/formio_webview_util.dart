import '../../shared/api_constants_url.dart';
import '../../shared/webview_constants.dart';

class FormioWebViewUtil {
  /// Returns a function which pre-fills the formio
  /// with provided data if available.
  static String preFillForm(String formData) {
    var data = "";
    if (formData.isEmpty) {
      data = '{}'; // from.submission data doesn't accept empty string.
    } else {
      data = formData;
    }
    return ' \n' ' form.submission = $data;\n';
  }

  /// Declares a JS callback function on click submitform action which is triggered when submit
  /// button is clicked
  static String submitAction() {
    // Triggered when submit button is clicked
    return '''
    form.on('submit', function(submission) {
     let submissionData = form.submission.data;
     let formJsonData = {
     "eventType" : ${FormsFlowWebViewConstants.handlerActionSubmissionEvent},
     "actionType" : ${FormsFlowWebViewConstants.handlerActionSubmitted},
     submissionData
     }
     
  window.flutter_inappwebview.callHandler('${FormsFlowWebViewConstants.handlerSubmissionData}', formJsonData);
  });
     ''';
  }

  // Declares a JS recieve callback function
  /// [customSubmitEvent] is the method callback when custom action button.
  /// is clicked
  static String customSubmitAction() {
    // Triggered when submit button is clicked
    return '''
    form.on('customEvent', function(data) {
     let submissionData = form.submission.data;
     let formJsonData = {
     "eventType" : ${FormsFlowWebViewConstants.handlerActionCustomSubmissionEvent},
     "formActionType" : data['actionType'],
      "type" : data['type'],
     submissionData
     }
    window.flutter_inappwebview.callHandler('${FormsFlowWebViewConstants.handlerSubmissionData}', formJsonData);
  });
     ''';
  }

  // Declares a JS recieve callback function
  /// [submitDone] action
  static String submitDoneAction() {
    // Triggered when submit button is clicked
    return '''
    form.on('submitDone', function(submission) {
     let jsonData = JSON.stringify(submission);
   window.flutter_inappwebview.callHandler('${FormsFlowWebViewConstants.handlerSubmissionData}', jsonData);
  });
     ''';
  }

  static String fetchFormIoInputData(
      {required String? formResourceId,
      required bool readOnly,
      required String userInfoResponse,
      required String authToken,
      required String formToken}) {
    return '''
   {
   readOnly:$readOnly,
           formioProjectUrl: '${ApiConstantUrl.formsflowaiFormBaseUrl}${ApiConstantUrl.form}',
           formioResourceUrl: '${ApiConstantUrl.formsflowaiFormBaseUrl}${ApiConstantUrl.form}/$formResourceId',
           formsflowaiUrl: '${ApiConstantUrl.formsflowaiFormBaseUrl}',
           formsflowaiApiUrl: '${"${ApiConstantUrl.formsflowaiFormBaseUrl}api"}',
           userDetails: '$userInfoResponse',
           authToken : '$authToken',
           formioToken : '$formToken',
           formResourceId : '$formResourceId',
           bpmApiUrl: '${FormsFlowWebViewConstants.localStorageBpmApiUrl}${ApiConstantUrl.fetchTasks}${ApiConstantUrl.camundaEngineRest}',
          }
  ''';
  }
}
