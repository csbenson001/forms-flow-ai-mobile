import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:formsflowai/presentation/features/login/viewmodel/login_state_notifier.dart';
import 'package:formsflowai/presentation/features/login/views/widgets/login_form_view.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../shared/imageassets/formsflowai_image_assets.dart';
import '../../../../shared/toast/toast_message_provider.dart';

class LoginScreen extends BaseConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Function to initialize show/hide toast and navigation listeners
    initListeners(ref, context);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Image.asset(
              FormsFlowAIImageAssets.imagesImgBgLogin,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: LoginFormView(),
                ))
          ],
        ));
  }

  /// Function to init Listeners
  /// Input Parameters
  /// [WidgetRef]
  /// [BuildContext]
  void initListeners(WidgetRef ref, BuildContext context) {
    /// Function to listen to show toast messages
    ref.listen<ToastStateDM>(
        loginStateProvider.select((value) => value.toastStateDM),
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

    // Function to listen to login success event
    ref.listen<bool>(loginStateProvider.select((value) => value.isLoginSuccess),
        (previous, next) {
      if (next) {
        RouterUtils.goToRoute(
            context: context, routeName: AppRoutes.taskListingScreen);
      }
    });
  }
}
