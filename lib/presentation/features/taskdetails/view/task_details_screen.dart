import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formsflowai/presentation/features/taskdetails/view/applicationhistory/task_application_history_view.dart';
import 'package:formsflowai/presentation/features/taskdetails/view/diagram/task_bpmn_diagram_view.dart';
import 'package:formsflowai/presentation/features/taskdetails/view/widgets/task_details_header_view.dart';
import 'package:formsflowai/presentation/features/taskdetails/viewmodel/task_details_providers.dart';
import 'package:formsflowai_shared/core/base/base_hooks_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/module/providers/view_model_provider.dart';
import '../../../../shared/toast/toast_message_provider.dart';
import '../../../base/toolbar_app_scaffold.dart';
import '../../home/tasklisting/model/task_listing_data_model.dart';
import '../../home/tasklisting/viewmodel/task_list_screen_providers.dart';
import 'form/task_details_forms_view.dart';

class TaskDetailsScreen extends BaseHooksConsumerWidget {
  const TaskDetailsScreen({Key? key, required this.taskListingDM})
      : super(key: key);

  final TaskListingDM taskListingDM;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// initialize Tab Controller
    final tabController = useTabController(initialLength: 3, initialIndex: 0);
    initListeners(ref, context);

    // call onInit method in task details view model to initialize the page data
    useEffect(() {
      ref.read(taskDetailsViewModelProvider).onInit(data: taskListingDM);
    }, []);

    return ToolbarAppScaffold(
        pageTitle: Strings.taskDetailsTitle,
        body: NestedScrollView(
            physics: const ClampingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                        color: AppColor.grey7,
                        child: const TaskDetailsHeaderView()),
                    Card(
                        color: Colors.white,
                        elevation: Dimens.radius_2,
                        margin: const EdgeInsets.only(
                            top: Dimens.spacing_16,
                            left: Dimens.spacing_16,
                            right: Dimens.spacing_16,
                            bottom: Dimens.spacing_16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimens.spacing_8),
                        ),
                        child: TabBar(
                          padding: const EdgeInsets.only(
                              left: Dimens.spacing_20,
                              right: Dimens.spacing_20),
                          onTap: (index) {
                            ref
                                .read(taskDetailsViewModelProvider)
                                .updateSelectedTabIndex(index);
                          },
                          labelColor: AppColor.primarycolor,
                          indicatorColor: AppColor.primarycolor,
                          unselectedLabelColor: Colors.black54,
                          isScrollable: false,
                          physics: const NeverScrollableScrollPhysics(),
                          controller: tabController,
                          tabs: const [
                            Tab(text: Strings.taskDetailsTabTitleForm),
                            Tab(text: Strings.taskDetailsTabTitleHistory),
                            Tab(text: Strings.taskDetailsTabTitleDiagram),
                          ],
                        )),
                  ]),
                ),
              ];
            },
            body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                  physics: const ClampingScrollPhysics(),
                  controller: tabController,
                  children: const [
                    TaskDetailsFormsView(),
                    TaskApplicationHistoryView(),
                    TaskBpmnDiagramView()
                  ],
                ))));
  }

  void initListeners(WidgetRef ref, BuildContext context) {
    ref.listen<bool>(authorizationExpiredFailureProvider, (previous, next) {
      if (next) {
        ref.read(taskListViewModelProvider).logoutUser(context: context);
      }
    });

    ref.listen<bool>(currentTaskCompletedSocketProvider, (previous, next) {
      if (next) {
        RouterUtils.popRoute(context: context);
      }
    });

    ref.listen<ToastStateDM>(
        taskDetailsViewModelProvider.select((value) => value.toastStateDM),
        (previous, next) {
      if (next.success != null) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          showSuccessToast(context: context, description: next.success!);
        });
      } else if (next.error != null) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          showErrorToast(context: context, description: next.error!);
        });
      }
    });
  }
}
