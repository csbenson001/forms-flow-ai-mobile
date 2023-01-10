import 'package:formsflowai/presentation/features/assigntask/state/assign_task_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/formsflow_app_constants.dart';
import '../model/memebers_data_model.dart';
import '../model/view_members_filter_data_model.dart';

/// [assignTaskStateProvider] state notifier provider object for the
/// class [AssignTaskStateNotifier]

final assignTaskStateProvider =
    StateNotifierProvider.autoDispose<AssignTaskStateNotifier, AssignTaskState>(
        (ref) {
  return AssignTaskStateNotifier();
});

/// StateNotifier class to update the state values of the assign
/// task screen class
class AssignTaskStateNotifier extends StateNotifier<AssignTaskState> {
  AssignTaskStateNotifier()
      : super(AssignTaskState(
            enableAssignButton: false,
            membersList: [],
            selectedMemberFilter: ViewMembersFilterDM.getInitialFilterModel(),
            viewState: ViewState.initial));

  /// Method to update view state
  /// Parameter
  /// [ViewState]
  void updateViewState({required ViewState viewState}) {
    state = state.copyWith(viewState: viewState);
  }

  /// Method to update selected member filter
  /// Input Parameter
  /// [SelectedItem]
  void updateSelectedMemberFilter({dynamic selectedItem}) {
    state = state.copyWith(selectedMemberFilter: selectedItem);
  }

  /// Method to update the selected member list
  /// Input Param
  /// [MembersDM]
  /// [SelectedMemberListIndex]
  void updateSelectedMemberList(
      {required MembersDM itemSelected, required int index}) {
    for (var element in state.membersList) {
      if (element.email != itemSelected.email && element.isSelected == true) {
        element.isSelected = false;
      }
    }
    MembersDM memberDM = state.membersList[index];
    memberDM.isSelected = !memberDM.isSelected!;
    state.membersList[index] = memberDM;
    state = state.copyWith(
        membersList: state.membersList,
        enableAssignButton: state.membersList[index].isSelected!);
  }

  /// Method to update the available member list
  /// Input param
  /// [MembersDM] Members Data Model List
  void updateMemberList({required List<MembersDM> data}) {
    state = state.copyWith(membersList: data);
  }
}
