import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/application_history_data_model.dart';
import 'package:formsflowai/presentation/features/viewformsubmission/view/widgets/view_form_submission_web_view.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';
import 'package:formsflowai_shared/widgets/nodata/no_data_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/module/providers/view_model_provider.dart';
import '../../../../core/networkmanager/internet_connectivity_provider.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../shared/app_strings.dart';
import '../../../../widgets/nointernet/no_internet_view.dart';
import '../../../base/toolbar/toolbar_app_scaffold.dart';
import '../../../base/widgets/base_hooks_consumer_widget.dart';
import '../../home/tasklisting/viewmodel/task_list_screen_providers.dart';
import '../viewmodel/view_form_submission_state_notifier.dart';

class ViewFormSubmissionScreen extends BaseHooksConsumerWidget {
  const ViewFormSubmissionScreen({Key? key, required this.applicationHistoryDM})
      : super(key: key);

  final ApplicationHistoryDM applicationHistoryDM;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initListeners(ref, context);

    final internetConnectivity = ref.watch(internetConnectivityProvider);
    final noFormResourceFound = ref.watch(viewFormSubmissionStateProvider
        .select((value) => value.isNoFormResourceFound));

    useEffect(() {
      ref
          .read(viewFormSubmissionViewModelProvider)
          .onInit(applicationHistoryDM: applicationHistoryDM);
    }, []);

    return ToolbarAppScaffold(
        pageTitle: Strings.viewFormSubmissionTitle,
        body: SafeArea(
          child: internetConnectivity == ConnectivityResult.none
              ? NoInternetView(
                  heading: Strings.generalLabelNoInternet,
                  description:
                      Strings.viewFormSubmissionErrorNoInternetDescription,
                )
              : noFormResourceFound ?? false
                  ? NoDataView(
                      heading: Strings.taskDetailsNoResourceFound,
                      description:
                          Strings.taskDetailsErrorSelectedFormResourceNotFound,
                    )
                  : ViewFormSubmissionWebView(),
        ));
  }

  void initListeners(WidgetRef ref, BuildContext context) {
    ref.listen<bool>(authorizationExpiredFailureProvider, (previous, next) {
      if (next) {
        ref.read(taskListViewModelProvider).appPreferences.clear();
        showErrorToast(
            context: context, description: Strings.generalErrorSessionTimeout);
        RouterUtils.logoutUser(
            context: context, routeName: AppRoutes.loginScreen);
      }
    });
  }
}
