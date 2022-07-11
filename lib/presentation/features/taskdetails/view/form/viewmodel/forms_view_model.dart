import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/usecases/fetch_form_entity_usecase.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/usecases/fetch_isolated_form_data_usecase.dart';
import 'package:formsflowai/presentation/features/taskdetails/usecases/save_form_submission_usecase.dart';
import 'package:formsflowai/shared/toast/toast_message_provider.dart';
import 'package:formsflowai_api/response/form/submission/form_submission_response.dart';
import 'package:formsflowai_shared/core/base/base_notifier_view_model.dart';
import 'package:formsflowai_shared/core/database/entity/form_entity.dart';
import 'package:formsflowai_shared/core/networkmanager/network_manager_controller.dart';
import 'package:formsflowai_shared/core/preferences/app_preference.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/webview_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/database/worker/database_worker.dart';
import '../../../../../../core/error/errors_failure.dart';
import '../../../../home/tasklisting/viewmodel/task_list_screen_providers.dart';
import '../../../model/form_dm.dart';
import '../../../model/formio/formio_model.dart';
import '../../../usecases/fetch_form_submission_data.dart';
import '../../../usecases/fetch_forms_usecase.dart';
import '../../../usecases/fetch_local_task_usecase.dart';
import '../../../viewmodel/task_details_providers.dart';

/// [FormsViewModel] ViewModel class contains business logic
/// related to FormsView Tab

class FormsViewModel extends BaseNotifierViewModel {
  FormsViewModel(
      {required this.ref,
      required this.fetchFormSubmissionUseCase,
      required this.databaseWorker,
      required this.fetchFormEntityUseCase,
      required this.fetchFormUseCase,
      required this.appPreferences,
      required this.fetchIsolatedFormDataUseCase,
      required this.networkManagerController,
      required this.saveFormSubmissionUseCase,
      required this.fetchLocalTaskUseCase});

  final FetchFormSubmissionUseCase fetchFormSubmissionUseCase;
  final DatabaseWorker databaseWorker;
  final FetchFormEntityUseCase fetchFormEntityUseCase;
  final FetchLocalTaskUseCase fetchLocalTaskUseCase;
  final FetchFormUseCase fetchFormUseCase;
  final AppPreferences appPreferences;
  final FetchIsolatedFormDataUseCase fetchIsolatedFormDataUseCase;
  final Ref ref;

  // Forms Data Model
  FormDM _formDM = FormDM();
  FormDM get formDM => _formDM;

  // Formio Data Model
  FormIoModel _formIoModel = const FormIoModel();
  FormIoModel get formIoModel => _formIoModel;

  FormSubmissionResponse? formSubmissionResponse;

  // // value to show form webview loading indicator until webview loads
  // int formViewIndexedStackPosition = 0;
  bool noFormResourceFound = false;
  final NetworkManagerController networkManagerController;
  final SaveFormSubmissionUseCase saveFormSubmissionUseCase;

  ToastStateDM _toastStateDM = ToastStateDM();
  ToastStateDM get toastStateDM => _toastStateDM;

  /// Function to fetch forms data
  Future<void> fetchFormsData() async {
    if (noFormResourceFound) {
      noFormResourceFound = false;
    }
    var formResourceId =
        ref.read(taskDetailsViewModelProvider).taskInfoDM.formResourceId;
    if (formResourceId == null) {
      return;
    }
    ref.read(formViewLoadingProvider.notifier).state = true;

    var fetchFormResponse = await fetchFormUseCase.call(
        params: FetchFormParams(formResourceId: formResourceId));

    fetchFormResponse.fold((error) {
      print("Got Error" + error.toString());
      noFormResourceFound = true;
      notifyListeners();
      if (error is AuthorizationTokenExpiredFailure) {
        ref.read(authorizationExpiredFailureProvider.notifier).state = true;
      }
    }, (right) async {
      print("Got res" + right.toString());
      if (right != null) {
        _formDM = right;
        fetchFormSubmissionData(right);
        if (ref.read(taskDetailsViewModelProvider).taskListingDM?.assignee ==
            appPreferences.getPreferredUserName()) {
          await databaseWorker.insertFormDetails(
              formEntity: FormEntity.transformFormFromFormString(
                  formId: formResourceId,
                  formResponseEncoded: formDM.formResponse));
        }
      }
    });
  }

  /// Function to fetch submission data
  Future<void> fetchFormSubmissionData(FormDM formDM) async {
    var taskId = ref.read(taskDetailsViewModelProvider).taskListingDM?.taskId;
    var formResourceId =
        ref.read(taskDetailsViewModelProvider).taskInfoDM.formResourceId;
    var formSubmissionId =
        ref.read(taskDetailsViewModelProvider).taskInfoDM.formSubmissionId;
    if (taskId == null || formResourceId == null || formSubmissionId == null) {
      return;
    }
    var response = await fetchFormSubmissionUseCase.call(
        params: FetchSubmissionParams(
            taskId:
                ref.read(taskDetailsViewModelProvider).taskListingDM?.taskId ??
                    '',
            formResourceId: formResourceId,
            formSubmissionId: formSubmissionId));

    response.fold((left) {
      noFormResourceFound = true;
      notifyListeners();
    }, (submissionResponse) async {
      formSubmissionResponse = submissionResponse;
      _formIoModel = _formIoModel.copyWith(
          formComponents: formDM.formResponse,
          formData: json.encode(submissionResponse),
          formResourceId:
              ref.read(taskDetailsViewModelProvider).taskInfoDM.formResourceId,
          formSubmissionId: ref
              .read(taskDetailsViewModelProvider)
              .taskInfoDM
              .formSubmissionId,
          readOnly:
              ref.read(taskDetailsViewModelProvider).taskListingDM?.assignee !=
                  appPreferences.getPreferredUserName());
      notifyListeners();
      ref.read(formViewLoadingProvider.notifier).state = false;
      if (ref.read(taskDetailsViewModelProvider).taskListingDM?.assignee ==
          appPreferences.getPreferredUserName()) {
        databaseWorker.updateFormSubmissionData(
            submissionData: submissionResponse, taskId: taskId);
      }
    });
  }

  // Clear the toast state values
  void clearProvider() {
    _formDM.formResponse = null;
    _formIoModel = _formIoModel.copyWith(
        formData: "",
        formComponents: "",
        readOnly: true,
        formSubmissionUrl: "",
        formUrl: "");
    noFormResourceFound = false;
  }

  // Update form configuration data
  void updateFormConfig({required bool readOnly}) {
    _formIoModel = _formIoModel.copyWith(readOnly: readOnly);
    notifyListeners();
  }

  // onForm Submit Custom Action callback
  Future<void> onClickSubmitCustomFormEvent(
      {required dynamic formSubmissionData,
      required dynamic formActionType,
      required String type}) async {
    if (formSubmissionResponse == null) {
      return;
    }
    formSubmissionResponse =
        formSubmissionResponse?.copyWith(data: formSubmissionData);
    if (networkManagerController.connectionType != ConnectivityResult.none &&
        type == FormsFlowWebViewConstants.HANDLER_ACTION_COMPLETE) {
      final _taskListingDM =
          ref.read(taskDetailsViewModelProvider).taskListingDM;

      if (_taskListingDM == null ||
          (_taskListingDM != null && _taskListingDM.taskId == null)) {
        return;
      }
      if (networkManagerController.connectionType != ConnectivityResult.none) {
        showProgressLoading();
        var response = await saveFormSubmissionUseCase.call(
            params: SaveFormSubmissionParams(
          formSubmissionResponse: formSubmissionResponse!,
          formResourceId: ref
                  .read(taskDetailsViewModelProvider)
                  .taskInfoDM
                  .formResourceId ??
              '',
          formSubmissionId: ref
                  .read(taskDetailsViewModelProvider)
                  .taskInfoDM
                  .formSubmissionId ??
              '',
        ));
        response.fold((l) {
          dismissProgressLoading();
        }, (r) {
          dismissProgressLoading();
          ref
              .read(taskDetailsViewModelProvider)
              .submitForm(actionType: formActionType);
        });
      }
    } else if (networkManagerController.connectionType ==
            ConnectivityResult.none &&
        type == FormsFlowWebViewConstants.HANDLER_ACTION_ERROR) {
      databaseWorker.updateTaskFormSubmissionDataInLocalDatabase(
          formSubmissionResponse: formSubmissionResponse,
          taskId:
              ref.read(taskDetailsViewModelProvider).taskListingDM?.taskId ??
                  '',
          formActionType: formActionType);
      _toastStateDM =
          _toastStateDM.copyWith(info: Strings.taskDetailsLabelFormSubmitted);
      notifyListeners();
      ref
          .read(taskDetailsViewModelProvider)
          .goToHomePageOnOfflineSubmissionAction();
    }
  }

  // onForm Normal Submit Action callback
  Future<void> onClickSubmitFormEvent(
      {required dynamic formSubmissionData}) async {
    if (formSubmissionResponse == null) {
      return;
    }
    formSubmissionResponse =
        formSubmissionResponse?.copyWith(data: formSubmissionData);
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      final _taskListingDM =
          ref.read(taskDetailsViewModelProvider).taskListingDM;
      if (_taskListingDM == null ||
          (_taskListingDM != null && _taskListingDM.taskId == null)) {
        return;
      }
      if (networkManagerController.connectionType != ConnectivityResult.none) {
        showProgressLoading();
        var response = await saveFormSubmissionUseCase.call(
            params: SaveFormSubmissionParams(
          formSubmissionResponse: formSubmissionResponse!,
          formResourceId: ref
                  .read(taskDetailsViewModelProvider)
                  .taskInfoDM
                  .formResourceId ??
              '',
          formSubmissionId: ref
                  .read(taskDetailsViewModelProvider)
                  .taskInfoDM
                  .formSubmissionId ??
              '',
        ));
        response.fold((l) {
          dismissProgressLoading();
        }, (r) {
          dismissProgressLoading();
          ref.read(taskDetailsViewModelProvider).submitForm(actionType: "");
        });
      }
    } else if (networkManagerController.connectionType ==
        ConnectivityResult.none) {
      databaseWorker.updateTaskFormSubmissionDataInLocalDatabase(
          formSubmissionResponse: formSubmissionResponse,
          taskId:
              ref.read(taskDetailsViewModelProvider).taskListingDM?.taskId ??
                  '');
      _toastStateDM =
          _toastStateDM.copyWith(info: Strings.taskDetailsLabelFormSubmitted);
      notifyListeners();
      ref
          .read(taskDetailsViewModelProvider)
          .goToHomePageOnOfflineSubmissionAction();
    }
  }
}
