import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:formsflowai_api/response/processdefinition/process_definition_response.dart';
import 'package:formsflowai_shared/shared/webview_constants.dart';
import 'package:formsflowai_shared/utils/bpmndiagram/bpmn_diagram_web_util.dart';

import '../../shared/api_constants_url.dart';
import 'formio_webview_util.dart';

class FormsFlowAIWebViewUtils {
  static InAppWebViewInitialData loadForms({
    required String? formComponents,
    required String? formData,
    required bool? readOnly,
    required String? formResourceId,
    required String userInfo,
    required String accessToken,
    required String formJWTToken,
  }) {
    return InAppWebViewInitialData(
        data: FormioWebViewUtil.createHtml(
            formResourceId: formResourceId,
            formComponents: formComponents,
            formData: formData,
            readOnly: readOnly,
            userInfoResponse: userInfo,
            authToken: accessToken,
            formToken: formJWTToken),
        mimeType: FormsFlowWebViewConstants.MIME_TYPE,
        encoding: FormsFlowWebViewConstants.ENCODING,
        baseUrl: Uri.parse(ApiConstantUrl.FORMSFLOWAI_BASE_URL));
  }

  static InAppWebViewInitialData loadBpmnDiagram(
      {required String bearerToken,
      required String? processInstanceId,
      required String? processDefinitionName,
      required List<ProcessDefinitionResponse> processDefinitionResponse}) {
    return InAppWebViewInitialData(
        data: BpmnDiagramWebUtil.generateBpmnDiagramViewerHtml(
            bearerToken: bearerToken,
            processInstanceId: processInstanceId ?? '',
            processName: processDefinitionName ?? '',
            processDefinitionResponse: processDefinitionResponse),
        encoding: FormsFlowWebViewConstants.ENCODING);
  }
}
