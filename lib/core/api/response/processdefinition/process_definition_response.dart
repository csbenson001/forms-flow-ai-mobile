import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'process_definition_response.freezed.dart';
part 'process_definition_response.g.dart';

List<ProcessDefinitionResponse> processDefinitionResponseFromJson(String str) =>
    List<ProcessDefinitionResponse>.from(
        json.decode(str).map((x) => ProcessDefinitionResponse.fromJson(x)));

String processDefinitionResponseToJson(List<ProcessDefinitionResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// [ProcessDefinitionResponse] class to parse
/// process definition data
@freezed
class ProcessDefinitionResponse with _$ProcessDefinitionResponse {
  const factory ProcessDefinitionResponse({
    String? id,
    String? key,
    String? category,
    @Default("") dynamic description,
    String? name,
    int? version,
    String? resource,
    String? deploymentId,
    @Default("") dynamic diagram,
    bool? suspended,
    @Default("") dynamic tenantId,
    String? versionTag,
    @Default(false) dynamic historyTimeToLive,
    bool? startableInTasklist,
  }) = _ProcessDefinitionResponse;

  factory ProcessDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$ProcessDefinitionResponseFromJson(json);
}
