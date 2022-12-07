// // To parse this JSON data, do
// //
// //     final taskListHalResponse = taskListHalResponseFromJson(jsonString);
//
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// export 'task_list_hal_response.dart';
//
// part 'task_list_hal_response.freezed.dart';
// part 'task_list_hal_response.g.dart';
//
// @freezed
// abstract class TaskListHalResponse with _$TaskListHalResponse {
//   const factory TaskListHalResponse({
//     VariableLinks? links,
//     TaskListHalResponseEmbedded? embedded,
//     int? count,
//   }) = _TaskListHalResponse;
//
//   factory TaskListHalResponse.fromJson(Map<String, dynamic> json) =>
//       _$TaskListHalResponseFromJson(json);
// }
//
// @freezed
// abstract class TaskListHalResponseEmbedded with _$TaskListHalResponseEmbedded {
//   const factory TaskListHalResponseEmbedded({
//     List<Task>? task,
//   }) = _TaskListHalResponseEmbedded;
//
//   factory TaskListHalResponseEmbedded.fromJson(Map<String, dynamic> json) =>
//       _$TaskListHalResponseEmbeddedFromJson(json);
// }
//
// @freezed
// abstract class Task with _$Task {
//   const factory Task({
//     TaskLinks? links,
//     TaskEmbedded? embedded,
//     String? id,
//     String? name,
//     String? assignee,
//     String? created,
//     String? due,
//     String? followUp,
//     String? executionId,
//     int? priority,
//     String? processDefinitionId,
//     String? processInstanceId,
//     String? taskDefinitionKey,
//     bool? suspended,
//     String? delegationState,
//     String? description,
//     String? owner,
//     String? parentTaskId,
//     String? caseExecutionId,
//     String? caseInstanceId,
//     String? caseDefinitionId,
//     String? formKey,
//     String? camundaFormRef,
//     String? tenantId,
//   }) = _Task;
//
//   factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
// }
//
// @freezed
// abstract class TaskEmbedded with _$TaskEmbedded {
//   const factory TaskEmbedded({
//     List<Variable>? variable,
//   }) = _TaskEmbedded;
//
//   factory TaskEmbedded.fromJson(Map<String, dynamic> json) =>
//       _$TaskEmbeddedFromJson(json);
// }
//
// @freezed
// abstract class Variable with _$Variable {
//   const factory Variable({
//     VariableLinks? links,
//     String? name,
//     String? value,
//     String? type,
//     ValueInfo? valueInfo,
//   }) = _Variable;
//
//   factory Variable.fromJson(Map<String, dynamic> json) =>
//       _$VariableFromJson(json);
// }
//
// @freezed
// abstract class VariableLinks with _$VariableLinks {
//   const factory VariableLinks({
//     Self? self,
//   }) = _VariableLinks;
//
//   factory VariableLinks.fromJson(Map<String, dynamic> json) =>
//       _$VariableLinksFromJson(json);
// }
//
// @freezed
// abstract class Self with _$Self {
//   const factory Self({
//     String? href,
//   }) = _Self;
//
//   factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);
// }
//
// @freezed
// abstract class ValueInfo with _$ValueInfo {
//   const factory ValueInfo() = _ValueInfo;
//
//   factory ValueInfo.fromJson(Map<String, dynamic> json) =>
//       _$ValueInfoFromJson(json);
// }
//
// @freezed
// abstract class TaskLinks with _$TaskLinks {
//   const factory TaskLinks({
//     Self? assignee,
//     Self? execution,
//     Self? identityLink,
//     Self? processDefinition,
//     Self? processInstance,
//     Self? self,
//   }) = _TaskLinks;
//
//   factory TaskLinks.fromJson(Map<String, dynamic> json) =>
//       _$TaskLinksFromJson(json);
// }

class TaskListHalResponse {
  Links? lLinks;
  Embedded? eEmbedded;
  int? count;

  TaskListHalResponse({this.lLinks, this.eEmbedded, this.count});

  TaskListHalResponse.fromJson(Map<String, dynamic> json) {
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    eEmbedded = json['_embedded'] != null
        ? new Embedded.fromJson(json['_embedded'])
        : null;
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    if (this.eEmbedded != null) {
      data['_embedded'] = this.eEmbedded!.toJson();
    }
    data['count'] = this.count;
    return data;
  }
}

class Links {
  Self? self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.toJson();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Embedded {
  List<Assignee>? assignee;
  List<ProcessDefinition>? processDefinition;
  List<Task>? task;

  Embedded({this.assignee, this.processDefinition, this.task});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['assignee'] != null) {
      assignee = <Assignee>[];
      json['assignee'].forEach((v) {
        assignee!.add(new Assignee.fromJson(v));
      });
    }
    if (json['processDefinition'] != null) {
      processDefinition = <ProcessDefinition>[];
      json['processDefinition'].forEach((v) {
        processDefinition!.add(new ProcessDefinition.fromJson(v));
      });
    }
    if (json['task'] != null) {
      task = <Task>[];
      json['task'].forEach((v) {
        task!.add(new Task.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.assignee != null) {
      data['assignee'] = this.assignee!.map((v) => v.toJson()).toList();
    }
    if (this.processDefinition != null) {
      data['processDefinition'] =
          this.processDefinition!.map((v) => v.toJson()).toList();
    }
    if (this.task != null) {
      data['task'] = this.task!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assignee {
  Links? lLinks;
  String? nEmbedded;
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  Assignee(
      {this.lLinks,
      this.nEmbedded,
      this.id,
      this.firstName,
      this.lastName,
      this.email});

  Assignee.fromJson(Map<String, dynamic> json) {
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    nEmbedded = json['_embedded'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    data['_embedded'] = this.nEmbedded;
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}

class ProcessDefinition {
  Links? lLinks;
  String? nEmbedded;
  String? id;
  String? key;
  String? category;
  String? description;
  String? name;
  String? versionTag;
  int? version;
  String? resource;
  String? deploymentId;
  String? diagram;
  bool? suspended;
  String? contextPath;

  ProcessDefinition(
      {this.lLinks,
      this.nEmbedded,
      this.id,
      this.key,
      this.category,
      this.description,
      this.name,
      this.versionTag,
      this.version,
      this.resource,
      this.deploymentId,
      this.diagram,
      this.suspended,
      this.contextPath});

  ProcessDefinition.fromJson(Map<String, dynamic> json) {
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    nEmbedded = json['_embedded'];
    id = json['id'];
    key = json['key'];
    category = json['category'];
    description = json['description'];
    name = json['name'];
    versionTag = json['versionTag'];
    version = json['version'];
    resource = json['resource'];
    deploymentId = json['deploymentId'];
    diagram = json['diagram'];
    suspended = json['suspended'];
    contextPath = json['contextPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    data['_embedded'] = this.nEmbedded;
    data['id'] = this.id;
    data['key'] = this.key;
    data['category'] = this.category;
    data['description'] = this.description;
    data['name'] = this.name;
    data['versionTag'] = this.versionTag;
    data['version'] = this.version;
    data['resource'] = this.resource;
    data['deploymentId'] = this.deploymentId;
    data['diagram'] = this.diagram;
    data['suspended'] = this.suspended;
    data['contextPath'] = this.contextPath;
    return data;
  }
}

class Task {
  Links? lLinks;
  Embedded? eEmbedded;
  String? id;
  String? name;
  String? assignee;
  String? created;
  String? due;
  String? followUp;
  String? delegationState;
  String? description;
  String? executionId;
  String? owner;
  String? parentTaskId;
  int? priority;
  String? processDefinitionId;
  String? processInstanceId;
  String? taskDefinitionKey;
  String? caseExecutionId;
  String? caseInstanceId;
  String? caseDefinitionId;
  bool? suspended;
  String? formKey;
  String? camundaFormRef;
  String? tenantId;

  Task(
      {this.lLinks,
      this.eEmbedded,
      this.id,
      this.name,
      this.assignee,
      this.created,
      this.due,
      this.followUp,
      this.delegationState,
      this.description,
      this.executionId,
      this.owner,
      this.parentTaskId,
      this.priority,
      this.processDefinitionId,
      this.processInstanceId,
      this.taskDefinitionKey,
      this.caseExecutionId,
      this.caseInstanceId,
      this.caseDefinitionId,
      this.suspended,
      this.formKey,
      this.camundaFormRef,
      this.tenantId});

  Task.fromJson(Map<String, dynamic> json) {
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    eEmbedded = json['_embedded'] != null
        ? new Embedded.fromJson(json['_embedded'])
        : null;
    id = json['id'];
    name = json['name'];
    assignee = json['assignee'];
    created = json['created'];
    due = json['due'];
    followUp = json['followUp'];
    delegationState = json['delegationState'];
    description = json['description'];
    executionId = json['executionId'];
    owner = json['owner'];
    parentTaskId = json['parentTaskId'];
    priority = json['priority'];
    processDefinitionId = json['processDefinitionId'];
    processInstanceId = json['processInstanceId'];
    taskDefinitionKey = json['taskDefinitionKey'];
    caseExecutionId = json['caseExecutionId'];
    caseInstanceId = json['caseInstanceId'];
    caseDefinitionId = json['caseDefinitionId'];
    suspended = json['suspended'];
    formKey = json['formKey'];
    camundaFormRef = json['camundaFormRef'];
    tenantId = json['tenantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    if (this.eEmbedded != null) {
      data['_embedded'] = this.eEmbedded!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['assignee'] = this.assignee;
    data['created'] = this.created;
    data['due'] = this.due;
    data['followUp'] = this.followUp;
    data['delegationState'] = this.delegationState;
    data['description'] = this.description;
    data['executionId'] = this.executionId;
    data['owner'] = this.owner;
    data['parentTaskId'] = this.parentTaskId;
    data['priority'] = this.priority;
    data['processDefinitionId'] = this.processDefinitionId;
    data['processInstanceId'] = this.processInstanceId;
    data['taskDefinitionKey'] = this.taskDefinitionKey;
    data['caseExecutionId'] = this.caseExecutionId;
    data['caseInstanceId'] = this.caseInstanceId;
    data['caseDefinitionId'] = this.caseDefinitionId;
    data['suspended'] = this.suspended;
    data['formKey'] = this.formKey;
    data['camundaFormRef'] = this.camundaFormRef;
    data['tenantId'] = this.tenantId;
    return data;
  }
}

class Variable {
  Links? lLinks;
  String? nEmbedded;
  String? name;
  String? value;
  String? type;
  ValueInfo? valueInfo;

  Variable(
      {this.lLinks,
      this.nEmbedded,
      this.name,
      this.value,
      this.type,
      this.valueInfo});

  Variable.fromJson(Map<String, dynamic> json) {
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    nEmbedded = json['_embedded'];
    name = json['name'];
    value = json['value'];
    type = json['type'];
    valueInfo = json['valueInfo'] != null
        ? new ValueInfo.fromJson(json['valueInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    data['_embedded'] = this.nEmbedded;
    data['name'] = this.name;
    data['value'] = this.value;
    data['type'] = this.type;
    if (this.valueInfo != null) {
      data['valueInfo'] = this.valueInfo!.toJson();
    }
    return data;
  }
}

class ValueInfo {
  ValueInfo();

  ValueInfo.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
