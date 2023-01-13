import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:formsflowai/core/router/app_routes.dart';
import 'package:formsflowai/presentation/features/assigntask/model/memebers_data_model.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/usecases/index.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/eventbusdm/socket_event_bus_data_model.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/update_post_model_transformation.dart';
import 'package:formsflowai/presentation/features/taskdetails/view/task_details_screen.dart';
import 'package:formsflowai/presentation/features/taskdetails/viewmodel/task_details_providers.dart';
import 'package:formsflowai_shared/widgets/datetimepicker/formsflowai_date_time_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/api/post/form/form_submission_post_model.dart';
import '../../../../core/api/response/task/details/task_group_response.dart';
import '../../../../core/api/utils/api_utils.dart';
import '../../../../core/database/entity/task_entity.dart';
import '../../../../core/database/worker/database_worker.dart';
import '../../../../core/error/errors_failure.dart';
import '../../../../core/module/providers/view_model_provider.dart';
import '../../../../core/networkmanager/network_manager_controller.dart';
import '../../../../core/preferences/app_preference.dart';
import '../../../../shared/app_strings.dart';
import '../../../../shared/formsflow_api_constants.dart';
import '../../../../shared/formsflow_app_constants.dart';
import '../../../../shared/toast/toast_message_provider.dart';
import '../../../../utils/database/database_query_util.dart';
import '../../../../utils/general_util.dart';
import '../../../../utils/router/router_utils.dart';
import '../../../base/viewmodel/base_notifier_view_model.dart';
import '../../home/tasklisting/model/index.dart';
import '../../home/tasklisting/model/task_listing_data_model.dart';
import '../../home/tasklisting/viewmodel/task_list_screen_providers.dart';
import '../../home/tasklisting/viewmodel/task_list_view_model.dart';
import '../model/index.dart';
import '../usecases/form/submit_form_usecase.dart';
import '../usecases/index.dart';
import '../view/addgroups/add_group_dialog.dart';

/// [TaskDetailsViewModel] ViewModel class contains business logic
/// related to [TaskDetailsScreen]
class TaskDetailsViewModel extends BaseNotifierViewModel {
  /// variable to hold riverpod reference
  final Ref ref;

  /// AppPreferences
  final AppPreferences appPreferences;

  // UseCases
  final FetchTaskVariablesUseCase fetchTaskVariablesUseCase;
  final FetchLocalTaskUseCase fetchLocalTaskUseCase;
  final UpdateRemoteTaskUseCase updateRemoteTaskUseCase;
  final DatabaseWorker databaseWorker;
  final FetchFormUseCase fetchFormUseCase;
  final ListTaskGroupsUseCase listTaskGroupsUseCase;
  final AddGroupsUseCase addGroupUseCase;
  final DeleteGroupsUseCase deleteGroupUseCase;
  final UpdateAssigneeUseCase updateAssigneeUseCase;
  final ClaimTaskUseCase claimTaskUseCase;
  final UnClaimTaskUseCase unClaimTaskUseCase;
  final FetchTaskUseCase fetchIsolatedTaskUseCase;
  final SubmitFormUseCase submitFormUseCase;

  /// Network manager to handle network connectivity
  final NetworkManagerController networkManagerController;

  /// Task info data model
  TaskInfoDM _taskInfoDM = TaskInfoDM();
  TaskInfoDM get taskInfoDM => _taskInfoDM;

  /// Task variables data model
  TaskVariableDM _taskVariablesDM = TaskVariableDM();

  /// Tab index
  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;
  //
  // ///  Private Variables
  // late InAppWebViewController formWebViewController;

  /// Selected Task from task listing screen
  TaskListingDM? _taskListingDM;
  TaskListingDM? get taskListingDM => _taskListingDM;

  /// Variable to show toast notifier
  ToastStateDM _toastStateDM = const ToastStateDM();
  ToastStateDM get toastStateDM => _toastStateDM;

  /// variable to hold task groups
  final List<TaskGroupsResponse> _taskGroupsList = <TaskGroupsResponse>[];
  List<TaskGroupsResponse> get taskGroupsList => _taskGroupsList;

  TaskDetailsViewModel(
      {required this.appPreferences,
      required this.fetchLocalTaskUseCase,
      required this.updateRemoteTaskUseCase,
      required this.fetchFormUseCase,
      required this.databaseWorker,
      required this.ref,
      required this.listTaskGroupsUseCase,
      required this.updateAssigneeUseCase,
      required this.addGroupUseCase,
      required this.deleteGroupUseCase,
      required this.networkManagerController,
      required this.claimTaskUseCase,
      required this.unClaimTaskUseCase,
      required this.fetchTaskVariablesUseCase,
      required this.submitFormUseCase,
      required this.fetchIsolatedTaskUseCase})
      : super();

  /// onInit method
  /// Parameters
  /// [TaskListingDM]
  void onInit({required TaskListingDM data}) {
    _taskListingDM = data;
    fetchTaskVariables(_taskListingDM);
    fetchUserGroups();
    _initSocketCallback();
  }

  /// Method to init socket callback
  void _initSocketCallback() {
    ref.listen<SocketEventBusDM>(socketCallbackProvider, (previous, next) {
      if (next.eventName != null && next.eventName!.isNotEmpty) {
        if (_taskListingDM?.taskId == next.taskId &&
            next.eventName == FormsFlowAIApiConstants.socketEventComplete) {
          if (_taskListingDM?.assignee ==
              appPreferences.getPreferredUserName()) {
            databaseWorker.deleteTaskFromLocalDb(
                taskId: _taskListingDM?.taskId);
          }
          _toastStateDM =
              _toastStateDM.copyWith(info: Strings.taskDetailsTaskCompleted);
          notifyListeners();
          ref.read(currentTaskCompletedSocketProvider.notifier).state = true;
        } else if (_taskListingDM?.taskId == next.taskId) {
          onReceiveChangedTaskDataFromSocket(
              taskId: next.taskId!, eventName: next.eventName!);
          ref
              .read(applicationHistoryTabViewModelProvider)
              .refreshApplicationHistoryInBackground();
        }
      }
    });
  }

  /// Function to receive data from socket
  /// Parameters
  /// [TaskId]
  /// [EventName]
  Future<void> onReceiveChangedTaskDataFromSocket(
      {required String taskId, required String eventName}) async {
    final fetchIsolatedTaskResponse = await fetchIsolatedTaskUseCase.call(
        params: FetchTaskParams(taskId: taskId));
    fetchIsolatedTaskResponse.fold((l) => {}, (response) async {
      if (response.statusCode == FormsFlowAIApiConstants.statusCode200 &&
          response.data.isNotEmpty) {
        var taskData = await compute(parseTaskIdResponse, response.data);
        _taskListingDM = _taskListingDM?.copyWith(
            assignee: taskData.assignee,
            dueDate: DatabaseQueryUtil.decode(taskData.due),
            followUp: DatabaseQueryUtil.decode(taskData.followUp));
        notifyListeners();
        // Call function to update claimed task data
        if (taskData.assignee == appPreferences.getPreferredUserName()) {
          ref.read(formsTabViewModelProvider).updateFormConfig(readOnly: false);
          await databaseWorker.insertClaimedTask(
              taskEntity: TaskListingDM.transformTaskEntity(taskListingDM!,
                  _taskInfoDM, _taskVariablesDM.formResourceId));
        } else {
          ref.read(formsTabViewModelProvider).updateFormConfig(readOnly: true);
        }
        await databaseWorker.deleteTaskFromLocalDb(
            taskId: _taskListingDM?.taskId ?? '');
      }
    });
  }

  /// Function to fetch task variables
  /// Parameters
  /// [TaskListingDM]
  Future<void> fetchTaskVariables(TaskListingDM? taskListingDM) async {
    if (_taskListingDM == null) {
      return;
    }
    final response = await fetchTaskVariablesUseCase.call(
        params: FetchTaskVariablesParams(taskId: taskListingDM?.taskId ?? ''));
    response.fold((error) {
      if (error is AuthorizationTokenExpiredFailure) {
        ref.read(authorizationExpiredFailureProvider.notifier).state = true;
      } else {
        ref.read(formsTabViewModelProvider).noFormResourceFound = true;
        ref.read(formsTabViewModelProvider).notifyListeners();
      }
    }, (value) {
      if (value.formResourceId != null) {
        _taskVariablesDM = value;
        _updateTaskInfoDM(taskListingDM!, value);
        ref.read(formsTabViewModelProvider).fetchFormsData();
      } else {
        ref.read(formsTabViewModelProvider).noFormResourceFound = true;
        ref.read(formsTabViewModelProvider).notifyListeners();
      }
    });
  }

  /// Function to update Task Info Data Model
  /// Parameters
  /// [TaskListingDM]
  /// [TaskVariableDM]
  void _updateTaskInfoDM(
      TaskListingDM taskListingDM, TaskVariableDM variablesResponse) {
    _taskInfoDM = TaskInfoDM.transform(taskListingDM, variablesResponse);
    ref.read(showTaskInfoProvider.notifier).state = true;
    notifyListeners();
  }

  /// Function to open Date Time Picker
  /// Parameters
  /// [TaskDetailsDateSelectorType]
  /// [BuildContext]
  Future<void> showDateTimePicker(
      {required TaskDetailsDateSelectorType dateSelectorType,
      required BuildContext context}) async {
    TaskEntity? task;
    final selectedDateTime =
        await FormsflowAIDateTimePicker.buildDateTimePicker(context: context);
    if (selectedDateTime != null) {
      if (dateSelectorType == TaskDetailsDateSelectorType.dueDate) {
        _taskListingDM = _taskListingDM?.copyWith(dueDate: selectedDateTime);
        notifyListeners();
      } else {
        _taskListingDM = _taskListingDM?.copyWith(followUp: selectedDateTime);
        notifyListeners();
      }
      if (_taskListingDM?.assignee == appPreferences.getPreferredUserName()) {
        final fetchTaskResponse = await fetchLocalTaskUseCase.call(
            params: FetchLocalTaskParams(taskId: _taskListingDM?.taskId ?? ''));
        fetchTaskResponse.fold((l) => updateTask(task: null), (data) {
          task = GeneralUtil.updateTaskDateTime(
              task: data,
              selectedDateTime: selectedDateTime,
              dateSelectorType: dateSelectorType);
        });
        updateTask(task: task);
      } else {
        updateTask(task: null);
      }
    }
  }

  /// Function to update task details to remote server
  /// Parameters
  /// [TaskEntity]
  Future<void> updateTask({required TaskEntity? task}) async {
    if (_taskListingDM == null) {
      return;
    }
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      showProgressLoading();
      updateRemoteTaskUseCase
          .call(
              params: UpdateRemoteTaskParams(
                  taskId: _taskListingDM?.taskId ?? '',
                  updateTaskPostModel: transformUpdateTaskPostModel(
                      taskListingDM: _taskListingDM!,
                      formDM: ref.read(formsTabViewModelProvider).formDM,
                      taskInfoDM: _taskInfoDM)))
          .then((value) {
        value.fold((l) {
          dismissProgressLoading();
          _toastStateDM =
              _toastStateDM.copyWith(error: Strings.taskDetailsTaskError);
          notifyListeners();
        }, (data) async {
          dismissProgressLoading();
          _toastStateDM =
              _toastStateDM.copyWith(info: Strings.taskDetailsTaskUpdated);
          notifyListeners();
          ref
              .read(taskListViewModelProvider)
              .updatedTaskDetails(taskListingDM: _taskListingDM!);
          if (task != null) {
            await databaseWorker.updateTaskInLocalDatabase(taskEntity: task);
          }
        });
      });
    } else {
      _toastStateDM =
          _toastStateDM.copyWith(info: Strings.taskDetailsTaskUpdatedOffline);
      notifyListeners();
      ref
          .read(taskListViewModelProvider)
          .updatedTaskDetails(taskListingDM: _taskListingDM!);
      if (task != null) {
        await databaseWorker.updateTaskInLocalDatabase(taskEntity: task);
      }
    }
  }

  /// Clear Selected Date
  /// Parameters
  /// [TaskDetailsDateSelectorType]
  Future<void> onRemovedTaskDate(
      {required TaskDetailsDateSelectorType dateSelectorType}) async {
    TaskEntity? task;
    if (_taskListingDM?.assignee == appPreferences.getPreferredUserName()) {
      final fetchTaskResponse = await fetchLocalTaskUseCase.call(
          params: FetchLocalTaskParams(taskId: _taskListingDM?.taskId ?? ''));

      fetchTaskResponse.fold((l) => {}, (data) {
        task = GeneralUtil.updateTaskDateTime(
            task: data,
            selectedDateTime: null,
            dateSelectorType: dateSelectorType);
      });
    }
    if (dateSelectorType == TaskDetailsDateSelectorType.dueDate) {
      _taskListingDM = _taskListingDM?.copyWith(dueDate: null);
      notifyListeners();
    } else {
      _taskListingDM = _taskListingDM?.copyWith(followUp: null);
      notifyListeners();
    }
    updateTask(task: task);
  }

  /// OnDispose ViewModel
  @override
  void dispose() {
    super.dispose();
    ref.read(showTaskInfoProvider.notifier).state = false;
    ref.read(formsTabViewModelProvider).clearProvider();
    ref.read(applicationHistoryTabViewModelProvider).resetProvider();
  }

  /// Function to update the selected tab index from the view
  /// Parameters
  /// [Index]
  void updateSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    switch (index) {
      case 0:
        if (ref.read(formsTabViewModelProvider).formIoModel.formComponents ==
            null) {
          fetchTaskVariables(_taskListingDM);
        }
        break;
      case 1:
        if (ref
            .read(applicationHistoryTabViewModelProvider)
            .applicationHistoryList
            .isEmpty) {
          ref
              .read(applicationHistoryTabViewModelProvider)
              .fetchApplicationHistory();
        }
        break;
      case 2:
        break;
    }
  }

  /// Function to get Groups from UseCase
  /// [Refresh]
  /// [HideProgress]
  Future<void> fetchUserGroups({bool? refresh, bool? hideProgress}) async {
    if (networkManagerController.connectionType == ConnectivityResult.none) {
      return;
    }
    //check if taskId is null if null return
    final taskId = _taskListingDM?.taskId;
    if (taskId == null) {
      return;
    }
    // if refresh is true clear the task grouplist
    if (refresh ?? false) {
      _taskGroupsList.clear();
    }
    // Fetch the added group list from remote
    final result = await listTaskGroupsUseCase.call(
        params: ListTaskGroupParams(taskId: _taskListingDM?.taskId ?? ''));
    result.fold((left) {}, (right) {
      _taskGroupsList.addAll(right);
      if (hideProgress ?? false) {
        dismissProgressLoading();
      }
      notifyListeners();
    });
  }

  /// Function to show Groups popup dialog view
  /// Parameters
  /// [BuildContext]
  void showAddGroupDialog({required BuildContext context}) {
    showDialog(
        context: context,
        useSafeArea: true,
        builder: (BuildContext ctx) {
          return const Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              body: AddGroupDialog());
        });
  }

  /// Function to claim the task
  Future<void> claimTask() async {
    String userId = "";
    userId = appPreferences.getPreferredUserName();

    final taskId = _taskListingDM?.taskId;
    if (taskId == null) {
      return;
    }
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      showProgressLoading();
      final claimTaskResponse = await claimTaskUseCase.call(
          params: ClaimTaskParams(
              taskId: taskId,
              payload: ApiUtils.fetchClaimTaskPostBody(userId: userId)));
      claimTaskResponse.fold((l) {
        dismissProgressLoading();
        if (l is AuthorizationTokenExpiredFailure) {
          ref.read(authorizationExpiredFailureProvider.notifier).state = true;
        } else {
          _toastStateDM = _toastStateDM.copyWith(
              error: Strings.taskDetailsErrorClaimFailed);
          notifyListeners();
        }
      }, (response) async {
        dismissProgressLoading();
        _toastStateDM =
            _toastStateDM.copyWith(info: Strings.taskDetailsLabelClaimSuccess);
        notifyListeners();
        _taskListingDM = _taskListingDM?.copyWith(
            assignee: appPreferences.getPreferredUserName());
        notifyListeners();
        ref.read(formsTabViewModelProvider).updateFormConfig(readOnly: false);
        ref
            .read(taskListViewModelProvider)
            .updatedTaskDetails(taskListingDM: _taskListingDM!);

        await databaseWorker.insertClaimedTask(
            taskEntity: TaskListingDM.transformTaskEntity(
                taskListingDM!, _taskInfoDM, _taskVariablesDM.formResourceId));
      });
    }
  }

  /// Function to assign the task to other member
  /// Parameters
  /// [ClaimedUserId]
  Future<void> assignTaskToOthers({required String claimedUserId}) async {
    String userId = "";
    userId = claimedUserId;

    final taskId = _taskListingDM?.taskId;
    if (taskId == null || _taskListingDM?.assignee == claimedUserId) {
      return;
    }
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      showProgressLoading();
      final claimTaskResponse = await updateAssigneeUseCase.call(
          params: UpdateAssigneeParams(
              taskId: taskId,
              payload: ApiUtils.fetchClaimTaskPostBody(userId: userId)));
      claimTaskResponse.fold((l) {
        dismissProgressLoading();
        if (l is AuthorizationTokenExpiredFailure) {
          ref.read(authorizationExpiredFailureProvider.notifier).state = true;
        } else {
          _toastStateDM = _toastStateDM.copyWith(
              error: Strings.taskDetailsErrorClaimFailed);
          notifyListeners();
        }
      }, (response) async {
        dismissProgressLoading();
        _toastStateDM = _toastStateDM.copyWith(
            info: "${Strings.taskDetailsAssignedTo} $claimedUserId");
        notifyListeners();
        if (_taskListingDM?.assignee == appPreferences.getPreferredUserName()) {
          ref.read(formsTabViewModelProvider).updateFormConfig(readOnly: false);
          ref
              .read(taskListViewModelProvider)
              .updatedTaskDetails(taskListingDM: _taskListingDM!);
          await databaseWorker.deleteTaskFromLocalDb(
              taskId: _taskListingDM?.taskId ?? '');
        }
        _taskListingDM = _taskListingDM?.copyWith(assignee: claimedUserId);
        notifyListeners();
        ref
            .read(taskListViewModelProvider)
            .updatedTaskDetails(taskListingDM: _taskListingDM!);
      });
    }
  }

  /// Function to unClaim the task
  Future<void> unClaimTask() async {
    final taskId = _taskListingDM?.taskId ?? '';
    if (taskId.isEmpty) {
      return;
    }
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      showProgressLoading();
      final unclaimTaskResponse = await unClaimTaskUseCase.call(
          params: UnClaimTaskParams(taskId: _taskListingDM?.taskId ?? ''));
      unclaimTaskResponse.fold((l) {
        dismissProgressLoading();
        if (l is AuthorizationTokenExpiredFailure) {
          ref.read(authorizationExpiredFailureProvider.notifier).state = true;
        } else {
          _toastStateDM = _toastStateDM.copyWith(
              error: Strings.taskDetailsErrorClaimFailed);
          notifyListeners();
        }
      }, (r) {
        dismissProgressLoading();
        clearAssignee(taskId: taskId);
        _toastStateDM = _toastStateDM.copyWith(
            info: Strings.taskDetailsLabelUnclaimSuccess);
        notifyListeners();
        ref.read(taskListViewModelProvider).refreshPageOnTaskUnClaimed();
      });
    }
  }

  /// Function to remove the assignee name from the task and to
  /// delete the task from local database on unclaiming of the task
  /// if the task is a self assigned task to the logged in user
  /// Parameters
  /// [TaskId]
  Future<void> clearAssignee({required String taskId}) async {
    _taskListingDM = _taskListingDM?.copyWith(assignee: null);
    notifyListeners();
    ref.read(formsTabViewModelProvider).updateFormConfig(readOnly: true);
    databaseWorker.deleteTaskFromLocalDb(taskId: taskId);
  }

  /// Function to handle onClick assign task button
  /// push to the assign task screen
  /// Parameters
  /// [BuildContext]
  Future<void> onClickAssignTaskButton({required BuildContext context}) async {
    RouterUtils.pushToRouteWithExtra(
        context: context,
        routeName: AppRoutes.assignTaskScreen,
        extra: _taskListingDM,
        params: {"taskId": _taskListingDM?.taskId ?? ''});
  }

  /// Callback function received from assign task screen
  /// when the task is being assigned to a different userId
  /// pass the selected member userid to the claim task function
  /// Parameters
  /// [MembersDM]
  void onAssignTaskSelectedMemberCallback({MembersDM? selectedMemberModel}) {
    assignTaskToOthers(claimedUserId: selectedMemberModel?.id ?? '');
  }

  /// Method to submit form
  /// Parameters
  /// [ActionType]
  Future<void> submitForm({required String actionType}) async {
    if (taskListingDM == null ||
        (taskListingDM != null && taskListingDM?.taskId == null) ||
        taskInfoDM.formUrl == null ||
        taskInfoDM.applicationId == null) {
      return;
    }
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      showProgressLoading();
      var response = await submitFormUseCase.call(
          params: SubmitFormParams(
              taskId: _taskListingDM!.taskId!,
              formSubmissionPostModel: FormSubmissionPostModel.transform(
                  formUrl: taskInfoDM.formUrl!,
                  applicationId: taskInfoDM.applicationId!,
                  actionType: actionType)));
      response.fold((l) {
        dismissProgressLoading();
      }, (r) {
        dismissProgressLoading();
        ref
            .read(taskListViewModelProvider)
            .onCurrentTaskCompleted(taskId: taskListingDM?.taskId);
        databaseWorker.deleteTaskFromLocalDb(
            taskId: taskListingDM?.taskId ?? '');
        ref.read(currentTaskCompletedSocketProvider.notifier).state = true;
      });
    }
  }

  // On go back to home page on offline form submission
  void goToHomePageOnOfflineSubmissionAction() {
    ref.read(currentTaskCompletedSocketProvider.notifier).state = true;
  }
}
