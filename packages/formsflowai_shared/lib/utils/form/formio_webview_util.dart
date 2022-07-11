import 'package:formsflowai_shared/shared/webview_constants.dart';

import '../../shared/api_constants_url.dart';

class FormioWebViewUtil {
  /// Builds a HTML with formio form components built inside.
  static String createHtml({
    required String? formComponents,
    required String? formData,
    required bool? readOnly,
    required String userInfoResponse,
    required String? formResourceId,
    required String authToken,
    required String formToken,
  }) {
    String formIoScript = formioScript(
        formResourceId: formResourceId,
        formComponents: formComponents,
        formData: formData,
        readOnly: readOnly,
        authToken: authToken,
        formToken: formToken,
        userInfoResponse: userInfoResponse);
    return '<html> \n' +
        '  <head>\n' +
        "    <link rel='stylesheet' href='file:///android_asset/formio/app/bootstrap/css/bootstrap.min.css'>\n" +
        "    <link rel='stylesheet' href='file:///android_asset/formio/dist/formio.full.min.css'>\n" +
        "    <script src='file:///android_asset/formio/app/jquery/jquery.min.js'></script>\n" +
        "    <script src='file:///android_asset/formio/app/jquery/jquery.slim.min.js'></script>\n" +
        "    <script src='file:///android_asset/formio/app/bootstrap/js/bootstrap.bundle.min.js'></script>\n" +
        "    <script src='file:///android_asset/formio/dist/formio.full.min.js'></script>\n" +
        formIoScript +
        '  </head>\n'
            '  <body>\n' +
        "    <div id='formio'></div>\n" +
        '  </body>\n' +
        '</html>';
  }

  /// JS script which uses formio javascript library to render custom formio.
  static String formioScript(
      {required String? formComponents,
      required String? formData,
      required bool? readOnly,
      required String? formResourceId,
      required String userInfoResponse,
      required String authToken,
      required String formToken}) {
    return "<script type='text/javascript'>\n" +
        '    let formVar;\n' +
        '    window.onload = function() {\n' +
        '''   Formio.setProjectUrl('${ApiConstantUrl.FORMSFLOWAI_BASE_URL}${ApiConstantUrl.FORM}');
         Formio.setBaseUrl('${ApiConstantUrl.FORMSFLOWAI_BASE_URL}${ApiConstantUrl.FORM}');
         Formio.setToken('$formToken'); ''' +
        '''  window.localStorage.setItem('${FormsFlowWebViewConstants.LOCAL_STORAGE_USER_DETAILS}', JSON.stringify($userInfoResponse));
        window.localStorage.setItem('${FormsFlowWebViewConstants.LOCAL_STORAGE_AUTH_TOKEN}', '$authToken');
        window.localStorage.setItem('${FormsFlowWebViewConstants.LOCAL_STORAGE_FORMIO_TOKEN}', '$formToken');
        window.localStorage.setItem('${FormsFlowWebViewConstants.LOCAL_STORAGE_FORMIO_API_URL}', '${ApiConstantUrl.FORMSFLOWAI_BASE_URL + ApiConstantUrl.FORM}');
        window.localStorage.setItem('${FormsFlowWebViewConstants.LOCAL_STORAGE_FORMSFLOWAI_URL}', '${ApiConstantUrl.FORMSFLOWAI_BASE_URL}');
        window.localStorage.setItem('${FormsFlowWebViewConstants.LOCAL_STORAGE_STORAGE_FORMSFLOWAI_API_URL}', '${ApiConstantUrl.FORMSFLOWAI_BASE_URL + "api"}');
        window.localStorage.setItem('${FormsFlowWebViewConstants.LOCAL_STORAGE_BPM_APIURL}', '${ApiConstantUrl.FETCH_TASKS + ApiConstantUrl.CAMUNDA_ENGINE_REST}'); ''' +
        "       Formio.createForm(document.getElementById('formio'),\n" +
        '           $formComponents,\n' +
        '''
        {
        readOnly: $readOnly,
        })''' +
        '''
        .then(function(form) { 
         // Prevent the submission from going to the form.io server.
         form.nosubmit = true;  
        window.flutter_inappwebview.callHandler('isLoading', false);
        formVar = form;
        var formio = new Formio();
        formio.formUrl = '${ApiConstantUrl.FORMSFLOWAI_BASE_URL}${ApiConstantUrl.FORM}/$formResourceId';
        form.formio = formio
        ''' +
        preFillForm(formData ?? '') +
        submitAction() +
        observeFormChanges() +
        attachFocusListener() +
        customSubmitAction() +
        '  })\n' +
        '    }\n' +
        '    </script>\n';
  }

  /// Attaches to FormIo's change to observe changes
  static String observeFormChanges() {
    return " form.on('change', (component, value) => {\n       let jsonData = form.submission.data;\n      window.flutter_inappwebview.callHandler('${FormsFlowWebViewConstants.HANDLER_ON_SUBMISSION_CHANGED}', jsonData);\n       let isValid = form.checkValidity(form.submission.data);\n    window.flutter_inappwebview.callHandler('validityChecked', isValid);\n   });\n";
  }

  /// Attaches a focus listener to every input field and pushes it to
  /// [WebViewJavaScriptInterface.fieldFocused].
  static String attachFocusListener() {
    return "form.on('focusin', (event) => {\n" +
        '       var target = (event.target);\n' +
        "       if (target.is('input') || target.is('textarea')) {\n" +
        "          window.flutter_inappwebview.callHandler.fieldFocused(target.prop('name'));\n" +
        '       }\n' +
        '   });\n';
  }

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
}
