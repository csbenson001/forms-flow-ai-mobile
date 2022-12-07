import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai/core/router/app_routes.dart';
import 'package:formsflowai/presentation/features/splash/viewmodel/splash_state_notifier.dart';
import 'package:formsflowai/shared/imageassets/formsflowai_image_assets.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../base/widgets/base_hooks_consumer_widget.dart';

class SplashScreen extends BaseHooksConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Initialise riverPod listeners for splash screen
    initListeners(ref, context);

    /// call onInit method in the viewModel
    useEffect(() {
      ref.read(splashViewModelProvider).onInit();
    }, []);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: Dimens.size_300.h,
                width: Dimens.size_300.w,
                margin: SizerUtil.deviceType == DeviceType.mobile
                    ? const EdgeInsets.only(
                        left: Dimens.spacing_24, right: Dimens.spacing_24)
                    : const EdgeInsets.only(
                        left: Dimens.spacing_60, right: Dimens.spacing_60),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  FormsFlowAIImageAssets.imagesIcFormsFlowLogo,
                  width: Dimens.size_230.w,
                  height: Dimens.size_230.h,
                  alignment: Alignment.center,
                ),
              ))),
    );
  }

  /// Init Ref listeners
  /// Input Parameters
  /// [WidgetRef]
  /// [BuildContext]
  void initListeners(WidgetRef ref, BuildContext context) {
    /// Validate the user login session and navigate to home page if user
    /// logged in or login page is user is not logged in
    final isUserLoggedIn = ref.watch(splashViewModelProvider
        .select((value) => value.appPreferences.isUserLoggedIn()));
    ref.listen<bool>(
        splashScreenStateProvider
            .select((value) => value.startNavigationToHome), (previous, next) {
      if (next && isUserLoggedIn) {
        RouterUtils.goToRoute(
            context: context, routeName: AppRoutes.taskListingScreen);
      } else {
        RouterUtils.goToRoute(
            context: context, routeName: AppRoutes.loginScreen);
      }
    });
  }
}
