import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:formsflowai/core/database/worker/database_worker.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/core/router/app_routes.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/viewmodel/task_list_screen_providers.dart';
import 'package:formsflowai_api/post/task/tasklist_sort.dart';
import 'package:formsflowai_api/response/filter/get_filters_response.dart';
import 'package:formsflowai_api/response/processdefinition/process_definition_response.dart';
import 'package:formsflowai_api/response/task/tasklist/task_list_response.dart';
import 'package:formsflowai_shared/core/base/base_notifier_view_model.dart';
import 'package:formsflowai_shared/core/networkmanager/internet_connectivity_provider.dart';
import 'package:formsflowai_shared/core/networkmanager/network_manager_controller.dart';
import 'package:formsflowai_shared/core/preferences/app_preference.dart';
import 'package:formsflowai_shared/core/services/socket_service.dart';
import 'package:formsflowai_shared/shared/app_status.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/formsflow_api_constants.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:formsflowai_shared/shared/task_constants.dart';
import 'package:formsflowai_shared/utils/form/jwttoken/jwt_token_util.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../shared/toast/toast_message_provider.dart';
import '../../../../../utils/database/database_query_util.dart';
import '../../../../../utils/general_util.dart';
import '../../../taskdetails/usecases/index.dart';
import '../../../taskdetails/viewmodel/task_details_providers.dart';
import '../model/index.dart';
import '../usecases/index.dart';

/// [TaskListViewModel] viewmodel class to hold bussiness logic related to
/// task list screen
class TaskListViewModel extends BaseNotifierViewModel {
  Ref ref;
  // pagination Count
  var _start = 0;
  final _limit = 15;

  // flag to check whether has next page
  var _hasNextPage = true;

  // init Scroll controller
  late ScrollController scrollController;

  // Use cases
  final FetchFiltersUseCase fetchFiltersUseCase;
  final FetchProcessDefinitionUseCase fetchProcessDefinitionUseCase;
  final FetchTasksUseCase fetchTasksUseCase;
  final FetchTaskCountUseCase fetchTaskCountUseCase;
  final FetchIsolatedTaskUseCase fetchIsolatedTaskUseCase;
  final ClearLocalDatabaseUseCase clearLocalDatabaseUseCase;

  final AppPreferences appPreferences;
  final NetworkManagerController networkManagerController;
  final SocketService socketService;
  final DatabaseWorker databaseWorker;

  /// List[Sorting] sort post model list
  List<Sorting> sortPostModel = List.empty(growable: true);
  TaskSortPostModel taskSortPostModel = TaskSortPostModel();

  // list to show available sort filters with the state filters
  final List<TaskSortFilterDM> _uiSortFiltersList = [];
  List<TaskSortFilterDM> get uiSortFiltersList => _uiSortFiltersList;

  // list to show available selected sort list
  final List<TaskSortFilterDM> _selectedSortFilterList = [];
  List<TaskSortFilterDM> get selectedSortFilterList => _selectedSortFilterList;

  // static list to show available variable filters
  final List<dynamic> _uiVariablesFiltersList = TaskConstants.searchData;
  List<dynamic> get uiVariablesFiltersList => _uiVariablesFiltersList;

  // Selected Variable Filters List
  final List<TaskVariableFilterDM> _selectedVariablesFiltersList =
      <TaskVariableFilterDM>[];
  List<TaskVariableFilterDM> get selectedVariablesFiltersList =>
      _selectedVariablesFiltersList;

  // Selected Variable Filters List
  List<TaskSelectedVariablesCountDM> _selectedVariableCountList =
      <TaskSelectedVariablesCountDM>[];
  List<TaskSelectedVariablesCountDM> get selectedVariableCountList =>
      _selectedVariableCountList;

  final _selectedCheckBoxList = <String>[];
  List<String> get selectedCheckBoxList => _selectedCheckBoxList;

  // Tasks List
  List<TaskListingDM> _taskList = List.empty(growable: true);
  List<TaskListingDM> get taskList => _taskList;

  // Selected sort filter item
  FiltersResponse _selectedSortFilterItemProvider = FiltersResponse(id: "");
  FiltersResponse get selectedSortFilterItem => _selectedSortFilterItemProvider;

  // Process Definition Response
  List<ProcessDefinitionResponse> _processDefinitionResponse = [];
  List<ProcessDefinitionResponse> get processDefinitionResponse =>
      _processDefinitionResponse;

  // Initial
  bool isInitialApiCalled = false;

  ToastStateDM _toastStateDM = ToastStateDM();
  ToastStateDM get toastStateDM => _toastStateDM;

  TaskListViewModel(
      {required this.fetchFiltersUseCase,
      required this.fetchProcessDefinitionUseCase,
      required this.fetchTasksUseCase,
      required this.fetchTaskCountUseCase,
      required this.databaseWorker,
      required this.socketService,
      required this.appPreferences,
      required this.networkManagerController,
      required this.fetchIsolatedTaskUseCase,
      required this.clearLocalDatabaseUseCase,
      required this.ref});

  /// OnInit method to initialise listeners and to fetch initial data
  Future<void> onInit({required ScrollController scrollController}) async {
    this.scrollController = scrollController;
    _startLocalDatabaseRemoteSync();
    generateFormioToken();
    fetchFilters();
    scrollController.addListener(_onScroll);
    _initWebSocket();
    _initInternetNetworkCallback();
    _uiSortFiltersList.addAll(TaskSortFilterDM.getSortFilters());
  }

  /// onDispose View model
  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(_onScroll);
  }

  /// Function to add sorted items to selected list
  void addSortItemToList() {
    _selectedSortFilterList.clear();
    for (var element in _uiSortFiltersList) {
      if (element.isSelected) {
        _selectedSortFilterList.add(element);
      }
    }
    notifyListeners();
    resetTaskSortPostModel();
    refreshPageData();
  }

  /// Function to build filter dropdown items
  List<DropdownMenuItem<Object?>> buildFilterDropdownItems(
      List<FiltersResponse> testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i.name!),
        ),
      );
    }
    return items;
  }

  /// Function to clear all selected variable filters
  void clearAllSelectedVariableFilters() {
    _selectedVariablesFiltersList.clear();
    _selectedVariableCountList.clear();
    _selectedCheckBoxList.clear();
    notifyListeners();
    updateFiltersPostModelAndRefreshPage();
  }

  /// Function to delete sort item from the selected sort list
  /// Input Parameters
  /// [Index]
  void deleteSortItemFromList(int index) {
    if (_selectedSortFilterList.length > 1) {
      TaskSortFilterDM dm = _selectedSortFilterList[index];
      try {
        _uiSortFiltersList
            .where((element) => element.sortLabel == dm.sortLabel)
            .single
            .isSelected = false;
        _selectedSortFilterList.removeAt(index);
        notifyListeners();
        resetTaskSortPostModel();
        refreshPageData();
      } catch (e) {}
    }
  }

  /// Function to delete filter from the selected filter list
  /// Input Parameters
  /// [TaskVariableFilterDM]
  /// [Index]
  void deleteSelectedVariableFilter(TaskVariableFilterDM dm, int index) {
    if (_selectedVariablesFiltersList.length > index) {
      try {
        _selectedVariablesFiltersList.removeAt(index);
        notifyListeners();
        updateFiltersPostModelAndRefreshPage();
      } catch (e) {}
    }
  }

  /// Function to enable variable editing
  /// Input Parameters
  /// [TaskVariableFilterDM]
  /// [Index]
  void enableVariableFilterEditing(TaskVariableFilterDM dm, int index) {
    if (_selectedVariablesFiltersList.length > index) {
      _selectedVariablesFiltersList[index].enableEditing = true;
      notifyListeners();
    }
  }

  /// Function to fetch filters
  Future<void> fetchFilters() async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(taskVariablesLoadingProvider.notifier).state =
          PageStatus.loading;
      ref.read(taskLoadingProvider.notifier).state = PageStatus.loading;
    });
    fetchFiltersUseCase.call(params: FetchFiltersParams()).then((value) {
      value.fold((l) {
        ref.read(taskVariablesLoadingProvider.notifier).state =
            PageStatus.failure;
        ref.read(taskLoadingProvider.notifier).state = PageStatus.failure;
        if (l is AuthorizationTokenExpiredFailure) {
          ref.read(authorizationExpiredFailureProvider.notifier).state = true;
        }
      }, (r) {
        setFilterData(r);
        final selectedFilterItem = getAllTasksFilterId(r);
        ref.read(taskVariablesLoadingProvider.notifier).state =
            PageStatus.success;
        if (selectedFilterItem != null &&
            !GeneralUtil.isStringEmpty(selectedFilterItem.id)) {
          _selectedSortFilterItemProvider = selectedFilterItem;
          fetchTasks(filterId: selectedFilterItem.id ?? '', refresh: false);
          fetchTaskCount(filterId: selectedFilterItem.id);
        }
      });
    }).onError((error, stackTrace) {
      ref.read(taskVariablesLoadingProvider.notifier).state =
          PageStatus.failure;
      ref.read(taskLoadingProvider.notifier).state = PageStatus.failure;
    });
  }

  // Function to get process definitions
  Future<void> fetchProcessDefinitions() async {
    if (_processDefinitionResponse.isEmpty) {
      final response = await fetchProcessDefinitionUseCase.call(
          params: FetchProcessDefinitionParams());
      response.fold((l) {}, (r) {
        _processDefinitionResponse = r;
      });
    }
  }

  /// Function to fetch tasks from local/remote based on internet connectivity
  /// Input Parameters
  /// optional [FilterId]
  /// optional [Refresh]
  Future<void> fetchTasks(
      {required String? filterId, required bool? refresh}) async {
    if (filterId == null || filterId.isEmpty) {
      return;
    }
    if (networkManagerController.connectionType != ConnectivityResult.none &&
        _processDefinitionResponse.isEmpty) {
      await fetchProcessDefinitions();
    }
    if (refresh ?? false) {
      _start = 0;
      _hasNextPage = true;
      _taskList.clear();
    }
    if (_taskList.isEmpty) {
      ref.read(taskLoadingProvider.notifier).state = PageStatus.loading;
    } else {
      ref.read(taskLoadingProvider.notifier).state = PageStatus.loadingMore;
    }
    final taskResponse = await fetchTasksUseCase.call(
        params: FetchTaskParams(
            id: filterId ?? '',
            firstResult: _start,
            maxResults: _limit,
            definitionResponse: _processDefinitionResponse,
            taskSortingPostModel: taskSortPostModel));

    taskResponse.fold((l) {
      ref.read(taskLoadingProvider.notifier).state = PageStatus.failure;
      if (l is AuthorizationTokenExpiredFailure) {
        ref.read(authorizationExpiredFailureProvider.notifier).state = true;
      }
    }, (data) {
      _taskList.addAll(data.taskData ?? []);
      _hasNextPage = data.taskData?.isNotEmpty ?? false;
      _start = _start + _limit;
      ref.read(taskLoadingProvider.notifier).state = PageStatus.success;
      notifyListeners();
      if (networkManagerController.connectionType != ConnectivityResult.none) {
        databaseWorker.insertTasksIntoLocalSource(
            data: data.taskData ?? [],
            filterId: filterId ?? '',
            assigneeName: appPreferences.getPreferredUserName());
      }
      if (!isInitialApiCalled) {
        isInitialApiCalled = true;
      }
    });
  }

  /// Function to get task count from local/remote based on internet
  /// connectivity
  /// Input Parameters
  /// optional[FilterId]
  void fetchTaskCount({String? filterId}) {
    if (GeneralUtil.isStringEmpty(filterId)) {
      return;
    }
    ref.read(taskCountProvider.notifier).updateState(isLoading: true);
    fetchTaskCountUseCase
        .call(params: FetchTaskCountParams(filterId: filterId!))
        .then((value) {
      value.fold((l) {
        ref
            .read(taskCountProvider.notifier)
            .updateState(count: 0, isLoading: false);
        if (l is AuthorizationTokenExpiredFailure) {
          ref.read(authorizationExpiredFailureProvider.notifier).state = true;
        }
      }, (data) {
        ref
            .read(taskCountProvider.notifier)
            .updateState(count: data.count, isLoading: false);
      });
    });
  }

  // Function to fetch selected variables in task list screen
  void fetchSelectedVariableList() {
    if (_selectedVariableCountList.isNotEmpty) {
      _selectedVariableCountList.clear();
    }
    List<TaskSelectedVariablesCountDM> mData = List.empty(growable: true);
    for (int j = 0; j < _uiVariablesFiltersList.length; j++) {
      TaskSelectedVariablesCountDM dm = TaskSelectedVariablesCountDM();
      dm.label = _uiVariablesFiltersList[j]['label'];
      int count = getAddedVariableCount(_uiVariablesFiltersList[j]);
      dm.count = count;
      if (count > 0) {
        mData.add(dm);
      }
    }
    if (mData.isNotEmpty) {
      _selectedVariableCountList = mData;
      notifyListeners();
    }
  }

  /// Function to get allTasks filterId which will be the default id on page load
  /// Input Parameters
  /// List[FiltersResponse]
  /// ---> Returns optional[FiltersResponse]
  FiltersResponse? getAllTasksFilterId(List<FiltersResponse> filterList) {
    FiltersResponse? filtersResponse;
    for (int i = 0; i < filterList.length; i++) {
      if (filterList[i].name!.toLowerCase() ==
          FormsFlowAIAPIConstants.ALL_TASKS.toLowerCase()) {
        filtersResponse = filterList[i];
        break;
      }
    }
    return filtersResponse;
  }

  // Function to generate token if not added or expired
  void generateFormioToken() {
    if (!appPreferences.isJwtTokenAdded()) {
      // Create a json web token
      List<String> roles = List.empty(growable: true);
      roles.add(FormsFlowAIAPIConstants.ROLE_ID);
      appPreferences.setFormJWtToken(JwtTokenUtils.signJwtToken(
          FormsFlowAIAPIConstants.FORM_ID, roles, ''));
      appPreferences.setJwtTokenAdded(true);
    }
  }

  /// Function to get task post model
  /// ---> Returns List[Sorting]
  List<Sorting> getTaskPostModel() {
    List<Sorting> mData = List.empty(growable: true);
    for (TaskSortFilterDM dm in _selectedSortFilterList) {
      mData.add(Sorting(
          label: dm.sortLabel,
          sortOrder: dm.sortOrder,
          sortBy: dm.sortByValue));
    }
    return mData;
  }

  /// Method to get selected sort item count should be set to 1 minimum
  /// Input Parameters
  /// List[TaskSortFilterDM]
  /// ---> Returns [Count]
  int getSelectedItemCount(List<TaskSortFilterDM> uiSortFiltersList) {
    int count = 0;
    for (var element in uiSortFiltersList) {
      if (element.isSelected) {
        count = count + 1;
      }
    }
    return count;
  }

  /// Function to get added variable count
  /// Input Parameters
  /// [T]
  /// ---> Returns [Count]
  int getAddedVariableCount(dynamic dm) {
    int count = 0;
    for (int i = 0; i < _selectedVariablesFiltersList.length; i++) {
      if (_selectedVariablesFiltersList[i].key == dm['key']) {
        count = count + 1;
      }
    }
    return count;
  }

  // Function to start offline sync and to validate completed tasks
  void _startLocalDatabaseRemoteSync() {
    databaseWorker.startTasksOfflineSync();
  }

  /// Function to listen to connectivity toast
  /// if there is an internet change reload the page data
  void _initInternetNetworkCallback() {
    ref.listen<ConnectivityResult>(internetConnectivityProvider,
        (previous, next) {
      if (isInitialApiCalled) {
        refreshPageData();
        if (next == ConnectivityResult.none) {
          socketService.deActivateSocket();
        } else {
          _initWebSocket();
          _startLocalDatabaseRemoteSync();
        }
      }
    });
  }

  /// Function to initialise web socket
  void _initWebSocket() {
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      socketService.activateSocket();
      socketService.setCallback(callback: (String taskId, String eventName) {
        ref.read(socketCallbackProvider.notifier).state = ref
            .read(socketCallbackProvider.notifier)
            .state
            .copyWith(taskId: taskId, eventName: eventName);
        if (eventName == FormsFlowAIAPIConstants.socketEventComplete) {
          removeCompletedTaskItem(taskId: taskId);
        } else {
          onReceiveChangedTaskDataFromSocket(
              taskId: taskId, eventName: eventName);
        }
      });
    }
  }

  /// Function to delete completed task item from the list
  /// Input Parameters
  /// [TaskId]
  void removeCompletedTaskItem({String? taskId}) {
    if (taskId == null) {
      return;
    }
    int index = FormsFlowAIConstants.NO_POSITION;
    index = _taskList.indexWhere((element) => element.taskId == taskId);

    if (index != FormsFlowAIConstants.NO_POSITION) {
      try {
        _taskList.removeAt(index);
        notifyListeners();
        int currentTaskCount =
            ref.read(taskCountProvider.notifier).state.count ?? 0;
        if (currentTaskCount > 0) {
          ref
              .read(taskCountProvider.notifier)
              .updateState(count: currentTaskCount - 1, isLoading: false);
        }
      } catch (e) {}
    }
  }

  /// Function to fetch changed task data from socket
  /// Input Parameters
  /// [TaskId]
  /// [EventName]
  Future<void> onReceiveChangedTaskDataFromSocket(
      {required String? taskId, required String? eventName}) async {
    if (taskId == null) {
      return;
    }
    int index = FormsFlowAIConstants.NO_POSITION;
    final fetchIsolatedTaskResponse = await fetchIsolatedTaskUseCase.call(
        params: FetchIsolatedTaskParams(taskId: taskId));
    fetchIsolatedTaskResponse.fold((l) => {}, (response) async {
      if (response.statusCode == FormsFlowAIAPIConstants.statusCode200 &&
          response.body.isNotEmpty) {
        var taskData = await compute(parseTaskIdResponse, response.body);
        index = _taskList.indexWhere((element) => element.taskId == taskId);
        if (eventName == FormsFlowAIAPIConstants.socketEventUpdate &&
            index != FormsFlowAIConstants.NO_POSITION) {
          _taskList[index] = _taskList[index].copyWith(
              assignee: taskData.assignee,
              dueDate: DatabaseQueryUtil.decode(taskData.due),
              followUp: DatabaseQueryUtil.decode(taskData.followUp));
          notifyListeners();
          // Call function to update claimed task data
          if (taskData.assignee == appPreferences.getPreferredUserName()) {
            databaseWorker.updateClaimedTaskData(
                taskListingDM: _taskList[index], ref: ref);
          } else {
            databaseWorker.deleteTaskFromLocalDb(taskId: taskId);
          }
        } else if (eventName == FormsFlowAIAPIConstants.socketEventCreate) {
          _taskList.insert(
              0,
              TaskListingDM.transformSingle(
                  taskData, _processDefinitionResponse));
          notifyListeners();
          int currentTaskCount =
              ref.read(taskCountProvider.notifier).state.count ?? 0;
          ref
              .read(taskCountProvider.notifier)
              .updateState(count: currentTaskCount + 1, isLoading: false);
        }
      }
    });
  }

  /// Function to logout User
  /// Clear all database and preferences values then logout the user
  /// Input Parameters
  /// [BuildContext]
  Future<void> logoutUser({required BuildContext context}) async {
    final clearDatabaseResponse = await clearLocalDatabaseUseCase.call(
        params: const ClearLocalDatabaseUseCaseParams());
    clearDatabaseResponse.fold((l) {
      appPreferences.clear();
      RouterUtils.logoutUser(
          context: context, routeName: AppRoutes.loginScreen);
    }, (r) {
      appPreferences.clear();
      RouterUtils.logoutUser(
          context: context, routeName: AppRoutes.loginScreen);
    });
  }

  /// Function to update selected sort filter dropdown
  /// Input Parameters
  /// [T]
  void onChangeDropdown(dynamic selectedItem) {
    _selectedSortFilterItemProvider = selectedItem;
    refreshPageData();
  }

  /// Load more scroll listener to fetch paginated data
  void _onScroll() {
    if (_hasNextPage == true &&
        ref.read(taskLoadingProvider) != PageStatus.loadingMore &&
        scrollController.position.extentAfter < 300) {
      fetchTasks(
          filterId: _selectedSortFilterItemProvider.id ?? '', refresh: false);
    }
    if (scrollController.offset < 100) {
      ref.read(showHideFloatingActionButtonProvider.notifier).state = false;
    } else if (!ref.read(showTaskVariablesViewProvider) &&
        scrollController.offset > 200) {
      ref.read(showHideFloatingActionButtonProvider.notifier).state = true;
    } else if (scrollController.offset > 400) {
      ref.read(showHideFloatingActionButtonProvider.notifier).state = true;
    }
  }

  /// Function to refresh page data
  void refreshPageData() {
    fetchTasks(filterId: _selectedSortFilterItemProvider.id, refresh: true);
    fetchTaskCount(filterId: _selectedSortFilterItemProvider.id);
  }

  /// Function to handle pull to refresh
  Future<void> pullToRefresh() async {
    fetchTasks(filterId: _selectedSortFilterItemProvider.id, refresh: true);
    fetchTaskCount(filterId: _selectedSortFilterItemProvider.id);
  }

  /// Function to clear and reset task sort post model
  void resetTaskSortPostModel() {
    sortPostModel.clear();
    sortPostModel = getTaskPostModel();
    taskSortPostModel.sorting = sortPostModel;
  }

  /// Function to clear and reset task filters post model
  void updateFiltersPostModelAndRefreshPage() {
    taskSortPostModel = transformVariableFilters(
        _selectedVariablesFiltersList, taskSortPostModel.sorting);
    if (_selectedCheckBoxList.isNotEmpty) {
      for (var element in _selectedCheckBoxList) {
        if (element == 'name') {
          taskSortPostModel.variableNamesIgnoreCase = true;
        } else if (element == 'value') {
          taskSortPostModel.variableValuesIgnoreCase = true;
        }
      }
    }
    refreshPageData();
  }

  /// Function to save selected variable filter into the filter list
  /// Input Parameters
  /// [TaskVariableFilterDM]
  /// [Index]
  void saveSelectedVariableFilter(TaskVariableFilterDM dm, int index) {
    if (_selectedVariablesFiltersList.length > index) {
      _selectedVariablesFiltersList[index].filterSaved = true;
      _selectedVariablesFiltersList[index].enableEditing = false;
      notifyListeners();
    }
    updateFiltersPostModelAndRefreshPage();
  }

  /// Function to set Filter Data
  /// Input Parameters
  /// [FiltersResponse]
  void setFilterData(List<FiltersResponse> value) {
    ref.read(filtersListProvider.notifier).state = value;
    ref.read(taskFilterDropDownItemsProvider.notifier).state =
        buildFilterDropdownItems(value);
    if (_selectedSortFilterList.isEmpty) {
      _selectedSortFilterList.add(_uiSortFiltersList[0]);
    }
    sortPostModel = getTaskPostModel();
    taskSortPostModel.sorting = sortPostModel;
    appPreferences.setFiltersResponse(value);
  }

  /// Function to validate if variable filter and value has been added before
  /// saving it
  /// Input parameters
  /// [TaskVariableFilterDM]
  /// [Index]
  /// ---> Returns [Bool]
  bool validateVariableFilterContainer(TaskVariableFilterDM dm, int index) {
    if (_selectedVariablesFiltersList.length > index) {
      return _selectedVariablesFiltersList[index].selectedVariableProperty !=
              null &&
          !GeneralUtil.isStringEmpty(
              _selectedVariablesFiltersList[index].selectedVariableProperty) &&
          _selectedVariablesFiltersList[index].selectedVariableValue != null &&
          !GeneralUtil.isStringEmpty(
              _selectedVariablesFiltersList[index].selectedVariableValue) &&
          _selectedVariablesFiltersList[index].selectedOperatorLabel != null &&
          !GeneralUtil.isStringEmpty(
              _selectedVariablesFiltersList[index].selectedOperatorLabel);
    }
    return false;
  }

  /// Function to validate if variable filter and value has been added before
  /// saving it
  /// Input Parameters
  /// [TaskVariableFilterDM]
  /// [Index]
  /// ---> Returns [Bool]
  bool validateProcessDefinitionFilter(TaskVariableFilterDM dm, int index) {
    if (_selectedVariablesFiltersList.length > index) {
      return _selectedVariablesFiltersList[index].selectedVariableValue !=
              null &&
          !GeneralUtil.isStringEmpty(
              _selectedVariablesFiltersList[index].selectedVariableValue) &&
          _selectedVariablesFiltersList[index].selectedOperatorLabel != null &&
          !GeneralUtil.isStringEmpty(
              _selectedVariablesFiltersList[index].selectedOperatorLabel);
    }
    return false;
  }

  /// Function to listen to updated task details
  /// Input Parameters
  /// [TaskListingDM]
  void updatedTaskDetails({required TaskListingDM taskListingDM}) {
    int index = -1;
    index = _taskList
        .indexWhere((element) => element.taskId == taskListingDM.taskId);
    if (index != -1) {
      _taskList[index] = _taskList[index].copyWith(
          assignee: taskListingDM.assignee,
          dueDate: taskListingDM.dueDate,
          followUp: taskListingDM.followUp);
      notifyListeners();
    }
  }

  /// Function to update ascending/descending order in sort filter
  /// Input Parameters
  /// [TaskSortFilterDM]
  /// [Index]
  void updateSelectedAscDescSortItem(TaskSortFilterDM taskFilterDM, int index) {
    _selectedSortFilterList[index].sortOrder =
        _selectedSortFilterList[index].sortOrder == 'asc' ? 'desc' : 'asc';
    notifyListeners();
    resetTaskSortPostModel();
    refreshPageData();
  }

  /// Update selected sort item from the list
  /// Input Parameters
  /// [TaskSortFilterDM]
  /// [Index]
  void updateSelectedSortItem(TaskSortFilterDM taskFilterDM, int index) {
    if (getSelectedItemCount(_uiSortFiltersList) > 1 &&
        _uiSortFiltersList.length > index) {
      _uiSortFiltersList[index].isSelected =
          !_uiSortFiltersList[index].isSelected;
      notifyListeners();
    } else if (getSelectedItemCount(_uiSortFiltersList) == 1 &&
        !taskFilterDM.isSelected &&
        _uiSortFiltersList.length > index) {
      _uiSortFiltersList[index].isSelected =
          !_uiSortFiltersList[index].isSelected;
      notifyListeners();
    }
  }

  /// Function to update selected variables
  /// Input Parameters
  /// [TaskVariableFilterDM]
  /// [Index]
  void updateSelectedVariableFilterList(TaskVariableFilterDM dm, int index) {
    _selectedVariablesFiltersList.add(dm);
    notifyListeners();
  }

  /// Function to update selected variable filter operator value
  /// Input Parameters
  /// [TaskVariableFilterDM]
  /// [Index]
  /// [SelectedOperator]
  void updateSelectedVariableFilterOperatorValue(
      TaskVariableFilterDM dm, int index, Object selectedOperator) {
    if (_selectedVariablesFiltersList.length > index) {
      var operatorValue = GeneralUtil.getSelectedOperator(
          operatorList: _selectedVariablesFiltersList[index].comparess,
          operatorValues: _selectedVariablesFiltersList[index].values,
          selectedOperatorLabel: selectedOperator.toString(),
          variableType: _selectedVariablesFiltersList[index].type);
      _selectedVariablesFiltersList[index].selectedOperatorLabel =
          selectedOperator.toString();
      _selectedVariablesFiltersList[index].selectedOperatorValue =
          operatorValue;
      notifyListeners();
    }
  }

  /// Function to update selected variable filter property value
  /// Input Parameters
  /// [TaskVariableFilterDM]
  /// [Index]
  /// [Property]
  void updateSelectedVariableProperty(
      TaskVariableFilterDM dm, int index, String property) {
    if (_selectedVariablesFiltersList.length > index) {
      _selectedVariablesFiltersList[index].selectedVariableProperty = property;
      notifyListeners();
    }
  }

  /// Function to update selected variable filter value
  /// Input Parameters
  /// [TaskVariableFilterDM]
  /// [Index]
  /// [Value]
  void updateSelectedVariableValue(
      TaskVariableFilterDM dm, int index, String value) {
    if (_selectedVariablesFiltersList.length > index) {
      _selectedVariablesFiltersList[index].selectedVariableValue = value;
      notifyListeners();
    }
  }

  /// Method to scroll the page to the top
  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  /// Method to handle socket current task completed event
  /// Input Parameters
  /// [TaskId]
  void onCurrentTaskCompleted({String? taskId}) {
    _toastStateDM =
        _toastStateDM.copyWith(info: Strings.taskDetailsTaskCompleted);
    notifyListeners();
  }

  /// Method to transform List[TaskVariableFilterDM], List[Sorting] into
  /// [TaskSortPostModel]
  /// Input Parameters
  /// List[TaskVariableFilterDM]
  /// List[Sorting]
  /// ---> Returns [TaskSortPostModel]
  TaskSortPostModel transformVariableFilters(
      List<TaskVariableFilterDM> taskVariables, List<Sorting>? sorting) {
    TaskSortPostModel taskSortPostModel = TaskSortPostModel();
    taskSortPostModel.sorting = sorting;
    for (TaskVariableFilterDM element in taskVariables) {
      switch (element.key) {
        case TaskConstants.FILTER_KEY_TASK_VARIABLES:
          taskSortPostModel.taskVariableFilters ??= [];
          taskSortPostModel.taskVariableFilters?.add(VariableFilters(
              value: element.selectedVariableValue,
              name: element.selectedVariableProperty,
              operator: element.selectedOperatorValue));
          break;
        case TaskConstants.FILTER_KEY_PROCESS_VARIABLES:
          taskSortPostModel.processVariableFilters ??= [];
          taskSortPostModel.processVariableFilters?.add(VariableFilters(
              value: element.selectedVariableValue,
              name: element.selectedVariableProperty,
              operator: element.selectedOperatorValue));
          break;
        case TaskConstants.FILTER_KEY_PROCESS_DEFINITION_NAME:
          taskSortPostModel.processDefinitionFilters ??= [];
          taskSortPostModel.processDefinitionFilters?.add(VariableFilters(
              value: element.selectedVariableValue,
              name: "",
              operator: element.selectedOperatorValue));
          break;
        case TaskConstants.FILTER_KEY_ASSIGNEE:
          taskSortPostModel.assigneeFilters ??= [];
          taskSortPostModel.assigneeFilters?.add(VariableFilters(
              value: element.selectedVariableValue,
              name: "",
              operator: element.selectedOperatorValue));
          break;
        case TaskConstants.FILTER_KEY_CANDIDATE_GROUP:
          taskSortPostModel.candidateGroup = element.selectedVariableValue;
          break;
        case TaskConstants.FILTER_KEY_CANDIDATE_USER:
          taskSortPostModel.candidateUser = element.selectedVariableValue;
          break;
        case TaskConstants.FILTER_KEY_NAME:
          taskSortPostModel.nameFilters ??= [];
          taskSortPostModel.nameFilters?.add(VariableFilters(
              value: element.selectedVariableValue,
              name: "",
              operator: element.selectedOperatorValue));
          break;
        case TaskConstants.FILTER_KEY_DESCRIPTION:
          taskSortPostModel.descriptionFilters ??= [];
          taskSortPostModel.descriptionFilters?.add(VariableFilters(
              value: element.selectedVariableValue,
              name: "",
              operator: element.selectedOperatorValue));
          break;
        case TaskConstants.FILTER_KEY_PRIORITY:
          String data = element.selectedVariableValue ?? '-1';
          taskSortPostModel.priority = int.parse(data);
          break;
        case TaskConstants.FILTER_KEY_DUEDATE:
          taskSortPostModel.dueDateFilters ??= [];
          taskSortPostModel.dueDateFilters?.add(VariableFilters(
              value: element.selectedVariableValue,
              name: "",
              operator: element.selectedOperatorValue));
          break;
        case TaskConstants.FILTER_KEY_FOLLOWUP:
          taskSortPostModel.followUpFilters ??= [];
          taskSortPostModel.followUpFilters?.add(VariableFilters(
              value: element.selectedVariableValue,
              name: "",
              operator: element.selectedOperatorValue));
          break;
        case TaskConstants.FILTER_KEY_CREATED:
          taskSortPostModel.createdDateFilters ??= [];
          taskSortPostModel.createdDateFilters?.add(VariableFilters(
              value: element.selectedVariableValue,
              name: "",
              operator: element.selectedOperatorValue));
          break;
      }
    }
    return taskSortPostModel;
  }
}

/// Compute Function to parse [IsolatedTaskResponse]

TaskListResponse parseTaskIdResponse(Map<String, dynamic> value) {
  return TaskListResponse.fromJson(value);
}