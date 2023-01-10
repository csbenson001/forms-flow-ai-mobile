import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:formsflowai/presentation/features/taskdetails/view/form/widgets/forms_web_view.dart';
import 'package:formsflowai/utils/general_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../shared/toast/toast_message_provider.dart';
import '../../../../base/widgets/base_consumer_widget.dart';

class TaskDetailsFormsView extends BaseConsumerWidget {
  const TaskDetailsFormsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initListeners(context, ref);

    return FormsWebView();
  }

  void initListeners(BuildContext context, WidgetRef ref) {
    ref.listen<ToastStateDM>(
        formsTabViewModelProvider.select((value) => value.toastStateDM),
        (previous, next) {
      if (!GeneralUtil.isStringEmpty(next.success)) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          showSuccessToast(context: context, description: next.success!);
        });
      }
    });
  }
}
