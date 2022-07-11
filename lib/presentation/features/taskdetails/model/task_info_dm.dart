import 'package:formsflowai/presentation/features/taskdetails/model/task_variable_dm.dart';

import '../../home/tasklisting/model/task_listing_data_model.dart';

/// [TaskInfoDM] data model class to hold task info data fields
class TaskInfoDM {
  String? taskName;
  int? applicationId;
  DateTime? created;
  String? applicationStatus;
  String? formUrl;
  String? formApplicationUrl;
  String? formName;
  String? submissionDate;
  String? submitterName;
  String? formResourceId;
  String? formSubmissionId;
  String? formActionValue;

  /// Method to transform [TaskListingDM], [TaskVariableDM]
  /// into [TaskInfoDM]
  /// Input Parameters
  /// [TaskListingDM]
  /// [TaskVariableDM]
  /// ---> Returns [TaskInfoDM]
  static TaskInfoDM transform(
      TaskListingDM taskListingDM, TaskVariableDM taskVariablesDM) {
    TaskInfoDM taskInfoDM = TaskInfoDM();
    taskInfoDM.taskName = taskListingDM.name;
    taskInfoDM.applicationId = taskVariablesDM.applicationId;
    taskInfoDM.created = taskListingDM.created;
    taskInfoDM.formUrl = taskVariablesDM.formUrl;
    taskInfoDM.formApplicationUrl = taskVariablesDM.formApplicationUrl;
    taskInfoDM.applicationId = taskVariablesDM.applicationId;
    taskInfoDM.formResourceId = taskVariablesDM.formResourceId;
    taskInfoDM.formSubmissionId = taskVariablesDM.formSubmissionId;
    taskInfoDM.formActionValue = "";
    return taskInfoDM;
  }

  @override
  String toString() {
    return 'TaskInfoDM{taskName: $taskName, applicationId: $applicationId, created: $created, applicationStatus: $applicationStatus, formUrl: $formUrl, formName: $formName, submissionDate: $submissionDate, submitterName: $submitterName, formResourceId: $formResourceId, formSubmissionId: $formSubmissionId}';
  }
}
