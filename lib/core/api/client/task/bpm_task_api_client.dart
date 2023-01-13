import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../post/form/form_submission_post_model.dart';
import '../../post/task/add_group_post_model.dart';
import '../../post/task/delete_group_post_model.dart';
import '../../post/task/tasklist_sort.dart';
import '../../post/task/update_task_post_model.dart';
import '../../response/filter/filters_response.dart';
import '../../response/filter/task_count_response.dart';
import '../../response/processdefinition/process_definition_response.dart';
import '../../response/task/details/list_members_response.dart';
import '../../response/task/details/task_group_response.dart';
import '../../response/task/tasklist/task_list_response.dart';
import '../../response/task/tasklist_hal/task_list_hal_response.dart';
import '../../response/task/variables/task_variables_response.dart';
import '../../utils/api_constants_url.dart';

part 'bpm_task_api_client.g.dart';

@RestApi()
abstract class BpmTaskApiClient {
  factory BpmTaskApiClient(Dio dio, {String? baseUrl}) = _BpmTaskApiClient;

  /// Function to fetch filters
  /// ---> Returns [List<FiltersResponse>]
  @GET(ApiConstantUrl.fetchFilters)
  Future<List<FiltersResponse>> fetchFilters();

  /// Function to fetch process definitions
  /// ---> Returns [List<ProcessDefinitionResponse>]
  @GET(ApiConstantUrl.fetchProcessDefinition)
  Future<List<ProcessDefinitionResponse>> fetchProcessDefinitions();

  /// Function to fetch all tasks
  /// Input Parameters
  /// [AcceptType] - specifies the return accept type(application/json,
  /// application/hal+json)
  /// [Id] - filter type id
  /// [FirstResult] - start task pagination
  /// [MaxResults] - max results to be displayed per page
  /// ---> Returns [TaskListHalResponse]
  @POST(ApiConstantUrl.fetchTasks)
  Future<TaskListHalResponse> fetchTasks(
      @Header('Accept') String acceptType,
      @Path() String id,
      @Query('firstResult') int firstResult,
      @Query('maxResults') int maxResults,
      @Body() TaskSortPostModel taskSortingPostModel);

  /// Function to fetch task count based on the filter type
  /// Input Parameters
  /// [Id] - filter type id
  /// ---> Returns [TaskListHalResponse]
  @GET(ApiConstantUrl.fetchTasksListCount)
  Future<TaskCountResponse> fetchTaskCount(@Path() String id);

  /// Function to fetch task variable response data
  /// Input Parameters
  /// [Id] - task Id
  /// ---> Returns [TaskVariablesResponse]
  @GET(ApiConstantUrl.fetchTasksDetailsVariables)
  Future<HttpResponse<TaskVariablesResponse>> fetchTaskVariables(
      @Path() String id);

  /// Function to fetch task data by taskId
  /// Input Parameters
  /// [Id] - task Id
  /// ---> Returns [TaskListResponse]
  @POST(ApiConstantUrl.fetchTasksById)
  Future<TaskListResponse> fetchTaskById(@Path() String id);

  /// Function to claim task
  /// Input Parameters
  /// [Id] - task Id
  /// [Body] - Map of the {userId : "${userId}"}
  /// ---> Returns [Response]
  @POST(ApiConstantUrl.claimTask)
  Future<HttpResponse<void>> claimTask(
      @Path() String id, @Body() Map<String, String> body);

  /// Function to un-claim task
  /// Input Parameters
  /// [Id] - task Id
  /// ---> Returns [Response]
  @POST(ApiConstantUrl.unclaimTask)
  Future<HttpResponse<void>> unClaimTask(@Path() String id);

  /// Function to submit form
  /// Input Parameters
  /// [Id] - task Id
  /// [FormSubmissionPostModel] - Form submission post model
  /// ---> Returns [Response]
  @POST(ApiConstantUrl.submitForm)
  Future<HttpResponse<void>> submitForm(@Path() String id,
      @Body() FormSubmissionPostModel formSubmissionPostModel);

  /// Function to update task
  /// Input Parameters
  /// [Id] - task Id
  /// [UpdateTaskPostModel] - update task post model
  /// ---> Returns []
  @PUT(ApiConstantUrl.updateTask)
  Future<void> updateTask(
      @Path() String id, @Body() UpdateTaskPostModel updateTaskPostModel);

  /// Function to fetch task groups
  /// Input Parameters
  /// [Id] - task Id
  /// ---> Returns [List<TaskGroupsResponse>]
  @GET(ApiConstantUrl.taskGroup)
  Future<HttpResponse<List<TaskGroupsResponse>>> fetchTaskGroups(
      @Path() String id);

  /// Function to add group
  /// Input Parameters
  /// [Id] - task Id
  /// [AddGroupPostModel] - add group post model
  /// ---> Returns []
  @POST(ApiConstantUrl.taskGroup)
  Future<HttpResponse<void>> addGroup(
      @Path() String id, @Body() AddGroupPostModel addGroupPostModel);

  /// Function to fetch members list
  /// Input Parameters
  /// [memberOfGroup] - formsflowai group name
  /// ---> Returns [List<ListMembersResponse>]
  @GET(ApiConstantUrl.fetchMembers)
  Future<HttpResponse<List<ListMembersResponse>>> fetchMembersList(
      @Query("memberOfGroup") String memberOfGroup);

  /// Function to delete group
  /// Input Parameters
  /// [Id] - task Id
  /// [DeleteGroupPostModel] - delete group post model
  @POST(ApiConstantUrl.deleteGroup)
  Future<HttpResponse<void>> deleteGroup(
      @Path() String id, @Body() DeleteGroupPostModel deleteGroupPostModel);

  /// Function to update assignee
  /// Input Parameters
  /// [Id] - task Id
  /// [Body] - map {"userId": "${assignedUserId}"}
  @POST(ApiConstantUrl.updateAssignee)
  Future<HttpResponse<void>> updateAssignee(
      @Path() String id, @Body() Map<String, String> body);
}
