import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:formsflowai_api/response/processdefinition/process_definition_response.dart';
import 'package:formsflowai_shared/shared/webview_constants.dart';
import 'package:formsflowai_shared/utils/bpmndiagram/bpmn_diagram_web_util.dart';

class FormsFlowAIWebViewUtils {
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
