import '../../core/api/response/processdefinition/process_definition_response.dart';
import '../../core/api/utils/api_constants_url.dart';
import '../../core/api/utils/api_utils.dart';
import '../formsflowai_shared_util.dart';

class BpmnDiagramWebUtil {
  /// Builds a HTML with BPMN Diagram XML built.

  static String generateBpmnDiagramViewerHtml(
      {required String bearerToken,
      required String processInstanceId,
      required String processName,
      required List<ProcessDefinitionResponse> processDefinitionResponse}) {
    return '''
    <html>
    
  <head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <!-- own CCS style for highlight of activity - color can be easily changed here -->
	<style type="text/css">
	.highlight  {
	   fill: #000 !important;
	   text-color: #ffffff;
	}
	.djs-container .highlight .djs-visual>:nth-child(1) {
	   fill: #42628F !important;
	   text-color: #fff;
	}
	</style>
  <script src="https://unpkg.com/bpmn-js@8.2.0/dist/bpmn-navigated-viewer.development.js"></script>
  <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script>
  </head>
  <body>

  <!-- BPMN diagram container -->
	<div id="canvas"></div>

  ${_generateDiagramScript(bearerToken, processInstanceId, processName, processDefinitionResponse, _getProcessXml(processName, processDefinitionResponse), ApiUtils.getProcessInstancesUrl(processInstanceId))}
  </body>
  </html>
    ''';
  }

  static String _generateDiagramScript(
      String token,
      String processInstanceId,
      String processName,
      List<ProcessDefinitionResponse> processDefinitionResponse,
      String url,
      String instanceUrl) {
    return '''
 
    <script>
     var diagramUrl =
       '$url';
        var instanceUrl =
       '$instanceUrl';
   
		// BpmnJS is the BPMN viewer instance
		const viewer = new BpmnJS({ 
			container: '#canvas' 
		});
  
		function fetchDiagram(url) {
   return fetch(url, {
        method: 'GET',
       headers: {'Authorization': '$token'}
    })
    .then(response => response.json()) 
    .then(json => json['bpmn20Xml'])
    .catch(error => 	console.log("Json Error" + error));
		}
		
	 function fetchInstance(url) {
   return fetch(url, {
        method: 'GET',
       headers: {'Authorization': '$token'}
    })
    .then(response => response.json()) 
    .then(json => json['childActivityInstances'])
    .catch(error => 	console.log("unsuccessful" + error));
		}
		
		async function run() {
		const diagram = await fetchDiagram(diagramUrl);
		const markers = await fetchInstance(instanceUrl);
			try {
				await viewer.importXML(diagram);
				viewer.get('canvas').zoom('fit-viewport');
				window.flutter_inappwebview.callHandler('isLoading', false); 
			} catch (err) {
			}
			let marker = markers;
      if (marker!=null){
       viewer.get('canvas').addMarker({'id':marker[0].activityId}, 'highlight');
          }
		}
		run();
	</script>
    ''';
  }

  static String _getProcessXml(String processName,
      List<ProcessDefinitionResponse> processDefinitionResponse) {
    String? processKey = SharedUtil.getProcessKey(
        processName: processName,
        definitionResponse: processDefinitionResponse);
    var processXMl =
        '${ApiConstantUrl.formsflowaiBpmBaseUrl}${ApiConstantUrl.bpmV1}/${ApiConstantUrl.processDefinitionKey}/$processKey/${ApiConstantUrl.processXml}';
    return processXMl;
  }
}