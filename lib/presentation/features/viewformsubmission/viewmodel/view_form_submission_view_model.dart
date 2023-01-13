import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai/presentation/features/viewformsubmission/view/view_form_submission_screen.dart';
import 'package:formsflowai/presentation/features/viewformsubmission/viewmodel/view_form_submission_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/networkmanager/internet_connectivity_provider.dart';
import '../../../../core/networkmanager/network_manager_controller.dart';
import '../../../../core/preferences/app_preference.dart';
import '../../../../core/socket/socket_service.dart';
import '../../../../utils/form/formio_webview_util.dart';
import '../../../../utils/general_util.dart';
import '../../../base/viewmodel/base_notifier_view_model.dart';
import '../../taskdetails/model/application_history_data_model.dart';
import '../../taskdetails/model/form_dm.dart';
import '../../taskdetails/model/formio/formio_model.dart';
import '../../taskdetails/usecases/form/fetch_form_submission_data.dart';
import '../../taskdetails/usecases/form/fetch_forms_usecase.dart';

/// [ViewFormSubmissionViewModel] ViewModel class contains business logic
/// related to [ViewFormSubmissionScreen]
class ViewFormSubmissionViewModel extends BaseNotifierViewModel {
  final Ref ref;
  final AppPreferences appPreferences;
  final FetchFormUseCase fetchFormUseCase;
  final FetchFormSubmissionUseCase fetchFormSubmissionUseCase;
  final NetworkManagerController networkManagerController;

  /// Application History data model
  ApplicationHistoryDM? _applicationHistoryDM;
  ApplicationHistoryDM? get applicationHistoryDM => _applicationHistoryDM;

  // InAppwebview View Controller
  InAppWebViewController? _webViewPluscontroller;
  InAppWebViewController? get webViewPluscontroller => _webViewPluscontroller;

  final SocketService socketService;

  ViewFormSubmissionViewModel(
      {required this.ref,
      required this.fetchFormUseCase,
      required this.networkManagerController,
      required this.appPreferences,
      required this.socketService,
      required this.fetchFormSubmissionUseCase});

  /// OnInit Method
  void onInit({required ApplicationHistoryDM applicationHistoryDM}) {
    _applicationHistoryDM = applicationHistoryDM;
    fetchForms();
    _initInternetNetworkCallback();
  }

  /// Method to fetch forms
  Future<void> fetchForms() async {
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref
            .read(viewFormSubmissionStateProvider.notifier)
            .updateFormLoading(isLoading: true);
      });

      final formUrl = _applicationHistoryDM?.formUrl ?? '';
      String formResourceId = _applicationHistoryDM?.formId ?? '';
      String formSubmissionId = _applicationHistoryDM?.formSubmissionId ?? '';

      if (!GeneralUtil.isStringEmpty(formUrl)) {
        var response = await fetchFormUseCase.call(
            params: FetchFormParams(formResourceId: formResourceId));
        response.fold((left) {
          ref
              .read(viewFormSubmissionStateProvider.notifier)
              .updateNoFormResourceFound();
        }, (right) async {
          if (right != null) {
            fetchFormSubmissionData(
                formDM: right,
                formResourceId: formResourceId,
                formSubmissionId: formSubmissionId);
          } else {
            ref
                .read(viewFormSubmissionStateProvider.notifier)
                .updateNoFormResourceFound();
          }
        });
      } else {
        ref
            .read(viewFormSubmissionStateProvider.notifier)
            .updateNoFormResourceFound();
      }
    }
  }

  /// Method fo fetch form submission data
  /// Parameters
  /// [FormDM]
  /// [FormResourceId]
  /// [FormSubmissionId]
  Future<void> fetchFormSubmissionData(
      {required FormDM formDM,
      required String formResourceId,
      required String formSubmissionId}) async {
    var response = await fetchFormSubmissionUseCase.call(
        params: FetchSubmissionParams(
            taskId: '',
            formResourceId: formResourceId,
            formSubmissionId: formSubmissionId));

    response.fold((left) {
      ref
          .read(viewFormSubmissionStateProvider.notifier)
          .updateNoFormResourceFound();
    }, (submissionResponse) async {
      if (!GeneralUtil.isStringEmpty(submissionResponse.id)) {
        FormIoModel formIoModel = FormIoModel(
            readOnly: true,
            formComponents: formDM.formResponse,
            formData: json.encode(submissionResponse));
        ref
            .read(viewFormSubmissionStateProvider.notifier)
            .updateFormioModel(formIoModel: formIoModel);
      }
    });
  }

  /// Function to listen to connectivity toast
  /// if there is an internet change reload the page data
  void _initInternetNetworkCallback() {
    ref.listen<ConnectivityResult>(internetConnectivityProvider,
        (previous, next) {
      if (next != ConnectivityResult.none) {
        fetchForms();
      }
    });
  }

  /// Function to clear App session
  /// calls home task list view model to clear the session
  /// clear the database data
  /// navigates to login screen after logout
  Future<void> clearAppSession({required BuildContext context}) async {
    ref.read(taskListViewModelProvider).logoutUser(context: context);
  }

  /// Function to update webview controller to object in the
  /// view form submission view model
  /// webview controller objects are used to load forms, get webview callbacks
  /// in the app
  void updateWebViewController(
      {required InAppWebViewController webViewController}) {
    _webViewPluscontroller = webViewController;
  }

  /// Function to load form
  loadForm({FormIoModel? formIoModel}) {
    if (formIoModel == null) {
      return;
    }
    _webViewPluscontroller?.evaluateJavascript(
        source:
            'loadForm(${formIoModel.formComponents}, ${formIoModel.formData},'
            '${FormioWebViewUtil.fetchFormIoInputData(readOnly: formIoModel.readOnly ?? false, formResourceId: formIoModel.formResourceId, userInfoResponse: appPreferences.getUserInfo(), authToken: appPreferences.getAccessToken(), formToken: appPreferences.getFormJwtToken())}'
            ')');
    notifyListeners();
  }
}
