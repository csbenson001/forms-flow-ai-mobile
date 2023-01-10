import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/model/task_base_response.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/model/task_listing_data_model.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/task_variable_dm.dart';
import 'package:formsflowai/repository/task/task_local_data_source_impl.dart';
import 'package:formsflowai/repository/task/task_remote_data_source_impl.dart';
import 'package:formsflowai/repository/task/task_repository.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolated_response;

import '../../core/api/post/form/form_submission_post_model.dart';
import '../../core/api/post/task/add_group_post_model.dart';
import '../../core/api/post/task/delete_group_post_model.dart';
import '../../core/api/post/task/tasklist_sort.dart';
import '../../core/api/post/task/update_task_post_model.dart';
import '../../core/api/response/base/base_response.dart';
import '../../core/api/response/diagram/activity_instance_response.dart';
import '../../core/api/response/diagram/bpmn_diagram_response.dart';
import '../../core/api/response/filter/get_filters_response.dart';
import '../../core/api/response/filter/task_count_response.dart';
import '../../core/api/response/processdefinition/process_definition_response.dart';
import '../../core/api/response/task/details/list_members_response.dart';
import '../../core/api/response/task/details/task_group_response.dart';
import '../../core/database/entity/task_entity.dart';
import '../../core/error/errors_failure.dart';
import '../../core/networkmanager/network_manager_controller.dart';

/// [TaskDataRepository] repository contains task related data source
/// methods
class TaskDataRepository implements TaskRepository {
  final TaskRemoteDataSourceImpl remoteDataSource;
  final TaskLocalDataSourceImpl localDataSource;
  final NetworkManagerController networkManagerController;

  TaskDataRepository(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkManagerController});

  /// Method to add group
  /// Parameters
  /// [TaskId]
  /// [AddGroupPostModel]
  @override
  Future<Either<Failure, void>> addGroup(
      {required String taskId, required AddGroupPostModel addGroupPostModel}) {
    return remoteDataSource.addGroup(
        taskId: taskId, addGroupPostModel: addGroupPostModel);
  }

  /// Method to claim task
  /// Parameters
  /// [TaskId]
  /// [Payload]
  @override
  Future<Either<Failure, void>> claimTask(
      {required String taskId, required Map<String, String> payload}) {
    return remoteDataSource.claimTask(taskId: taskId, payload: payload);
  }

  /// Method to delete group
  /// Parameters
  /// [TaskId]
  /// [AddGroupPostModel]
  @override
  Future<Either<Failure, void>> deleteGroup(
      {required String taskId,
      required DeleteGroupPostModel addGroupPostModel}) {
    return remoteDataSource.deleteGroup(
        taskId: taskId, addGroupPostModel: addGroupPostModel);
  }

  /// Method to fetch BPMNDiagram
  @override
  Future<Either<Failure, BpmnDiagramResponse>> fetchBpmnDiagram() {
    return remoteDataSource.fetchBpmnDiagram();
  }

  /// Method to fetch BPMN Instances
  /// Parameters
  /// [Id]
  /// ---> Returns [BpmnWorkflowInstancesResponse]
  @override
  Future<Either<Failure, BpmnWorkflowInstancesResponse>> fetchBpmnInstances(
      {required String id}) {
    return remoteDataSource.fetchBpmnInstances(id: id);
  }

  /// Method to fetch filters
  /// ---> Return List[FiltersResponse]
  @override
  Future<Either<Failure, List<FiltersResponse>>> fetchFilters() {
    if (networkManagerController.connectionType == ConnectivityResult.none) {
      return localDataSource.fetchFilters();
    } else {
      return remoteDataSource.fetchFilters();
    }
  }

  /// Method to fetch form submission data
  /// Parameters
  /// [TaskId]
  /// [FormSubmissionId]
  /// ---> Returns [FormSubmissionDataStringEncoded]
  @override
  Future<Either<Failure, String>> fetchFormSubmissionData(
      String host, String taskId, String formSubmissionId) {
    if (networkManagerController.connectionType == ConnectivityResult.none) {
      return localDataSource.fetchFormSubmissionData(
          host, taskId, formSubmissionId);
    } else {
      return remoteDataSource.fetchFormSubmissionData(
          host, taskId, formSubmissionId);
    }
  }

  /// Method to fetch groups
  /// Parameters
  /// [TaskId]
  /// ---> Returns List[TaskGroupsResponse]
  @override
  Future<Either<Failure, List<TaskGroupsResponse>>> fetchGroups(
      {required String taskId}) {
    return remoteDataSource.fetchGroups(taskId: taskId);
  }

  /// Method to fetch task variables
  /// Parameters
  /// ---> Returns [Response]
  @override
  Future<Either<Failure, isolated_response.Response>>
      fetchIsolatedTaskVariables({required String taskId}) {
    return remoteDataSource.fetchIsolatedTaskVariables(taskId: taskId);
  }

  /// Method to fetch members
  /// ---> Returns List[ListMembersResponse]
  @override
  Future<Either<Failure, List<ListMembersResponse>>> fetchMembers() {
    return remoteDataSource.fetchMembers();
  }

  /// Method to fetch process definitions
  /// ---> Returns List[ProcessDefinitionResponse]
  @override
  Future<Either<Failure, List<ProcessDefinitionResponse>>>
      fetchProcessDefinitions() {
    return remoteDataSource.fetchProcessDefinitions();
  }

  /// Method to fetch task by id
  /// Parameters
  /// [Id]
  /// List[ProcessDefinitionResponse]
  /// ---> Returns [TaskListingDM]
  @override
  Future<Either<Failure, TaskListingDM>> fetchTaskById(
      String id, List<ProcessDefinitionResponse>? definitionResponse) {
    return remoteDataSource.fetchTaskById(id, definitionResponse);
  }

  /// Method to fetch task count
  /// Parameters
  /// [Id]
  /// ---> Returns [TaskCountResponse]
  @override
  Future<Either<Failure, TaskCountResponse>> fetchTaskCount(String id) {
    if (networkManagerController.connectionType == ConnectivityResult.none) {
      return localDataSource.fetchTaskCount(id);
    } else {
      return remoteDataSource.fetchTaskCount(id);
    }
  }

  /// Method to fetch task variables
  /// Parameters
  /// [Id]
  /// ---> Returns [TaskVariableDM]
  @override
  Future<Either<Failure, TaskVariableDM>> fetchTaskVariables(
      {required String id}) {
    if (networkManagerController.connectionType == ConnectivityResult.none) {
      return localDataSource.fetchTaskVariables(id: id);
    } else {
      return remoteDataSource.fetchTaskVariables(id: id);
    }
  }

  /// Method to fetch task with isolate
  /// Parameters
  /// [TaskId]
  /// ---> Returns [Response]
  @override
  Future<Either<Failure, Response>> fetchTask({required String taskId}) {
    return remoteDataSource.fetchTask(taskId: taskId);
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
      List<ProcessDefinitionResponse>? definitionResponse) {
    if (networkManagerController.connectionType == ConnectivityResult.none) {
      return localDataSource.fetchTasks(id, firstResult, maxResults,
          taskSortingPostModel, definitionResponse);
    } else {
      return remoteDataSource.fetchTasks(id, firstResult, maxResults,
          taskSortingPostModel, definitionResponse);
    }
  }

  /// Method to submit form
  /// Parameters
  /// [Id]
  /// [FormSubmissionPostModel]
  /// ---> Returns [BaseResponse]
  @override
  Future<Either<Failure, BaseResponse>> submitForm(
      {required String id,
      required FormSubmissionPostModel formSubmissionPostModel}) {
    return remoteDataSource.submitForm(
        id: id, formSubmissionPostModel: formSubmissionPostModel);
  }

  /// Methods to unClaim task
  /// Parameters
  /// [TaskId]
  @override
  Future<Either<Failure, void>> unClaimTask({required String taskId}) {
    return remoteDataSource.unClaimTask(taskId: taskId);
  }

  /// Method to update assignee
  /// Parameters
  /// [TaskId]
  /// [Payload]
  @override
  Future<Either<Failure, void>> updateAssignee(
      {required String taskId, required Map<String, String> payload}) {
    return remoteDataSource.updateAssignee(taskId: taskId, payload: payload);
  }

  /// Method to update remote task
  /// Parameters
  /// [TaskId]
  /// [UpdateTaskPostModel]
  @override
  Future<Either<Failure, void>> updateRemoteTask(
      {required String taskId,
      required UpdateTaskPostModel updateTaskPostModel}) {
    return remoteDataSource.updateRemoteTask(
        taskId: taskId, updateTaskPostModel: updateTaskPostModel);
  }

  /// Method to update task in background
  /// Parameters
  /// [TaskId]
  /// [UpdateTaskPostModel]
  /// ---> Returns [Response]
  @override
  Future<Either<Failure, isolated_response.Response>> updateTaskWithIsolates(
      {required String taskId,
      required UpdateTaskPostModel updateTaskPostModel}) {
    return remoteDataSource.updateTaskWithIsolates(
        taskId: taskId, updateTaskPostModel: updateTaskPostModel);
  }

  /// Method to clear database data
  @override
  Future<Either<Failure, void>> clearDatabaseData() {
    return localDataSource.clearDatabaseData();
  }

  /// Method to delete task
  /// Parameters
  /// [TaskEntity]
  @override
  Future<Either<Failure, void>> deleteTask({required TaskEntity task}) {
    return localDataSource.deleteTask(task: task);
  }

  /// Method to fetch all tasks from local data source
  /// ---> Returns List[TaskEntity]
  @override
  Future<Either<Failure, List<TaskEntity>>> fetchAllTasksFromLocalDb() {
    return localDataSource.fetchAllTasksFromLocalDb();
  }

  /// Method to fetch task from local data source
  /// ---> Returns TaskEntity
  @override
  Future<Either<Failure, TaskEntity?>> fetchTaskByIdFromLocalDb(
      {required String taskId}) {
    return localDataSource.fetchTaskByIdFromLocalDb(taskId: taskId);
  }

  /// Method to fetch all tasks from local data source with pagination
  /// ---> Returns List[TaskListingDM]
  @override
  Future<Either<Failure, List<TaskListingDM>>> fetchTasksFromLocalDb(
      {required String id, required int firstResult, required int maxResults}) {
    return localDataSource.fetchTasksFromLocalDb(
        id: id, firstResult: firstResult, maxResults: maxResults);
  }

  /// Method to insert all tasks into local data source
  /// Parameters
  /// List[TaskEntity]
  @override
  Future<Either<Failure, void>> insertAllTasks(
      {required List<TaskEntity> tasks}) {
    return localDataSource.insertAllTasks(tasks: tasks);
  }

  /// Method to insert task in local data source
  /// Parameters
  /// [TaskEntity]
  @override
  Future<Either<Failure, int>> insertTask({required TaskEntity task}) {
    return localDataSource.insertTask(task: task);
  }

  /// Method to update task in local data source
  /// Parameters
  /// [TaskEntity]
  @override
  Future<Either<Failure, void>> updateTaskInLocalDB(
      {required TaskEntity task}) {
    return localDataSource.updateTaskInLocalDB(task: task);
  }

  /// Method to submit form in the background
  /// Parameters
  /// [Id]
  /// [FormSubmissionPostModel]
  /// ---> Returns [BaseResponse]
  @override
  Future<Either<Failure, BaseResponse>> submitFormIsolate(
      {required String id,
      required FormSubmissionPostModel formSubmissionPostModel}) {
    return remoteDataSource.submitFormIsolate(
        id: id, formSubmissionPostModel: formSubmissionPostModel);
  }
}
