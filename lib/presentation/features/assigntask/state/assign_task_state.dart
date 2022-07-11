import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/memebers_data_model.dart';
import '../model/view_members_filter_data_model.dart';

part 'assign_task_state.freezed.dart';

/// [AssignTaskState] immutable freezed class to hold assign task screen
/// data
@immutable
@freezed
class AssignTaskState with _$AssignTaskState {
  const factory AssignTaskState(
      {required ViewState viewState,
      required bool enableAssignButton,
      required List<MembersDM> membersList,
      required ViewMembersFilterDM selectedMemberFilter}) = _AssignTaskState;
}
