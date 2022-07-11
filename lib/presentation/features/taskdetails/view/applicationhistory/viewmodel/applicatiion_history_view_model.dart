import 'package:flutter/foundation.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai_shared/core/preferences/app_preference.dart';
import 'package:formsflowai_shared/shared/app_status.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/application_history_data_model.dart';
import '../../../usecases/fetch_application_history_entity_usecase.dart';
import '../../../usecases/fetch_application_history_usecase.dart';
import '../../../usecases/insert_local_application_history_usecase.dart';

/// [ApplicationHistoryViewModel] ViewModel class contains business logic
/// related to Application History Tab
class ApplicationHistoryViewModel extends ChangeNotifier {
  final Ref ref;
  final FetchApplicationHistoryUseCase fetchApplicationHistoryUseCase;
  final FetchApplicationHistoryEntityUseCase
      fetchApplicationHistoryEntityUseCase;
  final InsertLocalApplicationHistoryUseCase
      insertLocalApplicationHistoryUseCase;
  final AppPreferences appPreferences;
  List<ApplicationHistoryDM> applicationHistoryList = [];
  PageStatus applicationPageStatus = PageStatus.initial;

  ApplicationHistoryViewModel(
      {required this.ref,
      required this.fetchApplicationHistoryEntityUseCase,
      required this.insertLocalApplicationHistoryUseCase,
      required this.appPreferences,
      required this.fetchApplicationHistoryUseCase});

  /// Function to fetch application history
  void fetchApplicationHistory() {
    var applicationId =
        ref.read(taskDetailsViewModelProvider).taskInfoDM.applicationId;
    if (applicationId == null) {
      return;
    }
    applicationPageStatus = PageStatus.loading;
    notifyListeners();
    fetchApplicationHistoryUseCase
        .call(
            params: FetchApplicationHistoryParams(applicationId: applicationId))
        .then((value) {
      value.fold((l) {
        applicationPageStatus = PageStatus.failure;
        notifyListeners();
      }, (response) {
        if (response.isNotEmpty) {
          applicationHistoryList = response;
          applicationPageStatus = PageStatus.success;
          notifyListeners();
          if (ref.read(taskDetailsViewModelProvider).taskListingDM?.assignee ==
              appPreferences.getPreferredUserName()) {
            _validateAndInsertApplicationHistoryInLocalDB();
          }
        } else {
          applicationPageStatus = PageStatus.failure;
          notifyListeners();
        }
      });
    });
  }

  /// Function to fetch application history
  void refreshApplicationHistoryInBackground() {
    var applicationId =
        ref.read(taskDetailsViewModelProvider).taskInfoDM.applicationId;
    if (applicationId == null) {
      return;
    }
    fetchApplicationHistoryUseCase
        .call(
            params: FetchApplicationHistoryParams(applicationId: applicationId))
        .then((value) {
      value.fold((l) {
        applicationPageStatus = PageStatus.failure;
        notifyListeners();
      }, (response) {
        if (response.isNotEmpty) {
          applicationHistoryList = response;
          applicationPageStatus = PageStatus.success;
          notifyListeners();
          if (ref.read(taskDetailsViewModelProvider).taskListingDM?.assignee ==
              appPreferences.getPreferredUserName()) {
            _validateAndInsertApplicationHistoryInLocalDB();
          }
        } else {
          applicationPageStatus = PageStatus.failure;
          notifyListeners();
        }
      });
    });
  }

  /// Function to insert application history in local database
  void _validateAndInsertApplicationHistoryInLocalDB() async {
    var task = ref.read(taskDetailsViewModelProvider).taskListingDM;
    var taskInfoDM = ref.read(taskDetailsViewModelProvider).taskInfoDM;
    fetchApplicationHistoryEntityUseCase
        .call(
            params: FetchApplicationHistoryEntityParams(
                applicationId: taskInfoDM.applicationId ?? 0))
        .then((value) {
      value.fold((l) {}, (historyData) {
        if (applicationHistoryList.length != historyData.length) {
          insertLocalApplicationHistoryUseCase.call(
              params: InsertLocalApplicationHistoryParams(
                  appplicationEntityList:
                      ApplicationHistoryDM.transformFromApplicationDM(
                          data: applicationHistoryList,
                          applicationId: taskInfoDM.applicationId ?? 0,
                          taskId: task?.taskId ?? '')));
        } else if (historyData.isEmpty) {
          insertLocalApplicationHistoryUseCase.call(
              params: InsertLocalApplicationHistoryParams(
                  appplicationEntityList:
                      ApplicationHistoryDM.transformFromApplicationDM(
                          data: applicationHistoryList,
                          applicationId: taskInfoDM.applicationId ?? 0,
                          taskId: task?.taskId ?? '')));
        }
      });
    });
  }

  /// Function to reset the provider
  void resetProvider() {
    applicationHistoryList.clear();
    applicationPageStatus = PageStatus.initial;
  }
}
