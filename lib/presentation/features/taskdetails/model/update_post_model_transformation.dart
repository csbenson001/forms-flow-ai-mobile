import 'package:formsflowai/presentation/features/taskdetails/model/task_info_dm.dart';
import 'package:formsflowai_shared/utils/datetime/timestamp_utils.dart';

import '../../../../core/api/post/task/update_task_post_model.dart';
import '../../../../core/database/entity/task_entity.dart';
import '../../home/tasklisting/model/task_listing_data_model.dart';
import 'form_dm.dart';

/// Method to transform [TaskListingDM], [FormDM], [TaskInfoDM]
/// into [UpdateTaskPostModel]
/// Parameters
/// [TaskListingDM]
/// [FormDM]
/// [TaskInfoDM]
/// ---> Returns [UpdateTaskPostModel]
UpdateTaskPostModel transformUpdateTaskPostModel(
    {required TaskListingDM taskListingDM,
    required FormDM formDM,
    required TaskInfoDM taskInfoDM}) {
  UpdateTaskPostModel updateTaskPostModel = UpdateTaskPostModel(
    name: taskListingDM.name,
    id: taskListingDM.taskId,
    followUp: TimeStampUtils.formatISOTime(taskListingDM.followUp),
    due: TimeStampUtils.formatISOTime(taskListingDM.dueDate),
    suspended: taskListingDM.suspended,
    priority: taskListingDM.priority,
    executionId: taskListingDM.executionId,
    taskDefinitionKey: taskListingDM.taskDefinitionKey,
    processInstanceId: taskListingDM.processInstanceId,
    processDefinitionId: taskListingDM.processDefinitionId,
    created: TimeStampUtils.formatISOTime(taskListingDM.created),
    assignee: taskListingDM.assignee,
    applicationId: taskInfoDM.applicationId,
    applicationStatus: taskInfoDM.applicationStatus,
    formUrl: taskInfoDM.formUrl,
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
    submissionDate: taskInfoDM.submissionDate,
  );
  return updateTaskPostModel;
}

/// Method to transform [TaskEntity], [FormDM]
/// into [UpdateTaskPostModel]
/// Parameters
/// [TaskEntity]
/// [FormDM]
/// ---> Returns [UpdateTaskPostModel]
UpdateTaskPostModel transformUpdateTaskPostModelFromEntity(
    {required TaskEntity task, required FormDM formDM}) {
  UpdateTaskPostModel updateTaskPostModel = UpdateTaskPostModel(
    name: task.name,
    id: task.taskId,
    followUp: TimeStampUtils.formatISOTime(task.followUp),
    due: TimeStampUtils.formatISOTime(task.dueDate),
    suspended: task.suspended,
    priority: task.priority,
    executionId: task.executionId,
    taskDefinitionKey: task.taskDefinitionKey,
    processInstanceId: task.processInstanceId,
    processDefinitionId: task.processDefinitionId,
    created: TimeStampUtils.formatISOTime(task.created),
    assignee: task.assignee,
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

  return updateTaskPostModel;
}
