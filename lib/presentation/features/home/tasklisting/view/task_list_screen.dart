import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/view/tasklist/widgets/task_list_floating_button.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../shared/app_strings.dart';
import '../../../../../widgets/nointernet/no_internet_snackbar_view.dart';
import '../../../../base/drawer/drawer_app_bar_scaffold.dart';
import '../../../../base/widgets/base_hooks_consumer_widget.dart';
import '../viewmodel/task_list_screen_providers.dart';
import 'index.dart';

/// [TaskListScreen] home screen to display the task sort filters
/// task variable filters and task list view
class TaskListScreen extends BaseHooksConsumerWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Function to init listeners
    initListeners(ref, context);

    final scrollController = useScrollController();

    /// call onInit method in the viewModel
    useEffect(() {
      ref
          .read(taskListViewModelProvider)
          .onInit(scrollController: scrollController);
    }, []);

    return DrawerAppScaffold(
        backgroundColor: AppColor.grey7,
        pageTitle: Strings.taskListingTitle,
        floatingActionButton: const TaskListFloatingButton(),
        body: SafeArea(
            child: RefreshIndicator(
                color: AppColor.primarycolor,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: () async {
                  await ref.read(taskListViewModelProvider).pullToRefresh();
                },
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      NoInternetTopSnackBarView(),
                      TaskSortView(),
                      Align(
                          alignment: Alignment.topRight,
                          child: AddSortButtonView()),
                      TaskFilterView(),
                      TaskFiltersDropdownView(),
                      TaskListView(),
                      LoadMoreView()
                    ],
                  ),
                ))));
  }

  void initListeners(WidgetRef ref, BuildContext context) {
    /// Listen for token expired failure
    ref.listen<bool>(authorizationExpiredFailureProvider, (previous, next) {
      if (next) {
        showErrorToast(
            context: context, description: Strings.generalErrorSessionTimeout);
        ref.read(taskListViewModelProvider).logoutUser(context: context);
      }
    });
  }
}
