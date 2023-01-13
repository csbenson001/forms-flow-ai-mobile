import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../core/api/response/processdefinition/process_definition_response.dart';
import '../../shared/webview_constants.dart';
import '../bpmndiagram/bpmn_diagram_web_util.dart';

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
        encoding: FormsFlowWebViewConstants.encoding);
  }
}
