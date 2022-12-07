import 'package:formsflowai_api/response/task/variables/task_variables_response.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';

import '../../../../core/database/entity/task_entity.dart';

/// [TaskVariableDM] data model class to hold task variable data fields
class TaskVariableDM {
  String? applicationStatus;
  String? formUrl;
  String? formApplicationUrl;
  String? formName;
  String? submissionDate;
  String? submitterName;
  int? applicationId;
  String? formResourceId;
  String? formSubmissionId;

  /// Method to transform [TaskVariablesResponse] into
  /// [TaskVariableDM]
  /// Input Parameters
  /// [TaskVariablesResponse]
  /// ---> Returns [TaskVariableDM]
  static TaskVariableDM transform(TaskVariablesResponse taskVariablesResponse) {
    TaskVariableDM taskVariableDM = TaskVariableDM();
    taskVariableDM.formUrl = taskVariablesResponse.formUrl?.value ?? '';
    if (taskVariablesResponse.applicationId?.value != null) {
      switch (taskVariablesResponse.applicationId?.value.runtimeType) {
        case int:
          taskVariableDM.applicationId =
              taskVariablesResponse.applicationId?.value ?? 0;
          break;
        case String:
          taskVariableDM.applicationId =
              int.parse(taskVariablesResponse.applicationId?.value);
      }
    }
    String formUrl = taskVariablesResponse.formUrl?.value ?? '';
    List<String> data = formUrl.split('/');
    String formResourceId = data[4];
    if (formResourceId == FormsFlowAIConstants.FORMSFLOWAI_FORM) {
      formResourceId = data[5];
    }
    taskVariableDM.formResourceId = formResourceId;
    taskVariableDM.formSubmissionId = data[data.length - 1];
    // taskVariableDM.formApplicationUrl =
    //     "${ApiConstantUrl.APPLICATION_BASE_URL}/formio/form/${formResourceId}/submission/${formSubmissionId}";
    taskVariableDM.formApplicationUrl = formUrl;
    return taskVariableDM;
  }

  /// Method to transform [TaskEntity] into [TaskVariableDM]
  /// Parameters
  /// [TaskEntity]
  /// ---> Returns [TaskVariableDM]
  static TaskVariableDM transformFromTask(TaskEntity task) {
    TaskVariableDM taskVariableDM = TaskVariableDM();
    taskVariableDM.formUrl = task.formUrl ?? '';
    taskVariableDM.formResourceId = task.formResourceId ?? '';
    taskVariableDM.applicationId = task.formApplicationId ?? 0;
    taskVariableDM.formSubmissionId = task.formSubmissionId ?? '';
    // taskVariableDM.formApplicationUrl = ApiConstantUrl.APPLICATION_BASE_URL +
    //     "form/${task.formResourceId}/submission/${task.formSubmissionId}";
    taskVariableDM.formApplicationUrl = task.formUrl;
    return taskVariableDM;
  }

  @override
  String toString() {
    return 'TaskVariableDM{applicationStatus: $applicationStatus, formUrl: $formUrl, formName: $formName, submissionDate: $submissionDate, submitterName: $submitterName, applicationId: $applicationId, formResourceId: $formResourceId}';
  }
}
