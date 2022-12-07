import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:formsflowai/presentation/features/assigntask/view/widgets/member_list_inflate_row.dart';
import 'package:formsflowai/presentation/features/assigntask/viewmodel/assign_task_state_notifier.dart';
import 'package:formsflowai_shared/shared/dimens.dart';

import '../../../../base/widgets/base_consumer_widget.dart';

/// [MembersListView] build seperated listview with a spacing
/// separator widget
class MembersListView extends BaseConsumerWidget {
  const MembersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watch for the selected member changes
    final selectedMemberFilter = ref.watch(
        assignTaskStateProvider.select((value) => value.selectedMemberFilter));

    /// Watch for member list changes
    var membersList = ref.watch(assignTaskStateProvider).membersList;

    return Padding(
        padding: const EdgeInsets.only(
            top: Dimens.spacing_16, bottom: Dimens.spacing_16),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: membersList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return MemberListInflateRow(
              index: index,
              memberDM: membersList[index],
              viewMembersFilterModel: selectedMemberFilter,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(
                padding: EdgeInsets.only(top: Dimens.spacing_16));
          },
        ));
  }
}
