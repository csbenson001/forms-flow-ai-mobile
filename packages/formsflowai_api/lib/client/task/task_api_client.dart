import 'package:dio/dio.dart';
import 'package:formsflowai_api/response/task/tasklist_hal/task_list_hal_response.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:retrofit/retrofit.dart';

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
import '../../response/task/variables/task_variables_response.dart';

part 'task_api_client.g.dart';

@RestApi(baseUrl: ApiConstantUrl.FORMSFLOWAI_BASE_URL)
abstract class TaskApiClient {
  factory TaskApiClient(Dio dio, {String? baseUrl}) = _TaskApiClient;

  @GET(ApiConstantUrl.FETCH_FILTERS)
  Future<List<FiltersResponse>> fetchFilters(
    @Header('Authorization') String accessToken,
  );

  @GET(ApiConstantUrl.FETCH_PROCESS_DEIFINITION)
  Future<List<ProcessDefinitionResponse>> fetchProcessDefinitions(
    @Header('Authorization') String accessToken,
  );

  @POST(ApiConstantUrl.FETCH_TASKS)
  Future<TaskListHalResponse> fetchTasks(
      @Header('Accept') String acceptType,
      @Path() String id,
      @Query('firstResult') int firstResult,
      @Query('maxResults') int maxResults,
      @Body() TaskSortPostModel taskSortingPostModel);

  @GET(ApiConstantUrl.FETCH_TASKS_LIST_COUNT)
  Future<TaskCountResponse> fetchTaskCount(@Path() String id);

  @GET(ApiConstantUrl.FETCH_TASKS_DETAILS_VARIABLES)
  Future<HttpResponse<TaskVariablesResponse>> fetchTaskVariables(
      @Path() String id);

  @POST(ApiConstantUrl.FETCH_TASKS_BY_ID)
  Future<TaskListResponse> fetchTaskById(@Path() String id);

  @POST(ApiConstantUrl.CLAIM_TASK)
  Future<HttpResponse<void>> claimTask(
      @Path() String id, @Body() Map<String, String> body);

  @POST(ApiConstantUrl.UNCLAIM_TASK)
  Future<HttpResponse<void>> unclaimTask(@Path() String id);

  @POST(ApiConstantUrl.SUBMIT_FORM)
  Future<HttpResponse<void>> submitForm(@Path() String id,
      @Body() FormSubmissionPostModel formSubmissionPostModel);

  @PUT(ApiConstantUrl.UPDATE_TASK)
  Future<void> updateTask(
      @Path() String id, @Body() UpdateTaskPostModel updateTaskPostModel);

  @GET(ApiConstantUrl.TASK_GROUP)
  Future<HttpResponse<List<TaskGroupsResponse>>> fetchTaskGroups(
      @Path() String id);

  @POST(ApiConstantUrl.TASK_GROUP)
  Future<HttpResponse<void>> addGroup(
      @Path() String id, @Body() AddGroupPostModel addGroupPostModel);

  @GET(ApiConstantUrl.FETCH_MEMBERS)
  Future<HttpResponse<List<ListMembersResponse>>> fetchMembersList(
      @Query("memberOfGroup") String memberOfGroup);

  @POST(ApiConstantUrl.DELETE_GROUP)
  Future<HttpResponse<void>> deleteGroup(
      @Path() String id, @Body() DeleteGroupPostModel deleteGroupPostModel);

  @POST(ApiConstantUrl.UPDATE_ASSIGNEE)
  Future<HttpResponse<void>> updateAssignee(
      @Path() String id, @Body() Map<String, String> body);
}
