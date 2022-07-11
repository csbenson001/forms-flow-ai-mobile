import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:formsflowai_shared/widgets/progress/progress_custom_animation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isolated_http_client/isolated_http_client.dart';

import 'core/di/injection.dart';
import 'core/router/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Call function[RegisterServices] to inject services/useCases/repos
  await registerServices();

  /// Init executor
  await Executor().warmUp(log: false);
  // await dotenv.load(fileName: AppConstants.env_File_Name);
  /// call function [SetAppOverlay] to set system bar color brightness
  await setAppOverlay();

  /// call function [InitEasyLoading] to set system bar color brightness
  initEasyLoading();
  runApp(
    ProviderScope(
        child: MaterialApp.router(
      routeInformationParser:
          FormsFlowAIRouter.appRouteList.routeInformationParser,
      routerDelegate: FormsFlowAIRouter.appRouteList.routerDelegate,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    )),
  );
}

/// Function to set overlay [StatusBar] color and brightness
Future<void> setAppOverlay() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    statusBarBrightness: Brightness.light,
  ));
}

/// Function to init [ProgressLoading] used in formsFlow.ai app
void initEasyLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(
        milliseconds: FormsFlowAIConstants.loadingDisplayDurationSeconds)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = Dimens.size_45
    ..radius = Dimens.radius_10
    ..progressColor = Colors.white
    ..backgroundColor = AppColor.primarycolor
    ..indicatorColor = AppColor.primarycolor
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}
