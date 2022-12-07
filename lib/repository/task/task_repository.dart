import 'package:dartz/dartz.dart';
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

import '../../core/database/entity/task_entity.dart';
import '../../core/error/errors_failure.dart';
import '../../presentation/features/home/tasklisting/model/task_base_response.dart';
import '../../presentation/features/home/tasklisting/model/task_listing_data_model.dart';
import '../../presentation/features/taskdetails/model/task_variable_dm.dart';

abstract class TaskRepository<T> {
  Future<Either<Failure, TaskBaseDataResponse>> fetchTasks(
      String id,
      int firstResult,
      int maxResults,
      TaskSortPostModel taskSortingPostModel,
      List<ProcessDefinitionResponse>? definitionResponse);

  Future<Either<Failure, TaskListingDM>> fetchTaskById(
      String id, List<ProcessDefinitionResponse>? definitionResponse);

  Future<Either<Failure, List<FiltersResponse>>> fetchFilters();

  Future<Either<Failure, TaskCountResponse>> fetchTaskCount(String id);

  Future<Either<Failure, List<ProcessDefinitionResponse>>>
      fetchProcessDefinitions();

  Future<Either<Failure, TaskVariableDM>> fetchTaskVariables(
      {required String id});

  Future<Either<Failure, void>> claimTask(
      {required String taskId, required Map<String, String> payload});

  Future<Either<Failure, void>> unClaimTask({required String taskId});

  Future<Either<Failure, String>> fetchFormSubmissionData(
      String host, String taskId, String formSubmissionId);

  Future<Either<Failure, BaseResponse>> submitForm(
      {required String id,
      required FormSubmissionPostModel formSubmissionPostModel});

  Future<Either<Failure, Response>> fetchIsolatedTaskVariables(
      {required String host});

  Future<Either<Failure, Response>> fetchTaskWithIsolate(
      {required String host, required String taskId});

  Future<Either<Failure, BpmnDiagramResponse>> fetchBpmnDiagram();

  Future<Either<Failure, BpmnWorkflowInstancesResponse>> fetchBpmnInstances(
      {required String id});

  Future<Either<Failure, void>> updateRemoteTask(
      {required String taskId,
      required UpdateTaskPostModel updateTaskPostModel});

  Future<Either<Failure, Response>> updateTaskWithIsolates(
      {required String url,
      required String taskId,
      required UpdateTaskPostModel updateTaskPostModel});

  Future<Either<Failure, List<TaskGroupsResponse>>> fetchGroups(
      {required String taskId});

  Future<Either<Failure, void>> addGroup(
      {required String taskId, required AddGroupPostModel addGroupPostModel});

  Future<Either<Failure, List<ListMembersResponse>>> fetchMembers();

  Future<Either<Failure, void>> deleteGroup(
      {required String taskId,
      required DeleteGroupPostModel addGroupPostModel});

  Future<Either<Failure, void>> updateAssignee(
      {required String taskId, required Map<String, String> payload});

  // Local tasks
  Future<Either<Failure, void>> insertAllTasks(
      {required List<TaskEntity> tasks});

  Future<Either<Failure, List<TaskListingDM>>> fetchTasksFromLocalDb(
      {required String id, required int firstResult, required int maxResults});

  Future<Either<Failure, List<TaskEntity>>> fetchAllTasksFromLocalDb();

  Future<Either<Failure, void>> updateTaskInLocalDB({required TaskEntity task});

  Future<Either<Failure, TaskEntity?>> fetchTaskByIdFromLocalDb(
      {required String taskId});

  Future<Either<Failure, int>> insertTask({required TaskEntity task});

  Future<Either<Failure, void>> deleteTask({required TaskEntity task});

  Future<Either<Failure, void>> clearDatabaseData();

  Future<Either<Failure, BaseResponse>> submitFormIsolate(
      {required String id,
      required FormSubmissionPostModel formSubmissionPostModel});
}
