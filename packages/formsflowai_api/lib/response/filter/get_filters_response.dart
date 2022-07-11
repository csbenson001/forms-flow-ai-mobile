class FiltersResponse {
  final String? id;
  final String? resourceType;
  final String? name;
  final dynamic owner;
  final FilterQuery? query;
  final Properties? properties;

  FiltersResponse({
    this.id,
    this.resourceType,
    this.name,
    this.owner,
    this.query,
    this.properties,
  });

  FiltersResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        resourceType = json['resourceType'] as String?,
        name = json['name'] as String?,
        owner = json['owner'],
        query = (json['query'] as Map<String, dynamic>?) != null
            ? FilterQuery.fromJson(json['query'] as Map<String, dynamic>)
            : null,
        properties = (json['properties'] as Map<String, dynamic>?) != null
            ? Properties.fromJson(json['properties'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'resourceType': resourceType,
        'name': name,
        'owner': owner,
        'query': query?.toJson(),
        'properties': properties?.toJson()
      };

  @override
  String toString() {
    return 'FiltersResponse{id: $id, resourceType: $resourceType, name: $name, owner: $owner, query: $query, properties: $properties}';
  }
}

class FilterQuery {
  final String? candidateGroup;
  final bool? includeAssignedTasks;
  final List<dynamic>? taskVariables;
  final List<dynamic>? processVariables;
  final List<dynamic>? caseInstanceVariables;
  final List<dynamic>? orQueries;

  FilterQuery({
    this.candidateGroup,
    this.includeAssignedTasks,
    this.taskVariables,
    this.processVariables,
    this.caseInstanceVariables,
    this.orQueries,
  });

  FilterQuery.fromJson(Map<String, dynamic> json)
      : candidateGroup = json['candidateGroup'] as String?,
        includeAssignedTasks = json['includeAssignedTasks'] as bool?,
        taskVariables = json['taskVariables'] as List?,
        processVariables = json['processVariables'] as List?,
        caseInstanceVariables = json['caseInstanceVariables'] as List?,
        orQueries = json['orQueries'] as List?;

  Map<String, dynamic> toJson() => {
        'candidateGroup': candidateGroup,
        'includeAssignedTasks': includeAssignedTasks,
        'taskVariables': taskVariables,
        'processVariables': processVariables,
        'caseInstanceVariables': caseInstanceVariables,
        'orQueries': orQueries
      };
}

class Properties {
  final String? color;
  final bool? showUndefinedVariable;
  final bool? refresh;
  final int? priority;

  Properties({
    this.color,
    this.showUndefinedVariable,
    this.refresh,
    this.priority,
  });

  Properties.fromJson(Map<String, dynamic> json)
      : color = json['color'] as String?,
        showUndefinedVariable = json['showUndefinedVariable'] as bool?,
        refresh = json['refresh'] as bool?,
        priority = json['priority'] as int?;

  Map<String, dynamic> toJson() => {
        'color': color,
        'showUndefinedVariable': showUndefinedVariable,
        'refresh': refresh,
        'priority': priority
      };
}
