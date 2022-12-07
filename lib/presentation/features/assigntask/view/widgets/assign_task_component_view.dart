import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:formsflowai/presentation/features/assigntask/viewmodel/assign_task_state_notifier.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:formsflowai_shared/widgets/formsflow_circular_progress_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/networkmanager/internet_connectivity_provider.dart';
import '../../../../../shared/app_strings.dart';
import '../../../../../widgets/nointernet/no_internet_view.dart';
import '../../../../base/widgets/base_consumer_widget.dart';
import 'members_dropdown_view.dart';
import 'members_list_view.dart';

/// [AssignTaskComponentView] widget
/// ---> Returns [Widget] with assign task page components
class AssignTaskComponentView extends BaseConsumerWidget {
  const AssignTaskComponentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState =
        ref.watch(assignTaskStateProvider.select((value) => value.viewState));
    final networkState = ref.watch(internetConnectivityProvider);

    return networkState == ConnectivityResult.none
        ? NoInternetView(
            heading: Strings.generalNoInternet,
            description: Strings.generalRetryActiveInternet)
        : viewState == ViewState.loading
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: FormsFlowCircularProgressIndicator(),
                ),
              )
            : Column(
                children: const [
                  ViewMembersFilterDropDownView(),
                  MembersListView(),
                ],
              );
  }
}
