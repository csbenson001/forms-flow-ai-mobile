import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/shared/task_constants.dart';

import '../../../../../../../core/module/providers/view_model_provider.dart';
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
      case TaskConstants.FILTER_KEY_TASK_VARIABLES:
      case TaskConstants.FILTER_KEY_PROCESS_VARIABLES:
        return FilterInflateTaskProcessView(filterDM: filterDM, index: index);
      case TaskConstants.FILTER_KEY_PROCESS_DEFINITION_NAME:
      case TaskConstants.FILTER_KEY_ASSIGNEE:
      case TaskConstants.FILTER_KEY_CANDIDATE_GROUP:
      case TaskConstants.FILTER_KEY_CANDIDATE_USER:
      case TaskConstants.FILTER_KEY_NAME:
      case TaskConstants.FILTER_KEY_DESCRIPTION:
      case TaskConstants.FILTER_KEY_PRIORITY:
        return FilterInflateLikeEqOperatorViews(
            taskFilterDM: filterDM, index: index);
      case TaskConstants.FILTER_KEY_DUEDATE:
      case TaskConstants.FILTER_KEY_CREATED:
      case TaskConstants.FILTER_KEY_FOLLOWUP:
        return FilterInflateDateOperatorViews(
            taskFilterDM: filterDM, index: index);

      default:
        return FilterInflateTaskProcessView(filterDM: filterDM, index: index);
    }
  }
}
