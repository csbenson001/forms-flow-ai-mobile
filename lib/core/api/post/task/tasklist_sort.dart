import 'package:formsflowai_shared/utils/datetime/timestamp_utils.dart';
import 'package:formsflowai_shared/utils/shared_general_util.dart';

import '../../../../shared/formsflow_app_constants.dart';
import '../../../../shared/task_constants.dart';

/// [TaskSortPostModel] class to send the application/json
/// POST body on the fetch tasks api call
class TaskSortPostModel {
  List<Sorting>? sorting;
  List<VariableFilters>? taskVariableFilters;
  List<VariableFilters>? processVariableFilters;
  List<VariableFilters>? processDefinitionFilters;
  List<VariableFilters>? assigneeFilters;
  List<VariableFilters>? nameFilters;
  List<VariableFilters>? descriptionFilters;
  List<VariableFilters>? dueDateFilters;
  List<VariableFilters>? followUpFilters;
  List<VariableFilters>? createdDateFilters;
  int? priority;
  String? candidateGroup;
  String? candidateUser;
  bool? variableNamesIgnoreCase;
  bool? variableValuesIgnoreCase;

  TaskSortPostModel({
    this.sorting,
    this.taskVariableFilters,
    this.variableNamesIgnoreCase,
    this.variableValuesIgnoreCase,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['sorting'] = sorting?.map((e) => e.toJson()).toList();
    if (variableNamesIgnoreCase != null) {
      json['variableNamesIgnoreCase'] = variableNamesIgnoreCase;
    }
    if (variableValuesIgnoreCase != null) {
      json['variableValuesIgnoreCase'] = variableValuesIgnoreCase;
    }
    if (taskVariableFilters != null && taskVariableFilters!.isNotEmpty) {
      json['taskVariables'] =
          taskVariableFilters?.map((e) => e.toJson()).toList();
    }
    if (processVariableFilters != null && processVariableFilters!.isNotEmpty) {
      final processVariables =
          processVariableFilters?.map((e) => e.toJson()).toList();
      json['processVariables'] = processVariables;
    }

    if (processDefinitionFilters != null &&
        processDefinitionFilters!.isNotEmpty) {
      for (var element in processDefinitionFilters!) {
        if (element.operator == TaskConstants.filterOperatorLikeOperator) {
          json['processDefinitionNameLike'] = "%${element.value}%";
          break;
        }
      }

      for (var element in processDefinitionFilters!) {
        if (element.operator == "eq") {
          json['processDefinitionName'] = element.value;
          break;
        }
      }
    }

    if (assigneeFilters != null && assigneeFilters!.isNotEmpty) {
      for (var element in assigneeFilters!) {
        if (element.operator == TaskConstants.filterOperatorLikeOperator) {
          json['assigneeLike'] = "%${element.value}%";
          break;
        }
      }

      for (var element in assigneeFilters!) {
        if (element.operator == "eq") {
          json['assignee'] = element.value;
          break;
        }
      }
    }

    if (nameFilters != null && nameFilters!.isNotEmpty) {
      for (var element in nameFilters!) {
        if (element.operator == TaskConstants.filterOperatorLikeOperator) {
          json['nameLike'] = "%${element.value}%";
          break;
        }
      }

      for (var element in nameFilters!) {
        if (element.operator == "eq") {
          json['name'] = element.value;
          break;
        }
      }
    }

    if (descriptionFilters != null && descriptionFilters!.isNotEmpty) {
      for (var element in descriptionFilters!) {
        if (element.operator == TaskConstants.filterOperatorLikeOperator) {
          json['descriptionLike'] = "%${element.value}%";
          break;
        }
      }

      for (var element in descriptionFilters!) {
        if (element.operator == "eq") {
          json['description'] = element.value;
          break;
        }
      }
    }

    if (candidateGroup != null &&
        !SharedGeneralUtil.isStringEmpty(candidateGroup)) {
      json['candidateGroup'] = candidateGroup;
    }
    if (candidateUser != null &&
        !SharedGeneralUtil.isStringEmpty(candidateUser)) {
      json['candidateUser'] = candidateUser;
    }

    if (priority != null && priority != -1) {
      json['priority'] = priority;
    }

    if (dueDateFilters != null && dueDateFilters!.isNotEmpty) {
      for (var element in dueDateFilters!) {
        if (element.operator == TaskConstants.filterOperatorBeforeOperator &&
            element.value != null) {
          DateTime convertedDateTime =
              TimeStampUtils.convertStringToDateWithFormat(
                  element.value!, FormsFlowAIConstants.dateYearTimeStamp);
          String? dateTime = TimeStampUtils.formatISOTime(convertedDateTime);
          if (dateTime != null) {
            json['dueBefore'] = dateTime;
          }
          break;
        }
      }
      for (var element in dueDateFilters!) {
        if (element.operator == TaskConstants.filterOperatorAfterOperator &&
            element.value != null) {
          DateTime convertedDateTime =
              TimeStampUtils.convertStringToDateWithFormat(
                  element.value!, FormsFlowAIConstants.dateYearTimeStamp);
          String? dateTime = TimeStampUtils.formatISOTime(convertedDateTime);
          if (dateTime != null) {
            json['dueAfter'] = dateTime;
          }
          break;
        }
      }
    }

    if (followUpFilters != null && followUpFilters!.isNotEmpty) {
      for (var element in followUpFilters!) {
        if (element.operator == TaskConstants.filterOperatorBeforeOperator &&
            element.value != null) {
          DateTime convertedDateTime =
              TimeStampUtils.convertStringToDateWithFormat(
                  element.value!, FormsFlowAIConstants.dateYearTimeStamp);
          String? dateTime = TimeStampUtils.formatISOTime(convertedDateTime);
          if (dateTime != null) {
            json['followUpBefore'] = dateTime;
          }
          break;
        }
      }
      for (var element in followUpFilters!) {
        if (element.operator == TaskConstants.filterOperatorAfterOperator &&
            element.value != null) {
          DateTime convertedDateTime =
              TimeStampUtils.convertStringToDateWithFormat(
                  element.value!, FormsFlowAIConstants.dateYearTimeStamp);
          String? dateTime = TimeStampUtils.formatISOTime(convertedDateTime);
          if (dateTime != null) {
            json['followUpAfter'] = dateTime;
          }
          break;
        }
      }
    }

    if (createdDateFilters != null && createdDateFilters!.isNotEmpty) {
      for (var element in createdDateFilters!) {
        if (element.operator == TaskConstants.filterOperatorBeforeOperator &&
            element.value != null) {
          DateTime convertedDateTime =
              TimeStampUtils.convertStringToDateWithFormat(
                  element.value!, FormsFlowAIConstants.dateYearTimeStamp);
          String? dateTime = TimeStampUtils.formatISOTime(convertedDateTime);
          if (dateTime != null) {
            json['createdBefore'] = dateTime;
          }
          break;
        }
      }
      for (var element in createdDateFilters!) {
        if (element.operator == TaskConstants.filterOperatorAfterOperator &&
            element.value != null) {
          DateTime convertedDateTime =
              TimeStampUtils.convertStringToDateWithFormat(
                  element.value!, FormsFlowAIConstants.dateYearTimeStamp);
          String? dateTime = TimeStampUtils.formatISOTime(convertedDateTime);
          if (dateTime != null) {
            json['createdAfter'] = dateTime;
          }
          break;
        }
      }
    }
    return json;
  }
}

class Sorting {
  String? sortBy;
  String? sortOrder;
  String? label;

  Sorting({
    this.sortBy,
    this.sortOrder,
    this.label,
  });

  Sorting.fromJson(Map<String, dynamic> json) {
    sortBy = json['sortBy'] as String?;
    sortOrder = json['sortOrder'] as String?;
    label = json['label'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['sortBy'] = sortBy;
    json['sortOrder'] = sortOrder;
    json['label'] = label;
    return json;
  }
}

class VariableFilters {
  String? name;
  String? operator;
  dynamic value;

  VariableFilters({
    this.name,
    this.operator,
    this.value,
  });

  VariableFilters.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    operator = json['operator'] as String?;
    value = json['value'] as dynamic;
  }

  Map<String, dynamic> toJson() {
    if (name == 'applicationId') {
      return {
        'name': "$name",
        'operator': "$operator",
        'value': int.parse(value)
      };
    } else {
      return {'name': "$name", 'operator': "$operator", 'value': value};
    }
  }

  @override
  String toString() {
    return 'VariableFilters{name: $name, operator: $operator, value: $value}';
  }
}
