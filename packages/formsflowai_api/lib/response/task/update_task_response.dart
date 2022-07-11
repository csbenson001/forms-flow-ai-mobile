class UpdateTaskResponse {
  final String? id;
  final String? name;
  final String? assignee;
  final String? created;
  final dynamic due;
  final String? followUp;
  final dynamic delegationState;
  final dynamic description;
  final String? executionId;
  final dynamic owner;
  final dynamic parentTaskId;
  final int? priority;
  final String? processDefinitionId;
  final String? processInstanceId;
  final String? taskDefinitionKey;
  final dynamic caseExecutionId;
  final dynamic caseInstanceId;
  final dynamic caseDefinitionId;
  final bool? suspended;
  final dynamic formKey;
  final dynamic tenantId;

  UpdateTaskResponse({
    this.id,
    this.name,
    this.assignee,
    this.created,
    this.due,
    this.followUp,
    this.delegationState,
    this.description,
    this.executionId,
    this.owner,
    this.parentTaskId,
    this.priority,
    this.processDefinitionId,
    this.processInstanceId,
    this.taskDefinitionKey,
    this.caseExecutionId,
    this.caseInstanceId,
    this.caseDefinitionId,
    this.suspended,
    this.formKey,
    this.tenantId,
  });

  UpdateTaskResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        assignee = json['assignee'] as String?,
        created = json['created'] as String?,
        due = json['due'],
        followUp = json['followUp'] as String?,
        delegationState = json['delegationState'],
        description = json['description'],
        executionId = json['executionId'] as String?,
        owner = json['owner'],
        parentTaskId = json['parentTaskId'],
        priority = json['priority'] as int?,
        processDefinitionId = json['processDefinitionId'] as String?,
        processInstanceId = json['processInstanceId'] as String?,
        taskDefinitionKey = json['taskDefinitionKey'] as String?,
        caseExecutionId = json['caseExecutionId'],
        caseInstanceId = json['caseInstanceId'],
        caseDefinitionId = json['caseDefinitionId'],
        suspended = json['suspended'] as bool?,
        formKey = json['formKey'],
        tenantId = json['tenantId'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'assignee': assignee,
        'created': created,
        'due': due,
        'followUp': followUp,
        'delegationState': delegationState,
        'description': description,
        'executionId': executionId,
        'owner': owner,
        'parentTaskId': parentTaskId,
        'priority': priority,
        'processDefinitionId': processDefinitionId,
        'processInstanceId': processInstanceId,
        'taskDefinitionKey': taskDefinitionKey,
        'caseExecutionId': caseExecutionId,
        'caseInstanceId': caseInstanceId,
        'caseDefinitionId': caseDefinitionId,
        'suspended': suspended,
        'formKey': formKey,
        'tenantId': tenantId
      };
}
