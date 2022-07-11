// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_definition_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProcessDefinitionResponse _$_$_ProcessDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return _$_ProcessDefinitionResponse(
    id: json['id'] as String?,
    key: json['key'] as String?,
    category: json['category'] as String?,
    description: json['description'] ?? '',
    name: json['name'] as String?,
    version: json['version'] as int?,
    resource: json['resource'] as String?,
    deploymentId: json['deploymentId'] as String?,
    diagram: json['diagram'] ?? '',
    suspended: json['suspended'] as bool?,
    tenantId: json['tenantId'] ?? '',
    versionTag: json['versionTag'] as String?,
    historyTimeToLive: json['historyTimeToLive'] ?? false,
    startableInTasklist: json['startableInTasklist'] as bool?,
  );
}

Map<String, dynamic> _$_$_ProcessDefinitionResponseToJson(
        _$_ProcessDefinitionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'category': instance.category,
      'description': instance.description,
      'name': instance.name,
      'version': instance.version,
      'resource': instance.resource,
      'deploymentId': instance.deploymentId,
      'diagram': instance.diagram,
      'suspended': instance.suspended,
      'tenantId': instance.tenantId,
      'versionTag': instance.versionTag,
      'historyTimeToLive': instance.historyTimeToLive,
      'startableInTasklist': instance.startableInTasklist,
    };
