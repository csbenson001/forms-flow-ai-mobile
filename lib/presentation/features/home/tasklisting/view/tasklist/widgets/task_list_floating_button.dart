import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/viewmodel/task_list_screen_providers.dart';
import 'package:formsflowai_shared/shared/app_color.dart';

import '../../../../../../base/widgets/base_consumer_widget.dart';

class TaskListFloatingButton extends BaseConsumerWidget {
  const TaskListFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showFloatingButton = ref.watch(showHideFloatingActionButtonProvider);

    return showFloatingButton
        ? FloatingActionButton(
            backgroundColor: AppColor.primarycolor,
            child: const Icon(
              Icons.arrow_upward_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              ref.read(taskListViewModelProvider).scrollToTop();
            },
          )
        : const SizedBox();
  }
}
