import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:formsflowai/core/database/entity/task_entity.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/taskdetails/usecases/form/save_form_submission_isolate_usecase.dart';
import 'package:formsflowai/presentation/features/taskdetails/usecases/form/submit_form_isolate_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../presentation/features/home/tasklisting/model/task_listing_data_model.dart';
import '../../../presentation/features/home/tasklisting/usecases/index.dart';
import '../../../presentation/features/taskdetails/model/form_dm.dart';
import '../../../presentation/features/taskdetails/usecases/index.dart';
import '../../../shared/formsflow_api_constants.dart';
import '../../../shared/formsflow_app_constants.dart';
import '../../../utils/compute/app_compute_parse_json.dart';
import '../../../utils/general_util.dart';
import '../../api/post/form/form_submission_post_model.dart';
import '../../api/post/task/update_task_post_model.dart';
import '../../api/response/form/submission/form_submission_response.dart';
import '../../networkmanager/network_manager_controller.dart';
import '../../preferences/app_preference.dart';
import '../entity/form_entity.dart';

/// [DatabaseWorker] class to interact with the local data source
/// fetch, insert, update and delete local data source entities data
class DatabaseWorker {
  /// useCases
  final InsertAllTaskUseCase insertAllTaskUseCase;
  final FetchLocalAllTasksUseCase fetchLocalAllTasksUseCase;
  final FetchTaskVariablesIsolatedUseCase fetchIsolatedTaskVariablesUseCase;
  final FetchFormEntityUseCase fetchFormEntityUseCase;
  final FetchFormDataIsolatedUseCase fetchIsolatedFormDataUseCase;
  final InsertFormDataUseCase insertFormDataUseCase;
  final FetchFormSubmissionDataIsolatedUseCase
      fetchIsolatedFormSubmissionDataUseCase;
  final UpdateLocalTaskUseCase updateLocalTaskUseCase;
  final FetchTaskUseCase fetchIsolatedTaskUseCase;
  final DeleteLocalTaskUseCase deleteLocalTaskUseCase;
  final UpdateTaskIsolatedUseCase updateIsolatedTaskUseCase;
  final FetchLocalTaskUseCase fetchLocalTaskUseCase;
  final InsertLocalTaskUseCase insertLocalTaskUseCase;
  final SaveFormSubmissionIsolateUseCase saveFormSubmissionIsolateUseCase;
  final SubmitFormIsolateUseCase submitFormIsolateUseCase;

  /// Network Manager controller to check current connectivity
  /// status
  final NetworkManagerController networkManagerController;

  // App preferences to get session values
  final AppPreferences appPreferences;

  // Database Task list
  final _dbTaskList = <TaskEntity>[];

  DatabaseWorker(
      {required this.insertAllTaskUseCase,
      required this.fetchLocalAllTasksUseCase,
      required this.fetchIsolatedTaskVariablesUseCase,
      required this.fetchFormEntityUseCase,
      required this.fetchIsolatedFormDataUseCase,
      required this.insertFormDataUseCase,
      required this.fetchIsolatedFormSubmissionDataUseCase,
      required this.updateLocalTaskUseCase,
      required this.updateIsolatedTaskUseCase,
      required this.fetchIsolatedTaskUseCase,
      required this.deleteLocalTaskUseCase,
      required this.insertLocalTaskUseCase,
      required this.fetchLocalTaskUseCase,
      required this.networkManagerController,
      required this.saveFormSubmissionIsolateUseCase,
      required this.submitFormIsolateUseCase,
      required this.appPreferences});

  /// Method to insert all tasks in the local database
  /// Parameters
  /// [TaskListingDM]
  /// [FilterId] - User selected FilterId
  /// [AssigneeName] - Assignee Name
  /// if current local database list is empty insert all tasks
  /// else add non existing tasks into the local data source

  Future<void> insertTasksIntoLocalSource(
      {required List<TaskListingDM> data,
      required String filterId,
      required String assigneeName}) async {
    final transformedTasks =
        TaskListingDM.transformTaskEntities(data, filterId, assigneeName);
    // Check and update form variables
    // and submission Data
    if (_dbTaskList.isEmpty && transformedTasks.isNotEmpty) {
      await insertAllTaskUseCase.call(
          params: InsertAllTaskParams(tasks: transformedTasks));
      final tasks = await fetchLocalAllTasksUseCase.call(
          params: const FetchLocalAllTasksParams());
      tasks.fold((l) {
        return;
      }, (taskData) async {
        _dbTaskList.addAll(taskData);
        // call method to get form data
        fetchRemoteFormData();
      });
    } else if (transformedTasks.isNotEmpty) {
      for (var task in transformedTasks) {
        if (!_dbTaskList.contains(task) && task.taskId != null) {
          final taskEntityId = await insertLocalTaskUseCase.call(
              params: InsertLocalTaskParams(task: task));
          taskEntityId.fold((l) {}, (r) {
            task.id = r;
            _dbTaskList.add(task);
            fetchFormTaskData(task: task);
          });
        } else if (task.isFormSubmissionDataUpdated == null ||
            (task.isFormSubmissionDataUpdated != null &&
                task.isFormSubmissionDataUpdated == false)) {
          fetchFormTaskData(task: task);
        }
      }
    }
  }

  /// Method to fetch form data frrom remote
  void fetchRemoteFormData() {
    for (var element in _dbTaskList) {
      if (networkManagerController.connectionType != ConnectivityResult.none) {
        fetchFormTaskData(task: element);
      } else {
        break;
      }
    }
  }

  /// Method to fetch task from data and update local database
  /// Parameters
  /// [TaskEntity]
  Future<void> fetchFormTaskData({required TaskEntity task}) async {
    if (task.taskId == null) {
      return;
    }

    final fetchVariablesResponse = await fetchIsolatedTaskVariablesUseCase.call(
        params: FetchIsolatedTaskVariablesParams(taskId: task.taskId!));
    fetchVariablesResponse.fold((error) {}, (response) async {
      final variableResponse =
          await compute(parseTaskVariablesDataResponse, response.body);
      int applicationId = 0;
      if (variableResponse.applicationId?.value != null) {
        switch (variableResponse.applicationId?.value.runtimeType) {
          case int:
            applicationId = variableResponse.applicationId?.value ?? 0;
            break;
          case String:
            applicationId = int.parse(variableResponse.applicationId?.value);
        }
      }

      /// Get formId from the formUrl
      ///
      /// split the formUrl string with the path to
      /// get [FormResourceId] and [FormSubmissionId]
      String formUrl = variableResponse.formUrl?.value ?? '';

      List<String> formData = formUrl.split('/');
      String formResourceId = formData[4];
      if (formResourceId == FormsFlowAIConstants.formsFlowAiForm) {
        formResourceId = formData[5];
      }
      String formSubmissionId = formData[formData.length - 1];

      /// check if form data exists in local source
      if (!GeneralUtil.isStringEmpty(formResourceId)) {
        final formsFlowFormEntity = await fetchFormEntityUseCase.call(
            params: FetchFormEntityParams(formId: formResourceId));
        formsFlowFormEntity.fold((l) {}, (entity) async {
          if (entity == null) {
            try {
              final formsApiResponse = await fetchIsolatedFormDataUseCase.call(
                  params: FetchIsolatedFormDataParams(formId: formResourceId));
              formsApiResponse.fold((error) {}, (responseData) async {
                // Json decode to convert formData and insert in local source
                insertFormDataUseCase.call(
                    params: InsertFormDataParams(
                        formEntity: FormEntity.transformFormFromFormMap(
                            formId: formResourceId,
                            formMapResponse: responseData.body)));
              });
            } catch (e) {
              () {};
            }
          }
        });
        if (!GeneralUtil.isStringEmpty(formSubmissionId)) {
          // call method to fetch and update form submission data
          _fetchFormSubmissionAndUpdateTask(
              task: task,
              submissionDate: variableResponse.submissionDate?.value,
              applicationId: applicationId,
              formSubmissionId: formSubmissionId,
              applicationStatus: variableResponse.applicationStatus?.value,
              formResourceId: formResourceId,
              formUrl: formUrl);
        }
      }
    });
  }

  // Method to fetch form submission validating whether new form
  // submissionID is different from the existing submissionID in local source
  // and update it
  /// Parameters
  /// [TaskEntity]
  /// [ApplicationId]
  /// [FormSubmissionId]
  /// [ApplicationStatus]
  /// [FormResourceId]
  Future<void> _fetchFormSubmissionAndUpdateTask(
      {required TaskEntity task,
      int? applicationId,
      String? submissionDate,
      String? formSubmissionId,
      String? applicationStatus,
      String? formResourceId,
      required String formUrl}) async {
    bool isFormSubmissionUpdated = task.isFormSubmissionDataUpdated ?? false;
    String taskEntityFormSubmissionId = task.formSubmissionId ?? '';
    task.isFormDataUpdated = true;
    task.formResourceId = formResourceId;
    task.formApplicationId = applicationId ?? 0;
    task.formSubmissionDate = submissionDate ?? '';
    task.formSubmissionId = formSubmissionId;
    task.applicationStatus = applicationStatus ?? '';
    task.formUrl = formUrl;
    if (!isFormSubmissionUpdated ||
        task.formSubmissionId == null ||
        taskEntityFormSubmissionId != formSubmissionId) {
      final submissionUseCaseReponse =
          await fetchIsolatedFormSubmissionDataUseCase.call(
              params: FetchIsolatedFormSubmissionDataParams(
                  formResourceId: formResourceId ?? '',
                  formSubmissionId: formSubmissionId ?? '',
                  taskId: task.taskId ?? ''));
      submissionUseCaseReponse.fold((l) {
        task.formSubmissionData = null;
        updateLocalTaskUseCase.call(params: UpdateLocalTaskParams(task: task));
      }, (response) async {
        if (response.statusCode == 200 && response.body.isNotEmpty) {
          task.isFormDataUpdated = true;
          task.formResourceId = formResourceId;
          task.formApplicationId = applicationId ?? 0;
          task.formSubmissionDate = submissionDate ?? '';
          task.formSubmissionId = formSubmissionId;
          task.applicationStatus = applicationStatus ?? '';
          task.formUrl = formUrl;
          final data = response.body;
          final String encodedFormsComponents = json.encode(data);
          task.formSubmissionData = encodedFormsComponents;
          task.isFormSubmissionDataUpdated = true;
          updateLocalTaskUseCase.call(
              params: UpdateLocalTaskParams(task: task));
        }
      });
    }
  }

  /// Function validate whether task is available in remote server
  /// and check for any submissions online from the web
  /// Parameters
  /// [TaskEntity]
  Future<void> validateTaskDataWithRemote(
      {required List<TaskEntity> taskEntityList}) async {
    if (taskEntityList.isNotEmpty) {
      for (TaskEntity taskEntity in taskEntityList) {
        if (networkManagerController.connectionType !=
            ConnectivityResult.none) {
          try {
            final isolatedTaskResponse = await fetchIsolatedTaskUseCase.call(
                params: FetchTaskParams(taskId: taskEntity.taskId ?? ''));
            isolatedTaskResponse.fold((error) async {
              if (error is TaskNotFoundFailure) {
                var deleteTaskResponse = await deleteLocalTaskUseCase.call(
                    params: DeleteLocalTaskParams(task: taskEntity));
                deleteTaskResponse.fold((l) {}, (r) {
                  if (_dbTaskList.contains(taskEntity)) {
                    _dbTaskList.remove(taskEntity);
                  }
                });
              }
            }, (response) async {
              if (response.statusCode ==
                      FormsFlowAIApiConstants.statusCode200 ||
                  response.statusCode ==
                      FormsFlowAIApiConstants.statusCode204) {
                final taskListResponse =
                    await compute(parseTaskListDataResponse, response.data);
                if (taskListResponse.assignee != taskEntity.assignee) {
                  var deleteTaskResponse = await deleteLocalTaskUseCase.call(
                      params: DeleteLocalTaskParams(task: taskEntity));
                  deleteTaskResponse.fold((l) {}, (r) {
                    if (_dbTaskList.contains(taskEntity)) {
                      _dbTaskList.remove(taskEntity);
                    }
                  });
                } else {
                  await syncChangedTaskDataWithRemote(task: taskEntity);
                }
              } else if (response.statusCode ==
                  FormsFlowAIApiConstants.statusCode404) {
                var deleteTaskResponse = await deleteLocalTaskUseCase.call(
                    params: DeleteLocalTaskParams(task: taskEntity));
                deleteTaskResponse.fold((l) {}, (r) {
                  if (_dbTaskList.contains(taskEntity)) {
                    _dbTaskList.remove(taskEntity);
                  }
                });
              }
            });
          } catch (e) {
            () {};
          }
        } else {
          return;
        }
      }
    }
  }

  /// Method to start offline sync with the remote server to check
  /// for the completed tasks
  Future<void> startTasksOfflineSync() async {
    if (_dbTaskList.isNotEmpty) {
      _dbTaskList.clear();
    }
    final tasks = await fetchLocalAllTasksUseCase.call(
        params: const FetchLocalAllTasksParams());
    tasks.fold((l) {
      return;
    }, (data) {
      _dbTaskList.addAll(data);
      validateTaskDataWithRemote(taskEntityList: _dbTaskList);
    });
  }

  // Function to sync remote data with the local data source
  /// Parameters
  /// [TaskEntity]
  Future<void> syncChangedTaskDataWithRemote({required TaskEntity task}) async {
    if (task.isTaskDataChanged != null &&
        task.formResourceId != null &&
        task.isTaskDataChanged! &&
        task.isFormSubmissionDone == true) {
      final formEntityResponse = await fetchFormEntityUseCase.call(
          params: FetchFormEntityParams(formId: task.formResourceId!));
      formEntityResponse.fold((l) => {}, (formsflowForm) async {
        if (formsflowForm != null) {
          FormDM formDM = FormDM.transformFromFromData(formsflowForm);
          UpdateTaskPostModel updateTaskPostModel =
              UpdateTaskPostModel.transformUpdateTaskPostModelFromEntity(
                  task: task, formDM: formDM);
          var response = await updateIsolatedTaskUseCase.call(
              params: UpdateIsolatedTaskParams(
                  taskId: task.taskId!,
                  updateTaskPostModel: updateTaskPostModel));
          response.fold((l) {}, (r) {
            task.isTaskDataChanged = false;
            updateLocalTaskUseCase.call(
                params: UpdateLocalTaskParams(task: task));
          });
          await validateAndSubmitFormData(taskEntity: task);
        }
      });
    } else if (task.isTaskDataChanged != null &&
        task.formResourceId != null &&
        task.isTaskDataChanged! &&
        task.isFormSubmissionDone == false) {
      final formEntityResponse = await fetchFormEntityUseCase.call(
          params: FetchFormEntityParams(formId: task.formResourceId!));
      formEntityResponse.fold((l) => {}, (formsflowForm) async {
        if (formsflowForm != null) {
          FormDM formDM = FormDM.transformFromFromData(formsflowForm);
          UpdateTaskPostModel updateTaskPostModel =
              UpdateTaskPostModel.transformUpdateTaskPostModelFromEntity(
                  task: task, formDM: formDM);

          var response = await updateIsolatedTaskUseCase.call(
              params: UpdateIsolatedTaskParams(
                  taskId: task.taskId!,
                  updateTaskPostModel: updateTaskPostModel));
          response.fold((l) {}, (r) {
            task.isTaskDataChanged = false;
            updateLocalTaskUseCase.call(
                params: UpdateLocalTaskParams(task: task));
          });
        }
      });
    } else if (task.isFormSubmissionDone == true) {
      await validateAndSubmitFormData(taskEntity: task);
    }
  }

  /// Function to insert form details checking if it doesn't exists,
  /// in the local database
  /// Parameters
  /// [FormEntity]
  Future<void> insertFormDetails({required FormEntity formEntity}) async {
    if (formEntity.formId == null) {
      return;
    }
    String formResourceId = formEntity.formId!;
    fetchFormEntityUseCase
        .call(params: FetchFormEntityParams(formId: formResourceId))
        .then((value) {
      value.fold((l) {}, (formsFlowForm) async {
        /// check if form data is not available in the local database insert the form data
        if (formsFlowForm == null) {
          await insertFormDataUseCase.call(
              params: InsertFormDataParams(formEntity: formEntity));
        }
      });
    });
  }

  /// Function to update form submission data in the local database
  /// Parameters
  /// [FormSubmissionResponse]
  /// optional [TaskId]
  Future<void> updateFormSubmissionData(
      {required FormSubmissionResponse? submissionData,
      required String? taskId}) async {
    if (taskId == null || submissionData == null) {
      return;
    }
    fetchLocalTaskUseCase
        .call(params: FetchLocalTaskParams(taskId: taskId))
        .then((value) {
      value.fold((l) => {}, (task) {
        if (task != null &&
            (task.isFormSubmissionDone != null &&
                task.isFormSubmissionDone == false)) {
          try {
            final formData = json.encode(submissionData.toJson());
            task.formSubmissionData = formData;
            task.isFormSubmissionDataUpdated = true;
            updateLocalTaskUseCase.call(
                params: UpdateLocalTaskParams(task: task));
          } catch (e) {
            () {};
          }
        }
      });
    });
  }

  /// Function to delete the task from local database on unClaiming of the task
  /// Parameters
  /// optional [TaskId]
  Future<void> deleteTaskFromLocalDb({required String? taskId}) async {
    if (taskId == null) {
      return;
    }
    fetchLocalTaskUseCase
        .call(params: FetchLocalTaskParams(taskId: taskId))
        .then((taskData) {
      taskData.fold((l) => {}, (taskEntity) {
        if (taskEntity != null) {
          deleteLocalTaskUseCase
              .call(params: DeleteLocalTaskParams(task: taskEntity))
              .then((value) {
            value.fold((l) {
              return;
            }, (r) {
              if (_dbTaskList.contains(taskEntity)) {
                _dbTaskList.remove(taskEntity);
              }
            });
          });
        }
      });
    });
  }

  /// Method to update fetch task
  /// Parameters
  /// Optional [TaskListingDM]
  /// [Ref]
  void updateClaimedTaskData({
    required TaskListingDM? taskListingDM,
    required Ref ref,
  }) async {
    if (taskListingDM == null) {
      return;
    }
    final localTaskResponse = await fetchLocalTaskUseCase.call(
        params: FetchLocalTaskParams(taskId: taskListingDM.taskId ?? ''));
    localTaskResponse.fold((l) => {}, (task) async {
      if (task == null) {
        /// if self claimed task insert it into local data source
        insertLocalTaskUseCase
            .call(
                params: InsertLocalTaskParams(
                    task:
                        TaskListingDM.transformTaskEntitySingle(taskListingDM)))
            .then((value) {
          fetchLocalTaskUseCase
              .call(
                  params:
                      FetchLocalTaskParams(taskId: taskListingDM.taskId ?? ''))
              .then((value) {
            value.fold((l) => {}, (r) {
              if (r != null) {
                fetchFormTaskData(task: r);
              }
            });
          });
        });
      }

      /// If task exists and assignee name not matches delete the task from local data source
      else if (!GeneralUtil.isStringEmpty(task.taskId) &&
          taskListingDM.assignee == appPreferences.getPreferredUserName()) {
        task.dueDate = taskListingDM.dueDate;
        task.followUp = taskListingDM.followUp;
        await updateLocalTaskUseCase.call(
            params: UpdateLocalTaskParams(task: task));
      } else if (!GeneralUtil.isStringEmpty(task.taskId) &&
          taskListingDM.assignee != appPreferences.getPreferredUserName()) {
        deleteLocalTaskUseCase
            .call(params: DeleteLocalTaskParams(task: task))
            .then((value) {
          value.fold((l) {}, (r) {
            if (_dbTaskList.contains(task)) {
              _dbTaskList.remove(task);
            }
          });
        });
      }
    });
  }

  /// Method to update local task
  /// Input parameters
  /// [TaskId]
  /// optional Nullable [FormSubmissionResponse]
  Future<void> updateTaskFormSubmissionDataInLocalDatabase(
      {required String taskId,
      FormSubmissionResponse? formSubmissionResponse,
      String? formActionType}) async {
    if (formSubmissionResponse == null) {
      return;
    }

    final fetchTaskResponse = await fetchLocalTaskUseCase.call(
        params: FetchLocalTaskParams(taskId: taskId));
    fetchTaskResponse.fold((l) {
      return;
    }, (taskEntity) async {
      if (taskEntity != null) {
        taskEntity.formSubmissionData = jsonEncode(formSubmissionResponse);
        taskEntity.isFormSubmissionDone = true;
        taskEntity.formSubmissionActionType = formActionType;
        updateTaskInLocalDatabase(taskEntity: taskEntity);
      }
    });
  }

  /// Method to update local task
  /// Input parameters
  /// optional Nullable [TaskEntity]
  Future<void> updateTaskInLocalDatabase({TaskEntity? taskEntity}) async {
    if (taskEntity == null) {
      return;
    }

    await updateLocalTaskUseCase.call(
        params: UpdateLocalTaskParams(task: taskEntity));
  }

  /// Function to insert task into local database
  /// Input parameters
  /// optional Nullable [TaskEntity]
  Future<void> insertClaimedTask({TaskEntity? taskEntity}) async {
    if (taskEntity == null) {
      return;
    }
    var taskEntityIdResponse = await insertLocalTaskUseCase.call(
        params: InsertLocalTaskParams(task: taskEntity));
    taskEntityIdResponse.fold((l) {
      return;
    }, (r) async {
      var localTaskResponse = await fetchLocalTaskUseCase.call(
          params: FetchLocalTaskParams(taskId: taskEntity.taskId ?? ''));
      localTaskResponse.fold((l) {
        return;
      }, (r) {
        if (r != null) {
          _dbTaskList.add(r);
          fetchFormTaskData(task: r);
        }
      });
    });
  }

  /// Method to check and submit form data if there are any offline
  /// saved form submissions available
  /// Input parameters
  /// optional Nullable [TaskEntity]
  Future<void> validateAndSubmitFormData({TaskEntity? taskEntity}) async {
    if (taskEntity == null ||
        taskEntity.taskId == null ||
        taskEntity.formSubmissionData == null) {
      return;
    }
    var formSubmissionModel = FormSubmissionPostModel.transform(
        formUrl: taskEntity.formUrl!,
        applicationId: taskEntity.formApplicationId ?? 0,
        actionType: taskEntity.formSubmissionActionType);
    Map<String, dynamic> data = jsonDecode(taskEntity.formSubmissionData!);
    FormSubmissionResponse formSubmissionResponse =
        FormSubmissionResponse.fromJson(data);
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      var response = await saveFormSubmissionIsolateUseCase.call(
          params: SaveFormSubmissionIsolateParams(
        formSubmissionResponse: formSubmissionResponse,
        formResourceId: taskEntity.formResourceId ?? '',
        formSubmissionId: taskEntity.formSubmissionId ?? '',
      ));
      response.fold((l) {}, (response) async {
        var response = await submitFormIsolateUseCase.call(
            params: SubmitFormIsolateParams(
                taskId: taskEntity.taskId!,
                formSubmissionPostModel: formSubmissionModel));
        response.fold((l) {}, (r) {
          if (_dbTaskList.contains(taskEntity)) {
            _dbTaskList.remove(taskEntity);
          }
          deleteTaskFromLocalDb(taskId: taskEntity.taskId ?? '');
        });
      });
    }
  }
}
