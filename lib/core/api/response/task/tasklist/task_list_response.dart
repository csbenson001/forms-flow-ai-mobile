import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_list_response.freezed.dart';
part 'task_list_response.g.dart';

List<TaskListResponse> taskListResponseFromJson(String str) =>
    List<TaskListResponse>.from(
        json.decode(str).map((x) => TaskListResponse.fromJson(x)));

String taskListResponseToJson(List<TaskListResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// [TaskListResponse] class to parse
/// task list data
@freezed
class TaskListResponse with _$TaskListResponse {
  const factory TaskListResponse(
      {String? id,
      String? name,
      String? assignee,
      String? created,
      String? due,
      String? followUp,
      String? executionId,
      int? priority,
      String? processDefinitionId,
      String? processInstanceId,
      String? taskDefinitionKey,
      bool? suspended}) = _TaskListResponse;

  factory TaskListResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskListResponseFromJson(json);
}
