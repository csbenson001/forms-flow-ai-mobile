import 'package:formsflowai_api/response/task/tasklist/task_list_response.dart';
import 'package:formsflowai_api/response/task/variables/task_variables_response.dart';

/// [Compute] function that parses response json to the
/// [TaskListResponse] response  in the background
TaskListResponse parseTaskListDataResponse(Map<String, dynamic> value) {
  return TaskListResponse.fromJson(value);
}

/// [Compute] function that parses response json to the
/// [TaskVariablesResponse] response  in the background
TaskVariablesResponse parseTaskVariablesDataResponse(
    Map<String, dynamic> value) {
  return TaskVariablesResponse.fromJson(value);
}
