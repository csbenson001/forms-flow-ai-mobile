import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../../shared/task_constants.dart';
import '../../../../../../base/widgets/base_consumer_widget.dart';
import '../../../model/task_variable_filter_data_model.dart';
import 'filter_input_date_inflate_row.dart';
import 'filter_input_like_equal_operator_inflate_row.dart';
import 'filter_input_task_process_inflate_row.dart';

class SelectedVariableFilterListView extends BaseConsumerWidget {
  const SelectedVariableFilterListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedVariablesFiltersList =
        ref.watch(taskListViewModelProvider).selectedVariablesFiltersList;

    return selectedVariablesFiltersList.isNotEmpty
        ? Container(
            margin: const EdgeInsets.only(
                left: Dimens.spacing_8,
                right: Dimens.spacing_8,
                top: Dimens.spacing_16,
                bottom: Dimens.spacing_16),
            child: ListView.builder(
              primary: false,
              itemCount: selectedVariablesFiltersList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return getInflateRowView(
                    context: context,
                    index: index,
                    filterDM: selectedVariablesFiltersList[index]);
              },
            ))
        : const SizedBox();
  }

  Widget getInflateRowView(
      {required BuildContext context,
      required int index,
      required TaskVariableFilterDM filterDM}) {
    switch (filterDM.key) {
      case TaskConstants.filterKeyTaskVariables:
      case TaskConstants.filterKeyProcessVariables:
        return FilterInflateTaskProcessView(filterDM: filterDM, index: index);
      case TaskConstants.filterKeyProcessDefinitionName:
      case TaskConstants.filterKeyAssignee:
      case TaskConstants.filterKeyCandidateGroup:
      case TaskConstants.filterKeyCandidateUser:
      case TaskConstants.filterKeyName:
      case TaskConstants.filterKeyDescription:
      case TaskConstants.filterKeyPriority:
        return FilterInflateLikeEqOperatorViews(
            taskFilterDM: filterDM, index: index);
      case TaskConstants.filterKeyDuedate:
      case TaskConstants.filterKeyCreated:
      case TaskConstants.filterKeyFollowup:
        return FilterInflateDateOperatorViews(
            taskFilterDM: filterDM, index: index);

      default:
        return FilterInflateTaskProcessView(filterDM: filterDM, index: index);
    }
  }
}
