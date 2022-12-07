import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../shared/app_strings.dart';
import '../../../../../../../shared/app_text_styles.dart';
import '../../../../../../base/widgets/base_consumer_widget.dart';

/// [TaskSelectedVariablesCountView] to display selected
/// task variables count
class TaskSelectedVariablesCountView extends BaseConsumerWidget {
  const TaskSelectedVariablesCountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedVariablesList =
        ref.watch(taskListViewModelProvider).selectedVariablesFiltersList;
    final taskList =
        ref.watch(taskListViewModelProvider.select((value) => value.taskList));

    if (selectedVariablesList.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(
            top: Dimens.spacing_16, left: Dimens.spacing_16),
        child: Text(
          " ${Strings.taskListingFilteredTasks}(${taskList.length.toString()})",
          style: AppTextStyles.boldTextStyle(
              fontSize: Dimens.font_16, textColor: Colors.black87),
        ),
      );
    }
    return const SizedBox(height: 0);
  }
}
