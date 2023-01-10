import 'package:flutter/material.dart';
import 'package:formsflowai/presentation/features/assigntask/viewmodel/assign_task_state_notifier.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/button/custom_bottom_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../shared/app_strings.dart';
import '../../../../../shared/app_text_styles.dart';
import '../../../../base/widgets/base_consumer_widget.dart';

/// [AssignTaskButton] widget
/// ---> Returns assign task button
class AssignTaskButton extends BaseConsumerWidget {
  const AssignTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watch for [EnableAssignButton] changes
    final enableButton = ref.watch(
        assignTaskStateProvider.select((value) => value.enableAssignButton));

    return enableButton
        ? CustomBottomFilledButton(
            onPressed: () {
              ref
                  .read(assignTaskViewModelProvider)
                  .onClickAssignTaskButton(context: context);
            },
            buttonText: Strings.assignButtonTitle.toUpperCase(),
            backgroundColor: AppColor.primaryColor)
        : Positioned(
            bottom: Dimens.none,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: Dimens.size_60,
                color: Colors.black54,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      Strings.assignButtonTitleUpperCase,
                      style: AppTextStyles.whiteTextStyleBold_16,
                    ))));
  }
}
