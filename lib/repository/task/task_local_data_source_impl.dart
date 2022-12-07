import 'package:dartz/dartz.dart';
import 'package:floor/floor.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/model/task_base_response.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/model/task_listing_data_model.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/task_variable_dm.dart';
import 'package:formsflowai/repository/task/task_repository.dart';
import 'package:formsflowai_api/post/form/form_submission_post_model.dart';
import 'package:formsflowai_api/post/task/add_group_post_model.dart';
import 'package:formsflowai_api/post/task/delete_group_post_model.dart';
import 'package:formsflowai_api/post/task/tasklist_sort.dart';
import 'package:formsflowai_api/post/task/update_task_post_model.dart';
import 'package:formsflowai_api/response/base/base_response.dart';
import 'package:formsflowai_api/response/diagram/activity_instance_response.dart';
import 'package:formsflowai_api/response/diagram/bpmn_diagram_response.dart';
import 'package:formsflowai_api/response/filter/get_filters_response.dart';
import 'package:formsflowai_api/response/filter/task_count_response.dart';
import 'package:formsflowai_api/response/processdefinition/process_definition_response.dart';
import 'package:formsflowai_api/response/task/details/list_members_response.dart';
import 'package:formsflowai_api/response/task/details/task_group_response.dart';
import 'package:isolated_http_client/isolated_http_client.dart';
import 'package:isolated_http_client/src/response.dart';

import '../../core/database/dao/application_history_dao.dart';
import '../../core/database/dao/task_dao.dart';
import '../../core/database/entity/task_entity.dart';
import '../../core/database/formsflow_database.dart';
import '../../core/error/errors_failure.dart';
import '../../core/preferences/app_preference.dart';
import '../../utils/database/database_query_util.dart';

class TaskLocalDataSourceImpl implements TaskRepository {
  final TaskDao taskDao;

  final AppPreferences preferences;

  final ApplicationHistoryDao applicationHistoryDao;

  final FormsFlowDatabase formsFlowDatabase;

  QueryAdapter? _queryAdapter;

  TaskLocalDataSourceImpl({
    required this.formsFlowDatabase,
    required this.taskDao,
    required this.applicationHistoryDao,
    required this.preferences,
  }) {
    _queryAdapter = QueryAdapter(formsFlowDatabase.database);
  }

  @override
  Future<Either<Failure, void>> addGroup(
      {required String taskId, required AddGroupPostModel addGroupPostModel}) {
    // TODO: implement addGroup
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> claimTask(
      {required String taskId, required Map<String, String> payload}) {
    // TODO: implement claimTask
    throw UnimplementedError();
  }

  /// Method to clear database data
  @override
  Future<Either<Failure, void>> clearDatabaseData() async {
    await applicationHistoryDao.deleteAllApplicationHistory();
    return (Right(taskDao.deleteAllTasks()));
  }

  @override
  Future<Either<Failure, void>> deleteGroup(
      {required String taskId,
      required DeleteGroupPostModel addGroupPostModel}) {
    // TODO: implement deleteGroup
    throw UnimplementedError();
  }

  /// Method to delete task
  /// Parameters
  /// [TaskEntity]
  @override
  Future<Either<Failure, void>> deleteTask({required TaskEntity task}) async {
    if (task.formApplicationId != 0) {
      await applicationHistoryDao
          .deleteApplicationHistoryByApplicationId(task.formApplicationId ?? 0);
    }
    return Right(taskDao.deleteTask(task));
  }

  /// Method to fetch all tasks from local data source
  /// ---> Returns List[TaskEntity]
  @override
  Future<Either<Failure, List<TaskEntity>>> fetchAllTasksFromLocalDb() async {
    return Right(await taskDao.fetchAllTasks());
  }

  @override
  Future<Either<Failure, BpmnDiagramResponse>> fetchBpmnDiagram() {
    // TODO: implement fetchBpmnDiagram
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BpmnWorkflowInstancesResponse>> fetchBpmnInstances(
      {required String id}) {
    // TODO: implement fetchBpmnInstances
    throw UnimplementedError();
  }

  /// Method to fetch filters
  /// ---> Return List[FiltersResponse]
  @override
  Future<Either<Failure, List<FiltersResponse>>> fetchFilters() async {
    var filters = preferences.getFiltersData();
    return Right(filters);
  }

  /// Method to fetch form submission data
  /// Parameters
  /// [TaskId]
  /// [FormSubmissionId]
  /// ---> Returns [FormSubmissionDataStringEncoded]
  @override
  Future<Either<Failure, String>> fetchFormSubmissionData(
      String host, String taskId, String formSubmissionId) {
    // TODO: implement fetchFormSubmissionData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TaskGroupsResponse>>> fetchGroups(
      {required String taskId}) {
    // TODO: implement fetchGroups
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Response>> fetchIsolatedTaskVariables(
      {required String host}) {
    // TODO: implement fetchIsolatedTaskVariables
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ListMembersResponse>>> fetchMembers() {
    // TODO: implement fetchMembers
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProcessDefinitionResponse>>>
      fetchProcessDefinitions() {
    // TODO: implement fetchProcessDefinitions
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskListingDM>> fetchTaskById(
      String id, List<ProcessDefinitionResponse>? definitionResponse) {
    // TODO: implement fetchTaskById
    throw UnimplementedError();
  }

  /// Method to fetch task from local data source
  /// ---> Returns TaskEntity
  @override
  Future<Either<Failure, TaskEntity?>> fetchTaskByIdFromLocalDb(
      {required String taskId}) async {
    return Right(await taskDao.findTaskByTaskId(taskId));
  }

  /// Method to fetch task count
  /// Parameters
  /// [Id]
  /// ---> Returns [TaskCountResponse]
  @override
  Future<Either<Failure, TaskCountResponse>> fetchTaskCount(String id) async {
    final results = await formsFlowDatabase.database
        .rawQuery(DatabaseQueryUtil.generateTotalOfflineTaskSqlQuery());
    return Right(TaskCountResponse(count: results[0]['COUNT(id)'] as int?));
  }

  /// Method to fetch task variables
  /// Parameters
  /// [Id]
  /// ---> Returns [TaskVariableDM]
  @override
  Future<Either<Failure, TaskVariableDM>> fetchTaskVariables(
      {required String id}) async {
    var task = await taskDao.findTaskByTaskId(id);

    if (task != null && task.formResourceId != null) {
      return Right(TaskVariableDM.transformFromTask(task));
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Response>> fetchTaskWithIsolate(
      {required String host, required String taskId}) {
    // TODO: implement fetchTaskWithIsolate
    throw UnimplementedError();
  }

  /// Method to fetch tasks
  /// Parameters
  /// [Id]
  /// [FirstResult]
  /// [MaxResults]
  /// [TaskSortPostModel]
  /// List[ProcessDefinitionResponse]
  /// ---> Returns [TaskBaseDataResponse]
  @override
  Future<Either<Failure, TaskBaseDataResponse>> fetchTasks(
      String id,
      int firstResult,
      int maxResults,
      TaskSortPostModel taskSortingPostModel,
      List<ProcessDefinitionResponse>? definitionResponse) async {
    List<TaskEntity>? tasks = await _queryAdapter?.queryList(
        DatabaseQueryUtil.generateSqlQuery(
            id, firstResult, maxResults, taskSortingPostModel),
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            taskId: row['taskId'] as String?,
            formResourceId: row['formResourceId'] as String?,
            name: row['name'] as String?,
            created: DatabaseQueryUtil.decode(row['created'] as String?),
            executionId: row['executionId'] as String?,
            priority: row['priority'] as int?,
            processDefinitionId: row['processDefinitionId'] as String?,
            processInstanceId: row['processInstanceId'] as String?,
            taskDefinitionKey: row['taskDefinitionKey'] as String?,
            suspended: row['suspended'] == null
                ? null
                : (row['suspended'] as int) != 0,
            assignee: row['assignee'] as String?,
            followUp: DatabaseQueryUtil.decode(row['followUpDate'] as String?),
            dueDate: DatabaseQueryUtil.decode(row['dueDate'] as String?),
            status: row['status'] as String?,
            filterId: row['filterId'] as String?,
            applicationStatus: row['applicationStatus'] as String?,
            formUrl: row['formUrl'] as String?,
            formApplicationId: row['applicationId'] as int?,
            formSubmissionDate: row['submissionDate'] as String?,
            formSubmissionName: row['submissionName'] as String?,
            formSubmissionId: row['submissionId'] as String?,
            processDefinitionName: row['processDefinitionName'] as String?,
            isFormDataUpdated: row['isFormDataUpdated'] == null
                ? null
                : (row['isFormDataUpdated'] as int) != 0,
            isTaskDataChanged: row['isTaskDataChanged'] == null
                ? null
                : (row['isTaskDataChanged'] as int) != 0,
            formSubmissionData: row['formSubmissionData'] as String?,
            isFormSubmissionDataUpdated:
                row['isFormSubmissionDataUpdated'] == null
                    ? null
                    : (row['isFormSubmissionDataUpdated'] as int) != 0,
            formSubmissionActionType:
                row['formSubmissionActionType'] as String?,
            isFormSubmissionDone: row['isFormSubmissionDone'] == null
                ? null
                : (row['isFormSubmissionDone'] as int) != 0));

    return Right(TaskBaseDataResponse.transformFromEntity(data: tasks));
  }

  /// Method to fetch all tasks from local data source with pagination
  /// ---> Returns List[TaskListingDM]
  @override
  Future<Either<Failure, List<TaskListingDM>>> fetchTasksFromLocalDb(
      {required String id,
      required int firstResult,
      required int maxResults}) async {
    throw UnimplementedError();
  }

  /// Method to insert all tasks into local data source
  /// Parameters
  /// List[TaskEntity]
  @override
  Future<Either<Failure, void>> insertAllTasks(
      {required List<TaskEntity> tasks}) async {
    return Right(await taskDao.insertTasks(tasks));
  }

  /// Method to insert task into local data source
  /// Parameters
  /// [TaskEntity]
  /// ---> Returns [Int]
  @override
  Future<Either<Failure, int>> insertTask({required TaskEntity task}) async {
    return Right(await taskDao.insertTask(task));
  }

  @override
  Future<Either<Failure, BaseResponse>> submitForm(
      {required String id,
      required FormSubmissionPostModel formSubmissionPostModel}) {
    // TODO: implement submitForm
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> unClaimTask({required String taskId}) {
    // TODO: implement unclaimTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateAssignee(
      {required String taskId, required Map<String, String> payload}) {
    // TODO: implement updateAssignee
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateRemoteTask(
      {required String taskId,
      required UpdateTaskPostModel updateTaskPostModel}) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  /// Method to update task in local data source
  /// Parameters
  /// [TaskEntity]
  @override
  Future<Either<Failure, void>> updateTaskInLocalDB(
      {required TaskEntity task}) async {
    return Right(await taskDao.updateTask(task));
  }

  @override
  Future<Either<Failure, Response>> updateTaskWithIsolates(
      {required String url,
      required String taskId,
      required UpdateTaskPostModel updateTaskPostModel}) {
    // TODO: implement updateTaskWithIsolates
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BaseResponse>> submitFormIsolate(
      {required String id,
      required FormSubmissionPostModel formSubmissionPostModel}) {
    // TODO: implement submitFormIsolate
    throw UnimplementedError();
  }
}
