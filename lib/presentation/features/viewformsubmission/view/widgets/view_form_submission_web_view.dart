import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:formsflowai/presentation/features/viewformsubmission/viewmodel/view_form_submission_state_notifier.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/core/networkmanager/internet_connectivity_provider.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/utils/form/formsflowai_webview_utils.dart';
import 'package:formsflowai_shared/widgets/formsflow_circular_progress_indicator.dart';
import 'package:formsflowai_shared/widgets/nodata/no_data_view.dart';
import 'package:formsflowai_shared/widgets/nointernetview/no_internet_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../utils/general_util.dart';

class ViewFormSubmissionWebView extends BaseConsumerWidget {
  const ViewFormSubmissionWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noFormResourceFound = ref.watch(viewFormSubmissionStateProvider
        .select((value) => value.isNoFormResourceFound));
    final formIoModel = ref.watch(
        viewFormSubmissionStateProvider.select((value) => value.formIoModel));
    final internetConnectivity = ref.watch(internetConnectivityProvider);
    final appPreferences = ref.watch(
        taskDetailsViewModelProvider.select((value) => value.appPreferences));

    return internetConnectivity == ConnectivityResult.none
        ? NoInternetView(
            heading: Strings.generalLabelNoInternet,
            description: Strings.viewFormSubmissionErrorNoInternetDescription,
          )
        : noFormResourceFound ?? false
            ? NoDataView(
                heading: Strings.taskDetailsNoResourceFound,
                description:
                    Strings.taskDetailsErrorSelectedFormResourceNotFound,
              )
            : formIoModel != null &&
                    !GeneralUtil.isStringEmpty(formIoModel.formData)
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.spacing_16,
                        top: Dimens.spacing_8,
                        right: Dimens.spacing_10),
                    child: InAppWebView(
                      gestureRecognizers: Set()
                        ..add(Factory<VerticalDragGestureRecognizer>(
                            () => VerticalDragGestureRecognizer())),
                      initialData: FormsFlowAIWebViewUtils.loadForms(
                          readOnly: formIoModel.readOnly,
                          formData: formIoModel.formData,
                          formComponents: formIoModel.formComponents,
                          formResourceId: formIoModel.formResourceId,
                          accessToken: appPreferences.getAccessToken(),
                          formJWTToken: appPreferences.getFormJwtToken(),
                          userInfo: appPreferences.getUserInfo()),
                      initialOptions: InAppWebViewGroupOptions(
                          crossPlatform: InAppWebViewOptions(
                              useShouldOverrideUrlLoading: true,
                              mediaPlaybackRequiresUserGesture: true,
                              supportZoom: false,
                              javaScriptEnabled: true,
                              horizontalScrollBarEnabled: false,
                              verticalScrollBarEnabled: false,
                              javaScriptCanOpenWindowsAutomatically: true,
                              preferredContentMode:
                                  UserPreferredContentMode.RECOMMENDED),
                          android: AndroidInAppWebViewOptions(
                              useHybridComposition: false,
                              useWideViewPort: false,
                              allowFileAccess: true,
                              overScrollMode:
                                  AndroidOverScrollMode.OVER_SCROLL_NEVER,
                              allowContentAccess: true),
                          ios: IOSInAppWebViewOptions(
                            allowsInlineMediaPlayback: true,
                          )),
                      onLoadStart: (webcontroller, uri) {},
                      onWebViewCreated: (controller) {
                        ref
                            .read(viewFormSubmissionViewModelProvider)
                            .formWebViewController = controller;
                      },
                      androidOnPermissionRequest:
                          (controller, origin, resources) async {
                        return PermissionRequestResponse(
                            resources: resources,
                            action: PermissionRequestResponseAction.GRANT);
                      },
                      onConsoleMessage: (controller, consoleMessage) {},
                      onLoadStop: (InAppWebViewController inappController,
                          Uri? uri) async {},
                    ))
                : const Center(
                    child: FormsFlowCircularProgressIndicator(),
                  );
  }
}
