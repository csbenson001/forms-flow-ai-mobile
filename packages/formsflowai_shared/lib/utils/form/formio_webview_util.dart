import 'package:formsflowai_shared/shared/webview_constants.dart';

import '../../shared/api_constants_url.dart';

class FormioWebViewUtil {
  /// Returns a function which pre-fills the formio
  /// with provided data if available.
  static String preFillForm(String formData) {
    var data = '';
    if (formData == null || formData.isEmpty) {
      data = '{}'; // from.submission data doesn't accept empty string.
    } else {
      data = formData;
    }
    return ' \n' + ' form.submission = $formData;\n';
  }

  /// Declares a JS callback function on click submitform action which is triggered when submit
  /// button is clicked
  static String submitAction() {
    // Triggered when submit button is clicked
    return '''
    form.on('submit', function(submission) {
     let submissionData = form.submission.data;
     let formJsonData = {
     "eventType" : ${FormsFlowWebViewConstants.HANDLER_ACTION_SUBMISSION_EVENT},
     "actionType" : ${FormsFlowWebViewConstants.HANDLER_ACTION_SUBMITTED},
     submissionData
     }
     
  window.flutter_inappwebview.callHandler('${FormsFlowWebViewConstants.HANDLER_SUBMISSION_DATA}', formJsonData);
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
     "eventType" : ${FormsFlowWebViewConstants.HANDLER_ACTION_CUSTOM_SUBMISSION_EVENT},
     "formActionType" : data['actionType'],
      "type" : data['type'],
     submissionData
     }
    window.flutter_inappwebview.callHandler('${FormsFlowWebViewConstants.HANDLER_SUBMISSION_DATA}', formJsonData);
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
   window.flutter_inappwebview.callHandler('${FormsFlowWebViewConstants.HANDLER_SUBMISSION_DATA}', jsonData);
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
           formioProjectUrl: '${ApiConstantUrl.FORMSFLOWAI_FORM_BASE_URL}${ApiConstantUrl.FORM}',
           formioResourceUrl: '${ApiConstantUrl.FORMSFLOWAI_FORM_BASE_URL}${ApiConstantUrl.FORM}/$formResourceId',
           formsflowaiUrl: '${ApiConstantUrl.FORMSFLOWAI_FORM_BASE_URL}',
           formsflowaiApiUrl: '${"${ApiConstantUrl.FORMSFLOWAI_FORM_BASE_URL}api"}',
           userDetails: '$userInfoResponse',
           authToken : '$authToken',
           formioToken : '$formToken',
           formResourceId : '$formResourceId',
           bpmApiUrl: '${FormsFlowWebViewConstants.LOCAL_STORAGE_BPM_APIURL}${ApiConstantUrl.FETCH_TASKS}${ApiConstantUrl.CAMUNDA_ENGINE_REST}',
          }
  ''';
  }
}
