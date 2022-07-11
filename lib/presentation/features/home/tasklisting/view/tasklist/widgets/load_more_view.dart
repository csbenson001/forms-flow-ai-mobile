import 'package:flutter/cupertino.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/viewmodel/task_list_screen_providers.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_status.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/formsflow_circular_progress_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadMoreView extends BaseConsumerWidget {
  const LoadMoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPageLoading = ref.watch(taskLoadingProvider);

    return isPageLoading == PageStatus.loadingMore
        ? Container(
            padding: const EdgeInsets.only(bottom: Dimens.spacing_16),
            child: const Center(
              child: FormsFlowCircularProgressIndicator(),
            ))
        : const SizedBox();
  }
}
