import '../../core/api/response/task/tasklist/task_list_response.dart';
import '../../core/api/response/task/variables/task_variables_response.dart';

/// [Compute] function that parses response json to the
/// [TaskListResponse] response  in the background
TaskListResponse parseTaskListDataResponse(dynamic value) {
  return TaskListResponse.fromJson(value);
}

/// [Compute] function that parses response json to the
/// [TaskVariablesResponse] response  in the background
TaskVariablesResponse parseTaskVariablesDataResponse(
    Map<String, dynamic> value) {
  return TaskVariablesResponse.fromJson(value);
}
