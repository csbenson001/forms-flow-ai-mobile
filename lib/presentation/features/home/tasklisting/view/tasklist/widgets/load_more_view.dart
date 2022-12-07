import 'package:flutter/cupertino.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/formsflow_circular_progress_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../shared/app_status.dart';
import '../../../../../../base/widgets/base_consumer_widget.dart';

class LoadMoreView extends BaseConsumerWidget {
  const LoadMoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPageLoading = ref
        .watch(taskListViewModelProvider.select((value) => value.pageStatus));

    return isPageLoading == PageStatus.loadingMore
        ? Container(
            padding: const EdgeInsets.only(bottom: Dimens.spacing_16),
            child: const Center(
              child: FormsFlowCircularProgressIndicator(),
            ))
        : const SizedBox();
  }
}
