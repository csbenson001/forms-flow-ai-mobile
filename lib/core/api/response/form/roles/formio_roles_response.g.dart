// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formio_roles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FormioRolesResponse _$_$_FormioRolesResponseFromJson(
    Map<String, dynamic> json) {
  return _$_FormioRolesResponse(
    form: (json['form'] as List<dynamic>?)
        ?.map((e) => Form.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_FormioRolesResponseToJson(
        _$_FormioRolesResponse instance) =>
    <String, dynamic>{
      'form': instance.form,
    };

_$_Form _$_$_FormFromJson(Map<String, dynamic> json) {
  return _$_Form(
    roleId: json['roleId'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$_$_FormToJson(_$_Form instance) => <String, dynamic>{
      'roleId': instance.roleId,
      'type': instance.type,
    };
