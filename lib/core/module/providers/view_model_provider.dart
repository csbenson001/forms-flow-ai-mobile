import 'package:formsflowai/presentation/features/splash/viewmodel/splash_view_model.dart';
import 'package:formsflowai/presentation/features/taskdetails/view/applicationhistory/viewmodel/applicatiion_history_view_model.dart';
import 'package:formsflowai/presentation/features/taskdetails/view/diagram/viewmodel/bpmn_diagram_view_model.dart';
import 'package:formsflowai/presentation/features/taskdetails/view/form/viewmodel/forms_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../presentation/features/assigntask/viewmodel/assign_task_view_model.dart';
import '../../../presentation/features/home/tasklisting/viewmodel/task_list_view_model.dart';
import '../../../presentation/features/login/viewmodel/login_view_model.dart';
import '../../../presentation/features/taskdetails/view/addgroups/viewmodel/add_group_dialog_view_model.dart';
import '../../../presentation/features/taskdetails/viewmodel/task_details_view_model.dart';
import '../../../presentation/features/viewformsubmission/viewmodel/view_form_submission_view_model.dart';
import '../../di/injection.dart';

/// ----------------- VIEW MODEL PROVIDERS ---------------------- ///

/// Defining [loginViewModelProvider] as an auto disposable
/// provider ref object for the [ViewModel] class [LoginViewModel]
final loginViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => LoginViewModel(
      loginUserCase: dl(),
      appPreferences: dl(),
      fetchUserInfoUseCase: dl(),
      loginKeycloakAuthenticatorUserCase: dl(),
      saveUserDetailsUsecase: dl(),
      ref: ref),
);

/// Defining [splashViewModelProvider] as
/// provider ref object for the [ViewModel] class [SplashViewModel]
final splashViewModelProvider = Provider(
  (ref) => SplashViewModel(
      refreshKeyCloakTokenUserCase: dl(),
      appPreferences: dl(),
      ref: ref,
      networkManagerController: dl()),
);

/// Defining [taskListViewModelProvider] as an auto disposable
/// change notifier provider ref object for the [ViewModel] class [TaskListViewModel]
final taskListViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => TaskListViewModel(
      fetchFiltersUseCase: dl(),
      ref: ref,
      fetchProcessDefinitionUseCase: dl(),
      fetchFormioRolesUseCase: dl(),
      fetchTaskCountUseCase: dl(),
      fetchTasksUseCase: dl(),
      databaseWorker: dl(),
      networkManagerController: dl(),
      socketService: dl(),
      clearLocalDatabaseUseCase: dl(),
      fetchIsolatedTaskUseCase: dl(),
      appPreferences: dl()),
);

/// Defining [taskListViewModelProvider] as an auto disposable
/// change notifier provider ref object for the [ViewModel] class
/// [TaskListViewModel]
final taskDetailsViewModelProvider = ChangeNotifierProvider.autoDispose((ref) =>
    TaskDetailsViewModel(
        ref: ref,
        fetchTaskVariablesUseCase: dl(),
        fetchLocalTaskUseCase: dl(),
        networkManagerController: dl(),
        updateRemoteTaskUseCase: dl(),
        databaseWorker: dl(),
        fetchFormUseCase: dl(),
        claimTaskUseCase: dl(),
        unClaimTaskUseCase: dl(),
        addGroupUseCase: dl(),
        deleteGroupUseCase: dl(),
        listTaskGroupsUseCase: dl(),
        updateAssigneeUseCase: dl(),
        fetchIsolatedTaskUseCase: dl(),
        submitFormUseCase: dl(),
        appPreferences: dl()));

/// Defining [viewFormSubmissionViewModelProvider]
/// provider ref object for the [ViewModel] class [ViewFormSubmissionViewModel]
final viewFormSubmissionViewModelProvider = ChangeNotifierProvider.autoDispose(
    (ref) => ViewFormSubmissionViewModel(
        ref: ref,
        fetchFormSubmissionUseCase: dl(),
        networkManagerController: dl(),
        appPreferences: dl(),
        fetchFormUseCase: dl()));

/// Defining [addGroupViewModelProvider] as an auto disposable
/// change notifier provider ref object for the [ViewModel] class
/// [AddGroupDialogViewModel]
final addGroupViewModelProvider = ChangeNotifierProvider.autoDispose((ref) =>
    AddGroupDialogViewModel(
        ref: ref,
        addGroupUseCase: dl(),
        deleteGroupUseCase: dl(),
        networkManagerController: dl()));

/// Defining [formsTabViewModelProvider]
/// change notifier provider ref object for the [ViewModel] class
/// [FormsViewModel]
final formsTabViewModelProvider = ChangeNotifierProvider((ref) =>
    FormsViewModel(
        ref: ref,
        fetchFormUseCase: dl(),
        fetchFormSubmissionUseCase: dl(),
        fetchFormEntityUseCase: dl(),
        appPreferences: dl(),
        networkManagerController: dl(),
        saveFormSubmissionUseCase: dl(),
        databaseWorker: dl(),
        fetchIsolatedFormDataUseCase: dl(),
        fetchLocalTaskUseCase: dl()));

/// Defining [applicationHistoryTabViewModelProvider]
/// change notifier provider ref object for the [ViewModel] class
/// [ApplicationHistoryViewModel]
final applicationHistoryTabViewModelProvider = ChangeNotifierProvider((ref) =>
    ApplicationHistoryViewModel(
        ref: ref,
        insertLocalApplicationHistoryUseCase: dl(),
        fetchApplicationHistoryUseCase: dl(),
        fetchApplicationHistoryEntityUseCase: dl(),
        appPreferences: dl()));

/// Defining [bpmnDiagramTabViewModelProvider]
/// change notifier provider ref object for the [ViewModel] class
/// [BPMNDiagramViewModel]
final bpmnDiagramTabViewModelProvider =
    ChangeNotifierProvider((ref) => BPMNDiagramViewModel(ref: ref));

/// Defining [assignTaskViewModelProvider] as an auto disposable
/// provider ref object for the [ViewModel] class [AssignTaskViewModel]
final assignTaskViewModelProvider = Provider.autoDispose((ref) =>
    AssignTaskViewModel(
        ref: ref,
        preferences: dl(),
        listMembersUseCase: dl(),
        networkManagerController: dl()));
