import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/application_history_data_model.dart';
import 'package:formsflowai/presentation/features/viewformsubmission/view/widgets/view_form_submission_web_view.dart';
import 'package:formsflowai_shared/core/base/base_hooks_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/module/providers/view_model_provider.dart';
import '../../../../core/router/app_routes.dart';
import '../../../base/toolbar_app_scaffold.dart';
import '../../home/tasklisting/viewmodel/task_list_screen_providers.dart';

class ViewFormSubmissionScreen extends BaseHooksConsumerWidget {
  const ViewFormSubmissionScreen({Key? key, required this.applicationHistoryDM})
      : super(key: key);

  final ApplicationHistoryDM applicationHistoryDM;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initListeners(ref, context);

    useEffect(() {
      ref
          .read(viewFormSubmissionViewModelProvider)
          .onInit(applicationHistoryDM: applicationHistoryDM);
    }, []);

    return const ToolbarAppScaffold(
      pageTitle: Strings.viewFormSubmissionTitle,
      body: ViewFormSubmissionWebView(),
    );
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
