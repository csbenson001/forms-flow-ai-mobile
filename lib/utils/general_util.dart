import 'package:formsflowai_api/response/processdefinition/process_definition_response.dart';
import 'package:formsflowai_shared/core/database/entity/task_entity.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:formsflowai_shared/shared/task_constants.dart';

/// [GeneralUtil] class  contains all utilitu methods
/// required in the formsFlow.ai mobile application
class GeneralUtil {
  /// Method to check if the string is empty
  /// Parameters
  /// [Value] - String
  /// ---> [Returns] Bool
  static bool isStringEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return true;
    }
    return false;
  }

  /// Method to get the user role
  /// Parameters
  /// [UserRoles]
  /// ---> [Returns] String [UserRole]
  static String getUserRole(List<String> roles) {
    return roles.contains('formsflow-reviewer') ? 'Reviewer' : 'Client';
  }

  /// Method to get the task process name
  /// Parameters
  /// [ProcessDefinitionId]
  /// [ProcessDefinitionResponse]
  /// --> [Returns] String [ProcessName]
  static String? getProcessName(
      {required String processDefinitionId,
      required List<ProcessDefinitionResponse>? definitionResponse}) {
    if (definitionResponse != null && definitionResponse.isNotEmpty) {
      return definitionResponse
          .singleWhere((element) => processDefinitionId == element.id)
          .name;
    } else {
      return '';
    }
  }

  /// Method to get the task process key
  /// Parameters
  /// [ProcessName]
  /// Optional [ProcessDefinitionResponse]
  /// --> [Returns] String [ProcessKey]
  static String? getProcessKey(
      {required String processName,
      required List<ProcessDefinitionResponse>? definitionResponse}) {
    if (definitionResponse != null && definitionResponse.isNotEmpty) {
      var data = definitionResponse.firstWhere((element) =>
          processName.toLowerCase() == element.name.toString().toLowerCase());
      return data.key;
    } else {
      return '';
    }
  }

  /// Method to get selected operator in the task filter selection
  /// Parameters
  /// Optional [OperatorList]
  /// Optional [OperatorValues]
  /// [SelectedOperatorLabel]
  /// [VariableType]
  /// --> [Returns] String [SelectedOperator]
  static String? getSelectedOperator(
      {required List<String>? operatorList,
      required List<String>? operatorValues,
      required String selectedOperatorLabel,
      required dynamic? variableType}) {
    var selectedOperator = _getOperator(selectedOperatorLabel);
    return selectedOperator;
  }

  /// Method to get operator label to show operator label to the user
  /// Parameters
  /// [SelectedOperator]
  /// --> [Returns] String [OperatorLabel]
  static String? _getOperator(String selectedOperator) {
    switch (selectedOperator) {
      case TaskConstants.FILTER_OPERATOR_TYPE_EQUAL_OPERATOR:
        return TaskConstants.FILTER_OPERATOR_TYPE_EQUAL_VALUE;
      case TaskConstants.FILTER_OPERATOR_LIKE_OPERATOR:
        return TaskConstants.FILTER_OPERATOR_LIKE_VALUE;
      case TaskConstants.FILTER_OPERATOR_GREATER_THAN_OPERATOR:
        return TaskConstants.FILTER_OPERATOR_GREATER_THAN_VALUE;
      case TaskConstants.FILTER_OPERATOR_GREATER_THAN_EQUAL_TO_OPERATOR:
        return TaskConstants.FILTER_OPERATOR_TYPE_EQUAL_VALUE;
      case TaskConstants.FILTER_OPERATOR_LESS_THAN_OPERATOR:
        return TaskConstants.FILTER_OPERATOR_LESS_THAN_VALUE;
      case TaskConstants.FILTER_OPERATOR_LESS_THAN_EQUAL_TO_OPERATOR:
        return TaskConstants.FILTER_OPERATOR_LESS_THAN_EQUAL_TO_VALUE;
      case TaskConstants.FILTER_OPERATOR_AFTER_OPERATOR:
        return TaskConstants.FILTER_OPERATOR_AFTER_VALUE;
      case TaskConstants.FILTER_OPERATOR_BEFORE_OPERATOR:
        return TaskConstants.FILTER_OPERATOR_BEFORE_VALUE;
      default:
        return '';
    }
  }

  /// Method to update and return [TaskEntity] altering due date or followup
  /// based on the [SelectorType] input
  /// Parameters
  /// Optional [TaskEntity]
  /// [SelectedDateTime] - Selected String date time
  /// [SelectorType] - Can be due/follow-up
  /// --> [Returns] optional [TaskEntity]
  static TaskEntity? updateTaskDateTime(
      {required TaskEntity? task,
      required DateTime? selectedDateTime,
      required TaskDetailsDateSelectorType dateSelectorType}) {
    if (task != null) {
      task.isTaskDataChanged = true;
      if (dateSelectorType == TaskDetailsDateSelectorType.dueDate) {
        task.dueDate = selectedDateTime;
      } else {
        task.followUp = selectedDateTime;
      }
      return task;
    }
    return null;
  }

  /// Method to validate the username
  /// Parameters
  /// [Value]
  /// --> [Returns] optional [UserNameValidatorString]
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Some text";
    }
    return null;
  }

  /// Method to validate the email address
  /// Parameters
  /// [Value]
  /// --> [Returns] optional [EmailValidatorString]
  static String? emailValidator(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  /// Method to validate Password
  /// Parameters
  /// [Value]
  /// --> [Returns] optional [PasswordValidatorString]
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter a valid password";
    }
    return null;
  }
}
