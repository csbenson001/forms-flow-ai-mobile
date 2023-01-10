class BpmnDiagramResponse {
  final String? id;
  final String? bpmn20Xml;

  BpmnDiagramResponse({
    this.id,
    this.bpmn20Xml,
  });

  BpmnDiagramResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        bpmn20Xml = json['bpmn20Xml'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'bpmn20Xml': bpmn20Xml};
}
