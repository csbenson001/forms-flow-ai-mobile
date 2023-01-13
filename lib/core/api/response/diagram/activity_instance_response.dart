/// [BpmnWorkflowInstancesResponse] class to parse
/// BPMNWorkflow instance
class BpmnWorkflowInstancesResponse {
  final String? childActivityInstances;
  final String? processInstanceId;

  BpmnWorkflowInstancesResponse({
    this.childActivityInstances,
    this.processInstanceId,
  });

  BpmnWorkflowInstancesResponse.fromJson(Map<String, dynamic> json)
      : childActivityInstances = json['childActivityInstances'] as String?,
        processInstanceId = json['processInstanceId'] as String?;

  Map<String, dynamic> toJson() => {
        'childActivityInstances': childActivityInstances,
        'processInstanceId': processInstanceId
      };
}
