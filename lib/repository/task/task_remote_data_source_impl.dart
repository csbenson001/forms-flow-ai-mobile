import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/model/task_base_response.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/model/task_listing_data_model.dart';
import 'package:formsflowai/repository/task/task_repository.dart';
import 'package:isolated_http_client/isolated_http_client.dart'
    as isolated_response;
import 'package:isolated_http_client/isolated_http_client.dart';

import '../../core/api/client/task/task_api_client.dart';
import '../../core/api/client/user/user_api_client.dart';
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
import '../../core/api/utils/api_utils.dart';
import '../../core/database/entity/task_entity.dart';
import '../../core/error/errors_failure.dart';
import '../../core/preferences/app_preference.dart';
import '../../presentation/features/taskdetails/model/task_variable_dm.dart';
import '../../shared/api_constants_url.dart';
import '../../shared/formsflow_api_constants.dart';

class TaskRemoteDataSourceImpl implements TaskRepository {
  final TaskApiClient taskApiClient;
  final UserApiClient userApiClient;
  final AppPreferences appPreferences;
  final HttpClientIsolated isolatedHttpClient;
  final FlutterAppAuth flutterAppAuth;
  final dio.Dio taskDio;

  TaskRemoteDataSourceImpl(
      {required this.taskApiClient,
      required this.appPreferences,
      required this.flutterAppAuth,
      required this.userApiClient,
      required this.taskDio,
      required this.isolatedHttpClient});

  /// Method to add group
  /// Parameters
  /// [TaskId]
  /// [AddGroupPostModel]
  @override
  Future<Either<Failure, void>> addGroup(
      {required String taskId,
      required AddGroupPostModel addGroupPostModel}) async {
    final response = await taskApiClient.addGroup(taskId, addGroupPostModel);
    return Right(response.data);
  }

  /// Method to claim task
  /// Parameters
  /// [TaskId]
  /// [Payload]
  @override
  Future<Either<Failure, void>> claimTask(
      {required String taskId, required Map<String, String> payload}) async {
    try {
      final response = await taskApiClient.claimTask(taskId, payload);
      if (response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode200 ||
          response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode204) {
        return Right(response.data);
      } else if (response.response.statusCode == 401) {
        return Left(AuthorizationTokenExpiredFailure());
      }

      return Left(ServerFailure());
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  /// Method to delete group
  /// Parameters
  /// [TaskId]
  /// [AddGroupPostModel]
  @override
  Future<Either<Failure, void>> deleteGroup(
      {required String taskId,
      required DeleteGroupPostModel addGroupPostModel}) async {
    try {
      final response =
          await taskApiClient.deleteGroup(taskId, addGroupPostModel);
      return Right(response.data);
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  /// Method to fetch BPMN Instances
  /// Parameters
  /// [Id]
  /// ---> Returns [BpmnWorkflowInstancesResponse]
  @override
  Future<Either<Failure, BpmnDiagramResponse>> fetchBpmnDiagram() {
    throw UnimplementedError();
  }

  /// Method to fetch BPMN Instances
  /// Parameters
  /// [Id]
  /// ---> Returns [BpmnWorkflowInstancesResponse]
  @override
  Future<Either<Failure, BpmnWorkflowInstancesResponse>> fetchBpmnInstances(
      {required String id}) {
    throw UnimplementedError();
  }

  /// Method to fetch filters
  /// ---> Return List[FiltersResponse]
  @override
  Future<Either<Failure, List<FiltersResponse>>> fetchFilters() async {
    try {
      final response = await taskApiClient.fetchFilters();
      return Right(response);
    } catch (error) {
      return _handleDioError(error.runtimeType);
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
    throw UnimplementedError();
  }

  /// Method to fetch groups
  /// Parameters
  /// [TaskId]
  /// ---> Returns List[TaskGroupsResponse]
  @override
  Future<Either<Failure, List<TaskGroupsResponse>>> fetchGroups(
      {required String taskId}) async {
    try {
      final response = await taskApiClient.fetchTaskGroups(taskId);

      if (response.response.statusCode ==
          FormsFlowAIAPIConstants.statusCode200) {
        return Right(response.data);
      } else if (response.response.statusCode == 401) {
        return Left(AuthorizationTokenExpiredFailure());
      }
      return left(ServerFailure());
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  /// Method to fetch task finaliables
  /// Parameters
  /// ---> Returns [isolated_response.Response]
  @override
  Future<Either<Failure, isolated_response.Response>>
      fetchTaskVariablesIsolated({required String taskId}) async {
    try {
      final response = await isolatedHttpClient.get(
          host:
              '${ApiConstantUrl.formsflowaiBpmBaseUrl}${ApiConstantUrl.camundaEngineRest}/${ApiConstantUrl.task}/$taskId/variables',
          headers: APIUtils.getTaskAuthorizationHeader(
              acessToken: appPreferences.getAccessToken()));

      if (response.statusCode == FormsFlowAIAPIConstants.statusCode200 ||
          response.statusCode == FormsFlowAIAPIConstants.statusCode204) {
        return Right(response);
      }
      return left(ServerFailure());
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  /// Method to fetch members
  /// ---> Returns List[ListMembersResponse]
  @override
  Future<Either<Failure, List<ListMembersResponse>>> fetchMembers() async {
    try {
      final response =
          await taskApiClient.fetchMembersList(ApiConstantUrl.fetchMemberList);

      if (response.response.statusCode !=
          FormsFlowAIAPIConstants.statusCode200) {
        return Left(ServerFailure());
      }

      return Right(response.data);
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  /// Method to fetch process definitions
  /// ---> Returns List[ProcessDefinitionResponse]
  @override
  Future<Either<Failure, List<ProcessDefinitionResponse>>>
      fetchProcessDefinitions() async {
    try {
      final response = await taskApiClient.fetchProcessDefinitions();

      return Right(response);
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  /// Method to fetch task by id
  /// Parameters
  /// [Id]
  /// List[ProcessDefinitionResponse]
  /// ---> Returns [TaskListingDM]

  @override
  Future<Either<Failure, TaskListingDM>> fetchTaskById(
      String id, List<ProcessDefinitionResponse>? definitionResponse) {
    throw UnimplementedError();
  }

  /// Method to fetch task count
  /// Parameters
  /// [Id]
  /// ---> Returns [TaskCountResponse]
  @override
  Future<Either<Failure, TaskCountResponse>> fetchTaskCount(String id) async {
    try {
      final response = await taskApiClient.fetchTaskCount(id);
      return Right(response);
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  /// Method to fetch task finaliables
  /// Parameters
  /// [Id]
  /// ---> Returns [TaskfinaliableDM]
  @override
  Future<Either<Failure, TaskVariableDM>> fetchTaskVariables(
      {required String id}) async {
    try {
      final response = await taskApiClient.fetchTaskVariables(id);
      return Right(TaskVariableDM.transform(response.data));
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  /// Method to fetch task with isolate
  /// Parameters
  /// [TaskId]
  /// ---> Returns [Response]
  @override
  Future<Either<Failure, dio.Response>> fetchTask(
      {required String taskId}) async {
    try {
      final response = await taskDio.get(
        '${ApiConstantUrl.camundaEngineRest}/${ApiConstantUrl.task}/$taskId',
      );
      return Right(response);
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
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
    try {
      final data = await taskApiClient.fetchTasks("application/hal+json", id,
          firstResult, maxResults, taskSortingPostModel);
      return Right(TaskBaseDataResponse.transform(data, definitionResponse));
    } catch (error) {
      return _handleDioError(error.runtimeType);
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
      required FormSubmissionPostModel formSubmissionPostModel}) async {
    try {
      final response =
          await taskApiClient.submitForm(id, formSubmissionPostModel);
      if (response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode200 ||
          response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode204) {
        return Right(BaseResponse(
            statusCode: response.response.statusCode,
            message: FormsFlowAIAPIConstants.statusSuccessMessage));
      }
      return Left(ServerFailure());
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  /// Methods to unclaim task
  /// Parameters
  /// [TaskId]
  @override
  Future<Either<Failure, void>> unClaimTask({required String taskId}) async {
    try {
      final response = await taskApiClient.unclaimTask(taskId);
      if (response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode200 ||
          response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode204) {
        return Right(response.data);
      }
      return Left(ServerFailure());
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  /// Method to update assignee
  /// Parameters
  /// [TaskId]
  /// [Payload]
  @override
  Future<Either<Failure, void>> updateAssignee(
      {required String taskId, required Map<String, String> payload}) async {
    try {
      final response = await taskApiClient.updateAssignee(taskId, payload);
      if (response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode200 ||
          response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode204) {
        return Right(response.data);
      }
      return Left(ServerFailure());
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  /// Method to update remote task
  /// Parameters
  /// [TaskId]
  /// [UpdateTaskPostModel]
  @override
  Future<Either<Failure, void>> updateRemoteTask(
      {required String taskId,
      required UpdateTaskPostModel updateTaskPostModel}) async {
    try {
      final response =
          await taskApiClient.updateTask(taskId, updateTaskPostModel);
      return Right(response);
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  /// Method to update task in background
  /// Parameters
  /// [TaskId]
  /// [UpdateTaskPostModel]
  ///   /// ---> Returns [isolated_response.Response]
  @override
  Future<Either<Failure, isolated_response.Response>> updateTaskIsolated(
      {required String taskId,
      required UpdateTaskPostModel updateTaskPostModel}) async {
    try {
      final response = await isolatedHttpClient.put(
          host:
              "${ApiConstantUrl.formsflowaiBpmBaseUrl}${ApiConstantUrl.camundaEngineRest}/${ApiConstantUrl.task}/$taskId",
          body: updateTaskPostModel.toJson(),
          headers: APIUtils.getTaskAuthorizationHeader(
              acessToken: appPreferences.getAccessToken()));

      if (response.statusCode != FormsFlowAIAPIConstants.statusCode200 ||
          response.statusCode != FormsFlowAIAPIConstants.statusCode204) {
        return left(ServerFailure());
      }
      return Right(response);
    } catch (error) {
      return _handleDioError(error.runtimeType);
    }
  }

  @override
  Future<Either<Failure, void>> clearDatabaseData() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteTask({required TaskEntity task}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> fetchAllTasksFromLocalDb() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskEntity>> fetchTaskByIdFromLocalDb(
      {required String taskId}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TaskListingDM>>> fetchTasksFromLocalDb(
      {required String id, required int firstResult, required int maxResults}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> insertAllTasks(
      {required List<TaskEntity> tasks}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> insertTask({required TaskEntity task}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateTaskInLocalDB(
      {required TaskEntity task}) {
    throw UnimplementedError();
  }

  /// Method to submit form in the background
  /// Parameters
  /// [Id]
  /// [FormSubmissionPostModel]
  /// ---> Returns [BaseResponse]
  @override
  Future<Either<Failure, BaseResponse>> submitFormIsolated(
      {required String id,
      required FormSubmissionPostModel formSubmissionPostModel}) async {
    try {
      final response = await taskDio.post(
          '${ApiConstantUrl.camundaEngineRest}/${ApiConstantUrl.task}/$id/submit-form',
          data: json.encode(formSubmissionPostModel.toJson()));
      if (response != null &&
              response.statusCode == FormsFlowAIAPIConstants.statusCode200 ||
          response.statusCode == FormsFlowAIAPIConstants.statusCode204) {
        return Right(BaseResponse(
            statusCode: response.statusCode,
            message: FormsFlowAIAPIConstants.statusSuccessMessage));
      }
      return Left(ServerFailure());
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure());
    }
  }

  Left<Failure, T> _handleDioError<T>(Type runtimeType) {
    if (runtimeType == RefreshTokenExpiredException) {
      return Left(AuthorizationTokenExpiredFailure());
    }
    return Left(ServerFailure());
  }
}
