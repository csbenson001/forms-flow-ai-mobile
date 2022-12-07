import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai_shared/shared/formsflow_api_constants.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/networkmanager/internet_connectivity_provider.dart';
import '../../../../core/networkmanager/network_manager_controller.dart';
import '../../../../core/preferences/app_preference.dart';
import '../../../base/viewmodel/base_view_model.dart';
import '../../home/tasklisting/model/task_listing_data_model.dart';
import '../../taskdetails/usecases/task/list_members_usecase.dart';
import '../model/memebers_data_model.dart';
import '../model/view_members_filter_data_model.dart';
import 'assign_task_state_notifier.dart';

/// [AssignTaskViewModel] class contains all bussiness logic used in the
/// [AssignTaskScreen]
class AssignTaskViewModel extends BaseViewModel {
  /// Preferences
  final AppPreferences preferences;

  /// UseCases
  final ListMembersUseCase listMembersUseCase;

  /// Ref
  final Ref ref;

  /// NetworkManagerController
  final NetworkManagerController networkManagerController;

  /// Contains member dropdownlist
  final memberDropdownList = ViewMembersFilterDM.buildDropdownTestItems();

  /// TaskListingDataModel object
  TaskListingDM? _taskListingDM;
  TaskListingDM? get taskListingDM => _taskListingDM;

  AssignTaskViewModel(
      {required this.preferences,
      required this.listMembersUseCase,
      required this.ref,
      required this.networkManagerController});

  /// [OnInit] method of the assign task view model
  void onInit({required TaskListingDM data}) {
    _taskListingDM = data;
    fetchMembersList();
    _initInternetNetworkCallback();
  }

  /// function to fetch member list from remote
  /// Parameters
  /// Optional [Refresh] - if refresh is true clear and fetch from remote
  Future<void> fetchMembersList({bool? refresh}) async {
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (ref.read(assignTaskStateProvider).viewState != ViewState.loading) {
          ref
              .read(assignTaskStateProvider.notifier)
              .updateViewState(viewState: ViewState.loading);
        }
      });
      if (refresh ?? false) {
        ref.read(assignTaskStateProvider).membersList.clear();
      }
      final result = await listMembersUseCase.call(
          params: const ListMembersParams(
              FormsFlowAIAPIConstants.FORMSFLOW_REVIEWER_ROLE));
      result.fold((left) {
        ref
            .read(assignTaskStateProvider.notifier)
            .updateViewState(viewState: ViewState.failure);
      }, (response) {
        ref
            .read(assignTaskStateProvider.notifier)
            .updateViewState(viewState: ViewState.success);
        final data = MembersDM.transform(response);
        ref.read(assignTaskStateProvider.notifier).updateMemberList(data: data);
      });
    }
  }

  /// Function to handle filter change
  /// Input Param
  /// [SelectedItem]
  void onChangeDropdownTests(dynamic? selectedItem) {
    ref
        .read(assignTaskStateProvider.notifier)
        .updateSelectedMemberFilter(selectedItem: selectedItem);
  }

  /// Function to handle on member selected from the list
  /// Input Param
  /// [MembersDM]
  /// [SelectedMemberListIndex]
  void onMemberItemSelected(MembersDM itemselected, int index) {
    ref
        .read(assignTaskStateProvider.notifier)
        .updateSelectedMemberList(itemSelected: itemselected, index: index);
  }

  /// Function onClick Assign task button
  /// send callback to task details with the selected member details
  /// Input param
  /// [BuildContext]
  void onClickAssignTaskButton({required BuildContext context}) {
    MembersDM? selectedMemberModel;
    selectedMemberModel = getSelectedMemberModel();
    if (selectedMemberModel != null) {
      RouterUtils.popRoute(context: context);
      ref.read(taskDetailsViewModelProvider).onAssignTaskSelectedMemberCallback(
          selectedMemberModel: selectedMemberModel);
    }
  }

  /// Function to listen to connectivity toast
  /// if there is an internet change reload the page data
  void _initInternetNetworkCallback() {
    ref.listen<ConnectivityResult>(internetConnectivityProvider,
        (previous, next) {
      if (next != ConnectivityResult.none) {
        fetchMembersList(refresh: true);
      }
    });
  }

  /// Function to get selected member model
  /// ---> Returns Optional[MembersDM]
  MembersDM? getSelectedMemberModel() {
    MembersDM? selectedMemberModel;
    final memberList = ref.read(assignTaskStateProvider).membersList;
    for (var element in memberList) {
      if (element.isSelected ?? false) {
        selectedMemberModel = element;
        break;
      }
    }
    return selectedMemberModel;
  }
}
