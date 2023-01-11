import 'package:formsflowai/utils/general_util.dart';
import 'package:formsflowai_shared/utils/datetime/timestamp_utils.dart';

import '../../../../presentation/features/taskdetails/model/form_dm.dart';
import '../../../database/entity/task_entity.dart';

class UpdateTaskPostModel {
  final String? id;
  final String? name;
  final dynamic assignee;
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
  final String? applicationStatus;
  final String? formUrl;
  final String? formName;
  final String? submissionDate;
  final String? submitterName;
  final int? applicationId;

  UpdateTaskPostModel({
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
    this.applicationStatus,
    this.formUrl,
    this.formName,
    this.submissionDate,
    this.submitterName,
    this.applicationId,
  });

  UpdateTaskPostModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        assignee = json['assignee'],
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
        tenantId = json['tenantId'],
        applicationStatus = json['applicationStatus'] as String?,
        formUrl = json['formUrl'] as String?,
        formName = json['formName'] as String?,
        submissionDate = json['submissionDate'] as String?,
        submitterName = json['submitterName'] as String?,
        applicationId = json['applicationId'] as int?;

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
        'tenantId': tenantId,
        'applicationStatus': applicationStatus,
        'formUrl': formUrl,
        'formName': formName,
        'submissionDate': submissionDate,
        'submitterName': submitterName,
        'applicationId': applicationId
      };

  /// Method to transform update task post model
  /// gets task entity and form data model
  /// and converts it to update task post model
  /// Parameters
  /// [TaskEntity]
  /// [FormDM]
  static UpdateTaskPostModel transformUpdateTaskPostModelFromEntity(
      {required TaskEntity task, required FormDM formDM}) {
    return UpdateTaskPostModel(
      name: task.name,
      id: task.taskId,
      followUp: TimeStampUtils.formatISOTime(task.followUp),
      due: TimeStampUtils.formatISOTime(task.dueDate),
      suspended: task.suspended,
      priority: task.priority,
      executionId: task.executionId,
      taskDefinitionKey: !GeneralUtil.isStringEmpty(task.taskDefinitionKey)
          ? task.taskDefinitionKey
          : null,
      processInstanceId: task.processInstanceId,
      processDefinitionId: task.processDefinitionId,
      created: TimeStampUtils.formatISOTime(task.created),
      assignee:
          !GeneralUtil.isStringEmpty(task.assignee) ? task.assignee : null,
      applicationId: task.formApplicationId,
      applicationStatus: task.applicationStatus,
      formUrl: task.formUrl ?? '',
      delegationState: null,
      caseExecutionId: null,
      caseDefinitionId: null,
      caseInstanceId: null,
      description: null,
      formKey: formDM.formsMapResponse?['type'],
      formName: formDM.formsMapResponse?['name'],
      owner: formDM.formsMapResponse?['owner'],
      parentTaskId: null,
      submitterName: null,
      tenantId: null,
      submissionDate: task.formSubmissionDate,
    );
  }
}
