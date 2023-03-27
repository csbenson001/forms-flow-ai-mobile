// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_submission_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FormSubmissionResponse _$$_FormSubmissionResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FormSubmissionResponse(
      id: json['_id'] as String?,
      form: json['form'] as String?,
      owner: json['owner'] as String?,
      roles: json['roles'] as List<dynamic>?,
      access: json['access'] as List<dynamic>?,
      metadata: json['metadata'] ?? const {},
      data: json['data'] ?? const {},
      externalIds: json['externalIds'] as List<dynamic>?,
      created: json['created'] as String?,
      modified: json['modified'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$_FormSubmissionResponseToJson(
        _$_FormSubmissionResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'form': instance.form,
      'owner': instance.owner,
      'roles': instance.roles,
      'access': instance.access,
      'metadata': instance.metadata,
      'data': instance.data,
      'externalIds': instance.externalIds,
      'created': instance.created,
      'modified': instance.modified,
      'state': instance.state,
    };
