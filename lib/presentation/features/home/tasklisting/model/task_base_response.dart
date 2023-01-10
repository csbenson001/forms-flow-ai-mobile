import 'package:formsflowai/presentation/features/home/tasklisting/model/task_listing_data_model.dart';

import '../../../../../core/api/response/processdefinition/process_definition_response.dart';
import '../../../../../core/api/response/task/tasklist_hal/task_list_hal_response.dart';
import '../../../../../core/database/entity/task_entity.dart';
import '../../../../../shared/app_strings.dart';

/// [TaskBaseDataResponse] class contains [TaskListingDataModel]
/// [ErrorCode]
/// [ErrorMessage]
class TaskBaseDataResponse {
  int? errorCode;
  String? errorMessage;
  List<TaskListingDM>? taskData;
  int? taskCount;

  TaskBaseDataResponse(
      {this.errorCode, this.errorMessage, this.taskData, this.taskCount});

  // /// Method to transform [TaskListResponse] into TaskBaseDataResponse
  // /// Input Param
  // /// [TaskListResponse]
  // /// [ProcessDefinitionResponse]
  // static TaskBaseDataResponse transform(List<TaskListResponse> data,
  //     List<ProcessDefinitionResponse>? processDefinitionResponse) {
  //   TaskBaseDataResponse taskBaseResponse = TaskBaseDataResponse();
  //   taskBaseResponse.errorMessage = Strings.generalLabelSuccess;
  //   taskBaseResponse.errorCode = 200;
  //   taskBaseResponse.taskData =
  //       TaskListingDM.transform(data, processDefinitionResponse);
  //   return taskBaseResponse;
  // }

  /// Method to transform [TaskListHalResponse] into TaskBaseDataResponse
  /// Input Param
  /// [TaskListHalResponse]
  /// [ProcessDefinitionResponse]
  static TaskBaseDataResponse transform(TaskListHalResponse data,
      List<ProcessDefinitionResponse>? processDefinitionResponse) {
    TaskBaseDataResponse taskBaseResponse = TaskBaseDataResponse();
    taskBaseResponse.taskCount = data.count;
    taskBaseResponse.errorMessage = Strings.generalLabelSuccess;
    taskBaseResponse.errorCode = 200;
    taskBaseResponse.taskData =
        TaskListingDM.transform(data, processDefinitionResponse);
    return taskBaseResponse;
  }

  /// Method to transform [TaskListHalResponse] into TaskBaseDataResponse
  /// Input Param
  /// [TaskEntity] taskEntity List
  static TaskBaseDataResponse transformFromEntity(
      {required List<TaskEntity>? data}) {
    TaskBaseDataResponse taskBaseResponse = TaskBaseDataResponse();
    if (data != null && data.isNotEmpty) {
      taskBaseResponse.errorMessage = Strings.generalLabelSuccess;
      taskBaseResponse.taskCount = data.length;
      taskBaseResponse.errorCode = 200;
      taskBaseResponse.taskData =
          TaskListingDM.transformFromEntity(response: data);
    } else {
      taskBaseResponse.errorMessage = Strings.generalLabelNoData;
      taskBaseResponse.errorCode = 200;
      taskBaseResponse.taskData = null;
    }
    return taskBaseResponse;
  }
}
