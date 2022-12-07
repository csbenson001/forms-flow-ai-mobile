import 'package:floor/floor.dart';

// Entity to hold task data
@Entity(
  tableName: "task",
  indices: [
    Index(value: ['taskId'], unique: true)
  ],
  primaryKeys: ["id"],
)
class TaskEntity {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: "id")
  int? id;

  @ColumnInfo(name: "taskId")
  String? taskId;

  @ColumnInfo(name: "formResourceId")
  String? formResourceId;

  @ColumnInfo(name: "name")
  String? name;

  @ColumnInfo(name: "created")
  DateTime? created;

  @ColumnInfo(name: "executionId")
  String? executionId;

  @ColumnInfo(name: "priority")
  int? priority;

  @ColumnInfo(name: "processDefinitionId")
  String? processDefinitionId;

  @ColumnInfo(name: "processInstanceId")
  String? processInstanceId;

  @ColumnInfo(name: "taskDefinitionKey")
  String? taskDefinitionKey;

  @ColumnInfo(name: "processDefinitionName")
  String? processDefinitionName;

  @ColumnInfo(name: "suspended")
  bool? suspended;

  @ColumnInfo(name: "assignee")
  String? assignee;

  @ColumnInfo(name: "followUpDate")
  DateTime? followUp;

  @ColumnInfo(name: "dueDate")
  DateTime? dueDate;

  @ColumnInfo(name: "status")
  String? status;

  @ColumnInfo(name: "filterId")
  String? filterId;

  @ColumnInfo(name: "applicationStatus")
  String? applicationStatus;

  @ColumnInfo(name: "formUrl")
  String? formUrl;

  @ColumnInfo(name: "applicationId")
  int? formApplicationId;

  @ColumnInfo(name: "submissionDate")
  String? formSubmissionDate;

  @ColumnInfo(name: "submissionName")
  String? formSubmissionName;

  @ColumnInfo(name: "submissionId")
  String? formSubmissionId;

  @ColumnInfo(name: "formSubmissionData")
  String? formSubmissionData;

  @ColumnInfo(name: "isFormSubmissionDataUpdated")
  bool? isFormSubmissionDataUpdated;

  @ColumnInfo(name: "isFormSubmissionDone")
  bool? isFormSubmissionDone;

  @ColumnInfo(name: "isFormDataUpdated")
  bool? isFormDataUpdated;

  @ColumnInfo(name: "isTaskDataChanged")
  bool? isTaskDataChanged;

  @ColumnInfo(name: "formSubmissionActionType")
  String? formSubmissionActionType;

  TaskEntity(
      {this.id,
      this.taskId,
      this.formResourceId,
      this.name,
      this.created,
      this.executionId,
      this.priority,
      this.processDefinitionId,
      this.processInstanceId,
      this.taskDefinitionKey,
      this.suspended,
      this.assignee,
      this.followUp,
      this.status,
      this.filterId,
      this.applicationStatus,
      this.formUrl,
      this.formApplicationId,
      this.formSubmissionDate,
      this.formSubmissionName,
      this.formSubmissionId,
      this.isFormDataUpdated,
      this.formSubmissionData,
      this.isFormSubmissionDataUpdated,
      this.isFormSubmissionDone,
      this.processDefinitionName,
      this.dueDate,
      this.isTaskDataChanged,
      this.formSubmissionActionType});

  @override
  String toString() {
    return 'Task{id: $id, taskId: $taskId, formResourceId: $formResourceId, name: $name, created: $created, executionId: $executionId, priority: $priority, processDefinitionId: $processDefinitionId, processInstanceId: $processInstanceId, taskDefinitionKey: $taskDefinitionKey, processDefinitionName: $processDefinitionName, suspended: $suspended, assignee: $assignee, followUp: $followUp, dueDate: $dueDate, status: $status, filterId: $filterId, applicationStatus: $applicationStatus, formUrl: $formUrl, formApplicationId: $formApplicationId, formSubmissionDate: $formSubmissionDate, formSubmissionName: $formSubmissionName, formSubmissionId: $formSubmissionId, formSubmissionData: $formSubmissionData, isFormSubmissionDataUpdated: $isFormSubmissionDataUpdated, isFormSubmissionDone: $isFormSubmissionDone, isFormDataUpdated: $isFormDataUpdated, isTaskDataChanged: $isTaskDataChanged}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskEntity &&
          runtimeType == other.runtimeType &&
          taskId == other.taskId;

  @override
  int get hashCode => taskId.hashCode;
}
