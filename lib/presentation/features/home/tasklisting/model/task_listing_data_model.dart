import 'package:formsflowai/presentation/features/taskdetails/model/task_variable_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/api/response/processdefinition/process_definition_response.dart';
import '../../../../../core/api/response/task/tasklist/task_list_response.dart';
import '../../../../../core/api/response/task/tasklist_hal/task_list_hal_response.dart';
import '../../../../../core/database/entity/task_entity.dart';
import '../../../../../utils/database/database_query_util.dart';
import '../../../../../utils/general_util.dart';
import '../../../taskdetails/model/task_info_dm.dart';

part 'task_listing_data_model.freezed.dart';

/// [TaskListing] Data model class contains data fields
/// related to the tasks
@freezed
class TaskListingDM with _$TaskListingDM {
  const factory TaskListingDM({
    String? taskId,
    String? name,
    DateTime? created,
    String? executionId,
    int? priority,
    String? processDefinitionId,
    String? processInstanceId,
    String? taskDefinitionKey,
    bool? suspended,
    String? assignee,
    DateTime? followUp,
    DateTime? dueDate,
    String? status,
    String? formResourceId,
    String? processDefinitionName,
  }) = _TaskListingDM;

  // /// Method to transform  List[TaskListResponse] into List[TaskListingDM]
  // /// Input Parameter
  // /// List[TaskListResponse]
  // /// List[ProcessDefinitionResponse]
  // /// ---> Returns List[TaskListingDM]
  // static List<TaskListingDM> transform(List<TaskListResponse> response,
  //     List<ProcessDefinitionResponse>? definitionResponse) {
  //   List<TaskListingDM> mData = List.empty(growable: true);
  //
  //   if (response != null) {
  //     for (TaskListResponse task in response) {
  //       TaskListingDM dm = TaskListingDM(
  //           taskId: task.id,
  //           name: task.name ?? '',
  //           created: DatabaseQueryUtil.decode(task.created),
  //           assignee: task.assignee ?? '',
  //           followUp: DatabaseQueryUtil.decode(task.followUp),
  //           dueDate: DatabaseQueryUtil.decode(task.due),
  //           priority: task.priority,
  //           processDefinitionId: task.processDefinitionId,
  //           processInstanceId: task.processInstanceId,
  //           processDefinitionName: GeneralUtil.getProcessName(
  //               processDefinitionId: task.processDefinitionId ?? '',
  //               definitionResponse: definitionResponse));
  //
  //       mData.add(dm);
  //     }
  //   }
  //   return mData;
  // }

  /// Method to transform  List[TaskListResponse] into List[TaskListingDM]
  /// Input Parameter
  /// List[TaskListResponse]
  /// List[ProcessDefinitionResponse]
  /// ---> Returns List[TaskListingDM]
  static List<TaskListingDM> transform(TaskListHalResponse response,
      List<ProcessDefinitionResponse>? definitionResponse) {
    List<TaskListingDM> mData = List.empty(growable: true);

    List<Task> taskList = response.eEmbedded?.task ?? [];

    if (taskList.isNotEmpty) {
      for (Task task in taskList) {
        TaskListingDM dm = TaskListingDM(
            taskId: task.id,
            name: task.name ?? '',
            created: DatabaseQueryUtil.decode(task.created),
            assignee: task.assignee ?? '',
            followUp: DatabaseQueryUtil.decode(task.followUp),
            dueDate: DatabaseQueryUtil.decode(task.due),
            priority: task.priority,
            processDefinitionId: task.processDefinitionId,
            processInstanceId: task.processInstanceId,
            processDefinitionName: GeneralUtil.getProcessName(
                processDefinitionId: task.processDefinitionId ?? '',
                definitionResponse: definitionResponse));

        mData.add(dm);
      }
    }
    return mData;
  }

  /// Method to transform List[TaskEntity]  into List[TaskListingDM]
  /// Input Parameter
  /// List[TaskEntity]
  /// ---> Returns List[TaskListingDM]
  static List<TaskListingDM> transformFromEntity(
      {required List<TaskEntity> response}) {
    List<TaskListingDM> mData = List.empty(growable: true);
    for (TaskEntity task in response) {
      TaskListingDM dm = TaskListingDM(
          taskId: task.taskId,
          name: task.name,
          created: task.created,
          assignee: task.assignee,
          followUp: task.followUp,
          dueDate: task.dueDate,
          priority: task.priority,
          processDefinitionId: task.processDefinitionId,
          processInstanceId: task.processInstanceId,
          formResourceId: task.formResourceId,
          processDefinitionName: task.processDefinitionName);

      mData.add(dm);
    }

    return mData;
  }

  /// Method to transform [TaskListResponse] into [TaskListingDM]
  /// Input Parameter
  /// [TaskListResponse]
  /// ---> Returns [TaskListingDM]
  static TaskListingDM transformSingle(TaskListResponse task,
      List<ProcessDefinitionResponse>? definitionResponse) {
    TaskListingDM dm = TaskListingDM(
        taskId: task.id,
        name: task.name ?? '',
        created: DatabaseQueryUtil.decode(task.created),
        assignee: task.assignee ?? '',
        followUp: DatabaseQueryUtil.decode(task.followUp),
        dueDate: DatabaseQueryUtil.decode(task.due),
        priority: task.priority,
        processDefinitionId: task.processDefinitionId,
        processInstanceId: task.processInstanceId,
        processDefinitionName: GeneralUtil.getProcessName(
            processDefinitionId: task.processDefinitionId ?? '',
            definitionResponse: definitionResponse));

    return dm;
  }

  /// Method to transform List [TaskListingDM] into List[TaskEntity] if
  /// the task is user to the assigned
  /// Input Parameter
  /// List[TaskListingDM]
  /// [UserName]
  /// [FilterId]
  /// ---> Returns List[TaskEntity]
  static List<TaskEntity> transformTaskEntities(
      List<TaskListingDM> data, String filterId, String userName) {
    List<TaskEntity> mData = List.empty(growable: true);
    for (var dm in data) {
      if (dm.assignee == userName) {
        mData.add(
          TaskEntity(
              id: null,
              taskId: dm.taskId,
              name: dm.name,
              assignee: dm.assignee,
              created: dm.created,
              executionId: dm.executionId,
              followUp: dm.followUp,
              priority: dm.priority,
              status: dm.status,
              processDefinitionId: dm.processDefinitionId,
              processInstanceId: dm.processInstanceId,
              suspended: dm.suspended,
              taskDefinitionKey: dm.taskDefinitionKey,
              filterId: filterId,
              formResourceId: null,
              formUrl: null,
              formSubmissionId: null,
              isFormDataUpdated: false,
              formApplicationId: null,
              applicationStatus: null,
              formSubmissionDate: null,
              formSubmissionName: null,
              formSubmissionData: null,
              isFormSubmissionDone: false,
              isFormSubmissionDataUpdated: false,
              processDefinitionName: dm.processDefinitionName,
              dueDate: dm.dueDate,
              isTaskDataChanged: false,
              formSubmissionActionType: null),
        );
      }
    }

    return mData;
  }

  /// Method to transform [TaskListingDM] into [TaskEntity]
  /// Input Parameters
  /// [TaskListingDM]
  /// [TaskVariableDM]
  /// [FormResourceId]
  /// ---> Returns [TaskEntity]
  static TaskEntity transformTaskEntity(
      TaskListingDM dm, TaskInfoDM taskVariableDM, String? formResourceId) {
    return TaskEntity(
        id: null,
        taskId: dm.taskId,
        name: dm.name,
        assignee: dm.assignee,
        created: dm.created,
        executionId: dm.executionId,
        followUp: dm.followUp,
        priority: dm.priority,
        status: dm.status,
        processDefinitionId: dm.processDefinitionId,
        processInstanceId: dm.processInstanceId,
        suspended: dm.suspended,
        taskDefinitionKey: dm.taskDefinitionKey,
        filterId: "",
        formResourceId: formResourceId ?? '',
        formUrl: taskVariableDM.formUrl,
        formSubmissionId: null,
        isFormDataUpdated: true,
        formApplicationId: taskVariableDM.applicationId,
        applicationStatus: taskVariableDM.applicationStatus,
        formSubmissionDate: null,
        formSubmissionName: null,
        processDefinitionName: dm.processDefinitionName,
        dueDate: dm.dueDate,
        isTaskDataChanged: false,
        formSubmissionActionType: null);
  }

  /// Method to transform [TaskListingDM] into [TaskEntity]
  /// Input Parameters
  /// [TaskListingDM]
  /// ---> Returns [TaskEntity]
  static TaskEntity transformTaskEntitySingle(TaskListingDM dm) {
    return TaskEntity(
        id: null,
        taskId: dm.taskId,
        name: dm.name,
        assignee: dm.assignee,
        created: dm.created,
        executionId: dm.executionId,
        followUp: dm.followUp,
        priority: dm.priority,
        status: dm.status,
        processDefinitionId: dm.processDefinitionId,
        processInstanceId: dm.processInstanceId,
        suspended: dm.suspended,
        taskDefinitionKey: dm.taskDefinitionKey,
        filterId: null,
        formResourceId: null,
        formUrl: null,
        formSubmissionId: null,
        isFormDataUpdated: false,
        formApplicationId: null,
        applicationStatus: null,
        formSubmissionDate: null,
        formSubmissionName: null,
        processDefinitionName: dm.processDefinitionName,
        dueDate: dm.dueDate,
        formSubmissionActionType: null,
        isTaskDataChanged: false);
  }

  @override
  String toString() {
    return 'TaskListingDM{taskId: $taskId, name: $name, created: $created, executionId: $executionId, priority: $priority, processDefinitionId: $processDefinitionId, processInstanceId: $processInstanceId, taskDefinitionKey: $taskDefinitionKey, suspended: $suspended, assignee: $assignee, followUp: $followUp, status: $status}';
  }
}

/// [ProcessType] enum to specify the process type
enum ProcessType { oneStepProcess, twoStepProcess }
