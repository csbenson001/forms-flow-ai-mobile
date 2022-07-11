import 'package:formsflowai/presentation/features/home/tasklisting/model/task_listing_data_model.dart';
import 'package:formsflowai_api/response/processdefinition/process_definition_response.dart';
import 'package:formsflowai_api/response/task/tasklist/task_list_response.dart';
import 'package:formsflowai_shared/core/database/entity/task_entity.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';

/// [TaskBaseDataResponse] class contains [TaskListingDataModel]
/// [ErrorCode]
/// [ErrorMessage]
class TaskBaseDataResponse {
  int? errorCode;
  String? errorMessage;
  List<TaskListingDM>? taskData;

  TaskBaseDataResponse({this.errorCode, this.errorMessage, this.taskData});

  /// Method to transform [TaskListResponse] into TaskBaseDataResponse
  /// Input Param
  /// [TaskListResponse]
  /// [ProcessDefinitionResponse]
  static TaskBaseDataResponse transform(List<TaskListResponse> data,
      List<ProcessDefinitionResponse>? processDefinitionResponse) {
    TaskBaseDataResponse taskBaseResponse = TaskBaseDataResponse();
    taskBaseResponse.errorMessage = Strings.generalLabelSuccess;
    taskBaseResponse.errorCode = 200;
    taskBaseResponse.taskData =
        TaskListingDM.transform(data, processDefinitionResponse);
    return taskBaseResponse;
  }

  /// Method to transform [TaskListResponse] into TaskBaseDataResponse
  /// Input Param
  /// [TaskEntity] taskEntity List
  static TaskBaseDataResponse transformFromEntity(
      {required List<TaskEntity>? data}) {
    TaskBaseDataResponse taskBaseResponse = TaskBaseDataResponse();
    if (data != null && data.length > 0) {
      taskBaseResponse.errorMessage = Strings.generalLabelSuccess;
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
