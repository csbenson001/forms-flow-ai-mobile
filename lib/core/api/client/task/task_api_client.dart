import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../shared/api_constants_url.dart';
import '../../post/form/form_submission_post_model.dart';
import '../../post/task/add_group_post_model.dart';
import '../../post/task/delete_group_post_model.dart';
import '../../post/task/tasklist_sort.dart';
import '../../post/task/update_task_post_model.dart';
import '../../response/filter/get_filters_response.dart';
import '../../response/filter/task_count_response.dart';
import '../../response/processdefinition/process_definition_response.dart';
import '../../response/task/details/list_members_response.dart';
import '../../response/task/details/task_group_response.dart';
import '../../response/task/tasklist/task_list_response.dart';
import '../../response/task/tasklist_hal/task_list_hal_response.dart';
import '../../response/task/variables/task_variables_response.dart';

part 'task_api_client.g.dart';

@RestApi()
abstract class TaskApiClient {
  factory TaskApiClient(Dio dio, {String? baseUrl}) = _TaskApiClient;

  @GET(ApiConstantUrl.fetchFilters)
  Future<List<FiltersResponse>> fetchFilters();

  @GET(ApiConstantUrl.fetchProcessDeifinition)
  Future<List<ProcessDefinitionResponse>> fetchProcessDefinitions();

  @POST(ApiConstantUrl.fetchTasks)
  Future<TaskListHalResponse> fetchTasks(
      @Header('Accept') String acceptType,
      @Path() String id,
      @Query('firstResult') int firstResult,
      @Query('maxResults') int maxResults,
      @Body() TaskSortPostModel taskSortingPostModel);

  @GET(ApiConstantUrl.fetchTasksListCount)
  Future<TaskCountResponse> fetchTaskCount(@Path() String id);

  @GET(ApiConstantUrl.fetchTasksDetailsVariables)
  Future<HttpResponse<TaskVariablesResponse>> fetchTaskVariables(
      @Path() String id);

  @POST(ApiConstantUrl.fetchTasksById)
  Future<TaskListResponse> fetchTaskById(@Path() String id);

  @POST(ApiConstantUrl.claimTask)
  Future<HttpResponse<void>> claimTask(
      @Path() String id, @Body() Map<String, String> body);

  @POST(ApiConstantUrl.unclaimTask)
  Future<HttpResponse<void>> unclaimTask(@Path() String id);

  @POST(ApiConstantUrl.submitForm)
  Future<HttpResponse<void>> submitForm(@Path() String id,
      @Body() FormSubmissionPostModel formSubmissionPostModel);

  @PUT(ApiConstantUrl.updateTask)
  Future<void> updateTask(
      @Path() String id, @Body() UpdateTaskPostModel updateTaskPostModel);

  @GET(ApiConstantUrl.taskGroup)
  Future<HttpResponse<List<TaskGroupsResponse>>> fetchTaskGroups(
      @Path() String id);

  @POST(ApiConstantUrl.taskGroup)
  Future<HttpResponse<void>> addGroup(
      @Path() String id, @Body() AddGroupPostModel addGroupPostModel);

  @GET(ApiConstantUrl.fetchMembers)
  Future<HttpResponse<List<ListMembersResponse>>> fetchMembersList(
      @Query("memberOfGroup") String memberOfGroup);

  @POST(ApiConstantUrl.deleteGroup)
  Future<HttpResponse<void>> deleteGroup(
      @Path() String id, @Body() DeleteGroupPostModel deleteGroupPostModel);

  @POST(ApiConstantUrl.updateAssignee)
  Future<HttpResponse<void>> updateAssignee(
      @Path() String id, @Body() Map<String, String> body);
}
