import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/model/task_variable_filter_data_model.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:formsflowai_shared/widgets/datetimepicker/formsflowai_date_time_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../../shared/app_text_styles.dart';
import '../../../../../../base/widgets/base_consumer_widget.dart';

class FilterInputDatePickerView extends BaseConsumerWidget {
  const FilterInputDatePickerView(
      {Key? key, required this.taskFilterDM, required this.index})
      : super(key: key);

  final TaskVariableFilterDM taskFilterDM;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        if (taskFilterDM.enableEditing ?? false) {
          final selectedDateTime =
              await FormsflowAIDateTimePicker.buildDateTimePicker(
                  context: context);
          if (selectedDateTime != null) {
            ref.read(taskListViewModelProvider).updateSelectedVariableValue(
                taskFilterDM, index, selectedDateTime.toString());
          }
        }
      },
      child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: AppColor.grey),
          ),
          child: Text(
            taskFilterDM.selectedVariableValue != null
                ? Jiffy("${taskFilterDM.selectedVariableValue}",
                        FormsFlowAIConstants.dateYearTimeStamp)
                    .yMMMMEEEEdjm
                : "",
            style: AppTextStyles.blackRegularTextStyle_12,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}
