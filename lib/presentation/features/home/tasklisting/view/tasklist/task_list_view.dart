import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/view/tasklist/widgets/no_tasks_available_view.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/view/tasklist/widgets/task_list_inflate_row_view.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/viewmodel/task_list_screen_providers.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_status.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/shimmer/shimmer_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskListView extends BaseConsumerWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch for showing loading shimmer view
    final isLoading = ref.watch(taskLoadingProvider);
    // Watch for task list changes
    final taskList = ref.watch(taskListViewModelProvider).taskList;

    return isLoading == PageStatus.loading
        ? ShimmerWidgets.showShimmerListView()
        : taskList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(Dimens.spacing_16),
                child: ListView.builder(
                  primary: false,
                  itemCount: taskList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TaskListInflateRowView(
                      dm: taskList[index],
                      index: index,
                    );
                  },
                ))
            : const NoTasksAvailableView();
  }
}
