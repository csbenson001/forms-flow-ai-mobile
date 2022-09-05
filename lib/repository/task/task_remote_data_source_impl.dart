import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/model/task_base_response.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/model/task_listing_data_model.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/task_variable_dm.dart';
import 'package:formsflowai/repository/task/task_repository.dart';
import 'package:formsflowai_api/client/task/task_api_client.dart';
import 'package:formsflowai_api/client/user/user_api_client.dart';
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
import 'package:formsflowai_api/response/user/login/keycloak_login_response.dart';
import 'package:formsflowai_shared/core/database/entity/task_entity.dart';
import 'package:formsflowai_shared/core/preferences/app_preference.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:formsflowai_shared/shared/formsflow_api_constants.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:formsflowai_shared/utils/api/api_utils.dart';
import 'package:isolated_http_client/isolated_http_client.dart';
import 'package:isolated_http_client/src/response.dart' as isolatedResponse;

import '../../core/error/errors_failure.dart';
import '../../core/error/server_exception.dart';

class TaskRemoteDataSourceImpl implements TaskRepository {
  final TaskApiClient taskApiClient;
  final UserApiClient userApiClient;
  final AppPreferences appPreferences;
  final HttpClient isolatedHttpClient;

  TaskRemoteDataSourceImpl(
      {required this.taskApiClient,
      required this.appPreferences,
      required this.userApiClient,
      required this.isolatedHttpClient});

  /// Method to add group
  /// Parameters
  /// [TaskId]
  /// [AddGroupPostModel]
  @override
  Future<Either<Failure, void>> addGroup(
      {required String taskId,
      required AddGroupPostModel addGroupPostModel}) async {
    try {
      var response = await taskApiClient.addGroup(
          appPreferences.getBearerAccessToken(), taskId, addGroupPostModel);
      return Right(response.data);
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          // Check for the retry limit get data with the refresh token
          // var newTokenResponse = await _fetchNewToken();
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return addGroup(
          //       taskId: taskId, addGroupPostModel: addGroupPostModel);
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
    }
  }

  /// Method to claim task
  /// Parameters
  /// [TaskId]
  /// [Payload]
  @override
  Future<Either<Failure, void>> claimTask(
      {required String taskId, required Map<String, String> payload}) async {
    try {
      var response = await taskApiClient.claimTask(
          appPreferences.getBearerAccessToken(), taskId, payload);
      if (response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode200 ||
          response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode204) {
        return Right(response.data);
      }
      return Left(ServerFailure());
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          // // Check for the retry limit get data with the refresh token
          // var newTokenResponse = await _fetchNewToken();
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return claimTask(taskId: taskId, payload: payload);
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
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
      var response = await taskApiClient.deleteGroup(
          appPreferences.getBearerAccessToken(), taskId, addGroupPostModel);
      return Right(response.data);
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          // var newTokenResponse = await _fetchNewToken();
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return deleteGroup(
          //       taskId: taskId, addGroupPostModel: addGroupPostModel);
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
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
      var response = await taskApiClient
          .fetchFilters(appPreferences.getBearerAccessToken());
      return Right(response);
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          //   var newTokenResponse =
          //       await _fetchNewToken().onError((error, stackTrace) {
          //     print("------ Error ------");
          //     return Left(AuthorizationTokenExpiredFailure());
          //   });
          //   ;
          //   newTokenResponse.fold((l) {
          //     print("------ Error ------");
          //     print(l.toString());
          //     return Left(AuthorizationTokenExpiredFailure());
          //   }, (tokenResponse) {
          //     appPreferences.setAccessToken(tokenResponse.accessToken);
          //     appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //     return fetchFilters();
          //   });
          // } else {
          //   return Left(ServerFailure());
          // }
          return Left(AuthorizationTokenExpiredFailure());
        } else {
          return Left(ServerFailure());
        }
      } else {
        return Left(ServerFailure());
      }
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
      var response = await taskApiClient.fetchTaskGroups(
          appPreferences.getBearerAccessToken(), taskId);

      if (response.response.statusCode !=
          FormsFlowAIAPIConstants.statusCode200) {
        return left(ServerFailure());
      }
      return Right(response.data);
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          // var newTokenResponse = await _fetchNewToken();
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return fetchGroups(taskId: taskId);
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
    }
  }

  /// Method to fetch task variables
  /// Parameters
  /// ---> Returns [isolatedResponse.Response]
  @override
  Future<Either<Failure, isolatedResponse.Response>> fetchIsolatedTaskVariables(
      {required String host}) async {
    try {
      var response = await isolatedHttpClient.get(
          host: host,
          headers: APIUtils.getTaskAuthorizationHeader(
              acessToken: appPreferences.getAccessToken()));

      if (response.statusCode == FormsFlowAIAPIConstants.statusCode200 ||
          response.statusCode == FormsFlowAIAPIConstants.statusCode204) {
        return Right(response);
      }
      return left(ServerFailure());
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          // var newTokenResponse =
          //     await _fetchNewToken().onError((error, stackTrace) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // });
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return fetchIsolatedTaskVariables(host: host);
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
    }
  }

  /// Method to fetch members
  /// ---> Returns List[ListMembersResponse]
  @override
  Future<Either<Failure, List<ListMembersResponse>>> fetchMembers() async {
    try {
      var response = await taskApiClient.fetchMembersList(
          appPreferences.getBearerAccessToken(),
          "formsflow/formsflow-reviewer");

      if (response.response.statusCode !=
          FormsFlowAIAPIConstants.statusCode200) {
        return Left(ServerFailure());
      }

      return Right(response.data);
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          //   var newTokenResponse = await _fetchNewToken();
          //   newTokenResponse.fold((l) {
          //     return Left(AuthorizationTokenExpiredFailure());
          //   }, (tokenResponse) {
          //     appPreferences.setAccessToken(tokenResponse.accessToken);
          //     appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //     return fetchMembers();
          //   });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
    }
  }

  /// Method to fetch process definitions
  /// ---> Returns List[ProcessDefinitionResponse]
  @override
  Future<Either<Failure, List<ProcessDefinitionResponse>>>
      fetchProcessDefinitions() async {
    try {
      var response = await taskApiClient
          .fetchProcessDefinitions(appPreferences.getBearerAccessToken());

      return Right(response);
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          // var newTokenResponse = await _fetchNewToken();
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return fetchProcessDefinitions();
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
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
      var response = await taskApiClient.fetchTaskCount(
          appPreferences.getBearerAccessToken(), id);
      return Right(response);
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          //   var newTokenResponse = await _fetchNewToken();
          //   newTokenResponse.fold((l) {
          //     return Left(AuthorizationTokenExpiredFailure());
          //   }, (tokenResponse) {
          //     appPreferences.setAccessToken(tokenResponse.accessToken);
          //     appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //     return fetchTaskCount(id);
          //   });
          // }
          // return Left(ServerFailure());
          return Left(AuthorizationTokenExpiredFailure());
        } else {
          return Left(ServerFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    }
  }

  /// Method to fetch task variables
  /// Parameters
  /// [Id]
  /// ---> Returns [TaskVariableDM]
  @override
  Future<Either<Failure, TaskVariableDM>> fetchTaskVariables(
      {required String id}) async {
    try {
      var response = await taskApiClient.fetchTaskVariables(
          appPreferences.getBearerAccessToken(), id);
      return Right(TaskVariableDM.transform(response.data));
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          // var newTokenResponse = await _fetchNewToken();
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return fetchTaskVariables(id: id);
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
    }
  }

  /// Method to fetch task with isolate
  /// Parameters
  /// [TaskId]
  /// ---> Returns [isolatedResponse.Response]
  @override
  Future<Either<Failure, isolatedResponse.Response>> fetchTaskWithIsolate(
      {required String host, required String taskId}) async {
    try {
      var response = await isolatedHttpClient.get(
          host: host,
          path: taskId,
          headers: APIUtils.getTaskAuthorizationHeader(
              acessToken: appPreferences.getAccessToken()));
      return Right(response);
    } catch (e) {
      if (e is HttpClientException) {
        return Left(TaskNotFoundFailure());
      }
      return Left(ServerFailure());
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
      var data = await taskApiClient.fetchTasks(
          appPreferences.getBearerAccessToken(),
          // "application/hal+json",
          id,
          firstResult,
          maxResults,
          taskSortingPostModel);
      return Right(TaskBaseDataResponse.transform(data, definitionResponse));
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == 401) {
          // var newTokenResponse =
          //     await _fetchNewToken().onError((error, stackTrace) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // });
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return fetchTasks(id, firstResult, maxResults, taskSortingPostModel,
          //       definitionResponse);
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
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
      var response = await taskApiClient.submitForm(
          appPreferences.getBearerAccessToken(), id, formSubmissionPostModel);
      if (response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode200 ||
          response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode204) {
        return Right(BaseResponse(
            statusCode: response.response.statusCode,
            message: FormsFlowAIAPIConstants.statusSuccessMessage));
      }
      return Left(ServerFailure());
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          // var newTokenResponse = await _fetchNewToken();
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return submitForm(
          //       id: id, formSubmissionPostModel: formSubmissionPostModel);
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
    }
  }

  /// Methods to unclaim task
  /// Parameters
  /// [TaskId]
  @override
  Future<Either<Failure, void>> unClaimTask({required String taskId}) async {
    try {
      var response = await taskApiClient.unclaimTask(
          appPreferences.getBearerAccessToken(), taskId);
      if (response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode200 ||
          response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode204) {
        return Right(response.data);
      }
      return Left(ServerFailure());
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          // var newTokenResponse = await _fetchNewToken();
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return unClaimTask(taskId: taskId);
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
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
      var response = await taskApiClient.updateAssignee(
          appPreferences.getBearerAccessToken(), taskId, payload);
      if (response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode200 ||
          response.response.statusCode ==
              FormsFlowAIAPIConstants.statusCode204) {
        return Right(response.data);
      }
      return Left(ServerFailure());
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          // var newTokenResponse = await _fetchNewToken();
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return updateAssignee(taskId: taskId, payload: payload);
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
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
      var response = await taskApiClient.updateTask(
          appPreferences.getBearerAccessToken(), taskId, updateTaskPostModel);
      return Right(response);
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          // var newTokenResponse = await _fetchNewToken();
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return updateRemoteTask(
          //       taskId: taskId, updateTaskPostModel: updateTaskPostModel);
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
    }
  }

  /// Method to update task in background
  /// Parameters
  /// [TaskId]
  /// [UpdateTaskPostModel]
  ///   /// ---> Returns [isolatedResponse.Response]
  @override
  Future<Either<Failure, isolatedResponse.Response>> updateTaskWithIsolates(
      {required String url,
      required String taskId,
      required UpdateTaskPostModel updateTaskPostModel}) async {
    try {
      var response = await isolatedHttpClient.put(
          host: url,
          body: updateTaskPostModel.toJson(),
          headers: APIUtils.getTaskAuthorizationHeader(
              acessToken: appPreferences.getAccessToken()));

      if (response.statusCode != FormsFlowAIAPIConstants.statusCode200 ||
          response.statusCode != FormsFlowAIAPIConstants.statusCode204) {
        return left(ServerFailure());
      }
      return Right(response);
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == FormsFlowAIAPIConstants.statusCode401) {
          // var newTokenResponse = await _fetchNewToken();
          // newTokenResponse.fold((l) {
          //   return Left(AuthorizationTokenExpiredFailure());
          // }, (tokenResponse) {
          //   appPreferences.setAccessToken(tokenResponse.accessToken);
          //   appPreferences.setRefreshToken(tokenResponse.refreshToken);
          //   return updateTaskWithIsolates(
          //       url: url,
          //       taskId: taskId,
          //       updateTaskPostModel: updateTaskPostModel);
          // });
          return Left(AuthorizationTokenExpiredFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> clearDatabaseData() {
    // TODO: implement clearDatabaseData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteTask({required TaskEntity task}) {
    // TODO: implement deleteTask
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

  // Method to get the new access token with the refresh token

  Future<Either<Failure, KeyCloakLoginResponse>> _fetchNewToken() async {
    try {
      var response = await userApiClient.fetchNewToken(
          FormsFlowAIConstants.CLIENT_ID,
          FormsFlowAIConstants.CLIENT_SECRET_KEY,
          appPreferences.getRefreshToken(),
          FormsFlowAIConstants.TOKEN_GRANT_TYPE_REFRESH_TOKEN);
      return Right(response);
    } catch (e) {
      if (e is TypeError) {
        return Left(DataTypeFailure());
      } else if (e is DioError) {
        if (e.response?.statusCode == 400) {
          // Check for the retry limit get data with the refresh token
          return Left(DataTypeFailure());
        }
        return Left(ServerFailure());
      } else {
        return Left(ServerFailure());
      }
    }
  }

  /// Method to submit form in the background
  /// Parameters
  /// [Id]
  /// [FormSubmissionPostModel]
  /// ---> Returns [BaseResponse]
  @override
  Future<Either<Failure, BaseResponse>> submitFormIsolate(
      {required String id,
      required FormSubmissionPostModel formSubmissionPostModel}) async {
    try {
      var response = await isolatedHttpClient.post(
          host:
              "${ApiConstantUrl.FORMSFLOWAI_BASE_URL}${ApiConstantUrl.CAMUNDA_ENGINE_REST}/${ApiConstantUrl.TASK}/$id/submit-form",
          body: formSubmissionPostModel.toJson(),
          headers: APIUtils.getTaskAuthorizationHeader(
              acessToken: appPreferences.getAccessToken()));
      if (response.statusCode == FormsFlowAIAPIConstants.statusCode200 ||
          response.statusCode == FormsFlowAIAPIConstants.statusCode204) {
        return Right(BaseResponse(
            statusCode: response.statusCode,
            message: FormsFlowAIAPIConstants.statusSuccessMessage));
      }
      return Left(ServerFailure());
    } on SocketException {
      return left(NoConnectionFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
