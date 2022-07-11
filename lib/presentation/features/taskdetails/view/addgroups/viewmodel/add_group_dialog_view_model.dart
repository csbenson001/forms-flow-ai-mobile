import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai_api/post/task/add_group_post_model.dart';
import 'package:formsflowai_api/post/task/delete_group_post_model.dart';
import 'package:formsflowai_api/response/task/details/task_group_response.dart';
import 'package:formsflowai_shared/core/base/base_notifier_view_model.dart';
import 'package:formsflowai_shared/core/networkmanager/network_manager_controller.dart';
import 'package:formsflowai_shared/shared/formsflow_api_constants.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../usecases/add_groups_usecase.dart';
import '../../../usecases/delete_groups_usecase.dart';

/// [AddGroupDialogViewModel] ViewModel class contains all bussiness logic
/// related to add groups dialog screen
class AddGroupDialogViewModel extends BaseNotifierViewModel {
  final AddGroupsUseCase addGroupUseCase;
  final DeleteGroupsUseCase deleteGroupUseCase;
  final NetworkManagerController networkManagerController;
  final Ref ref;

  var groupName = '';

  var groupNameTextController = TextEditingController();

  AddGroupDialogViewModel(
      {required this.addGroupUseCase,
      required this.deleteGroupUseCase,
      required this.networkManagerController,
      required this.ref});

  /// Function to add groups
  /// Parameters
  /// [GroupName]
  Future<void> addGroup({required String groupName}) async {
    var taskId = ref.read(taskDetailsViewModelProvider).taskListingDM?.taskId;
    if (taskId == null) {
      return;
    }

    /// Check if the device has active internet connection before
    /// updating it to the remote
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      showProgressLoading();
      final result = await addGroupUseCase.call(
          params: AddGroupParams(
              addGroupPostModel: AddGroupPostModel(
                  groupId: groupName,
                  type: FormsFlowAIAPIConstants.GROUP_CANDIDATE),
              taskId: ref
                      .read(taskDetailsViewModelProvider)
                      .taskListingDM
                      ?.taskId ??
                  ''));
      result.fold((left) async {
        dismissProgressLoading();
      }, (right) async {
        clearGroupName();
        ref
            .read(taskDetailsViewModelProvider)
            .fetchUserGroups(refresh: true, hideProgress: true);
      });
    }
  }

  /// On Click Add Group button Action
  void onClickAddGroupButton() {
    addGroup(groupName: groupNameTextController.text.trim());
  }

  /// Function to delete group
  /// Input Parameters
  /// [TaskGroupsResponse]
  Future<void> onClickDeleteGroupButton(TaskGroupsResponse data) async {
    var taskId = ref.read(taskDetailsViewModelProvider).taskListingDM?.taskId;
    if (taskId == null) {
      return;
    }

    /// Check if the device has active internet connection before
    /// updating it to the remote
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      showProgressLoading();
      final result = await deleteGroupUseCase.call(
          params: DeleteGroupParams(
              taskId: taskId,
              deleteGroupPostModel: DeleteGroupPostModel(
                  type: data.type,
                  groupId: data.groupId,
                  userId: data.userId)));
      result.fold((left) async {
        dismissProgressLoading();
      }, (right) async {
        clearGroupName();
        ref
            .read(taskDetailsViewModelProvider)
            .fetchUserGroups(refresh: true, hideProgress: true);
      });
    }
  }

  /// OnClick Close button in groups Popup Dialog
  /// pops the dialog
  /// Parameters
  /// [BuildContext]
  void onClickCloseGroupPageButton({required BuildContext context}) {
    clearGroupName();
    RouterUtils.popRoute(context: context);
  }

  /// Function to clear group name
  void clearGroupName() {
    groupNameTextController.text = '';
    notifyListeners();
  }

  /// Function to update group name
  void updateGroupName({String? value}) {
    groupName = value ?? '';
    notifyListeners();
  }
}
