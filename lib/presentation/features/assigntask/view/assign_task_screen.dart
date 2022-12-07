import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai/presentation/features/assigntask/view/widgets/assign_task_button.dart';
import 'package:formsflowai/presentation/features/assigntask/view/widgets/assign_task_component_view.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/app_strings.dart';
import '../../../base/toolbar/toolbar_app_scaffold.dart';
import '../../../base/widgets/base_hooks_consumer_widget.dart';
import '../../home/tasklisting/model/task_listing_data_model.dart';

/// [AssignTaskScreen] assign the task to other members
/// shows list of available members in the reviewer group
/// user can select a member and assign the task to them or other users
class AssignTaskScreen extends BaseHooksConsumerWidget {
  const AssignTaskScreen({Key? key, required this.taskListingDM})
      : super(key: key);

  /// Assign Task Screen requires [TaskListingDM]
  /// as its required input parameter
  final TaskListingDM taskListingDM;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Call [AssignTaskViewModel] onInit method to fetch members data from remote
    useEffect(() {
      ref.read(assignTaskViewModelProvider).onInit(data: taskListingDM);
    }, []);

    return ToolbarAppScaffold(
        pageTitle: Strings.assignTaskTitle,
        body: SafeArea(
            child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                color: AppColor.grey7,
                padding: const EdgeInsets.only(bottom: Dimens.spacing_60),
                child: const SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: AssignTaskComponentView(),
                )),
            const AssignTaskButton()
          ],
        )));
  }
}
