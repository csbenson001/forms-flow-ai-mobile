// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskListResponse _$$_TaskListResponseFromJson(Map<String, dynamic> json) =>
    _$_TaskListResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      assignee: json['assignee'] as String?,
      created: json['created'] as String?,
      due: json['due'] as String?,
      followUp: json['followUp'] as String?,
      executionId: json['executionId'] as String?,
      priority: json['priority'] as int?,
      processDefinitionId: json['processDefinitionId'] as String?,
      processInstanceId: json['processInstanceId'] as String?,
      taskDefinitionKey: json['taskDefinitionKey'] as String?,
      suspended: json['suspended'] as bool?,
    );

Map<String, dynamic> _$$_TaskListResponseToJson(_$_TaskListResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'assignee': instance.assignee,
      'created': instance.created,
      'due': instance.due,
      'followUp': instance.followUp,
      'executionId': instance.executionId,
      'priority': instance.priority,
      'processDefinitionId': instance.processDefinitionId,
      'processInstanceId': instance.processInstanceId,
      'taskDefinitionKey': instance.taskDefinitionKey,
      'suspended': instance.suspended,
    };
