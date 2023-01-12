import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai/presentation/features/viewformsubmission/viewmodel/view_form_submission_state_notifier.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/formsflow_circular_progress_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../shared/webview_constants.dart';
import '../../../../../utils/form/formio_webview_util.dart';
import '../../../../../utils/general_util.dart';
import '../../../../base/widgets/base_consumer_widget.dart';

class ViewFormSubmissionWebView extends BaseConsumerWidget {
  final GlobalKey formSubmissionWebKey = GlobalKey();

  ViewFormSubmissionWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formIoModel = ref.watch(
        viewFormSubmissionStateProvider.select((value) => value.formIoModel));

    final appPreferences = ref.watch(viewFormSubmissionViewModelProvider
        .select((value) => value.appPreferences));

    return !GeneralUtil.isStringEmpty(formIoModel?.formData)
        ? Padding(
            padding: const EdgeInsets.only(
                left: Dimens.spacing_16,
                top: Dimens.spacing_8,
                right: Dimens.spacing_10),
            child: InAppWebView(
              key: formSubmissionWebKey,
              gestureRecognizers: {}..add(
                  Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
              initialFile: FormsFlowWebViewConstants.formsAssetUrl,
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                      useShouldOverrideUrlLoading: true,
                      mediaPlaybackRequiresUserGesture: true,
                      supportZoom: true,
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
                      overScrollMode: AndroidOverScrollMode.OVER_SCROLL_NEVER,
                      allowContentAccess: true),
                  ios: IOSInAppWebViewOptions(
                    allowsInlineMediaPlayback: true,
                  )),
              onLoadStart: (webcontroller, uri) {},
              onWebViewCreated: (controller) {},
              androidOnPermissionRequest:
                  (controller, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              onConsoleMessage: (controller, consoleMessage) {},
              onLoadStop:
                  (InAppWebViewController inappController, Uri? uri) async {
                inappController.evaluateJavascript(
                    source:
                        'loadForm(${formIoModel?.formComponents}, ${formIoModel?.formData},'
                        '${FormioWebViewUtil.fetchFormIoInputData(readOnly: formIoModel?.readOnly ?? false, formResourceId: formIoModel?.formResourceId, userInfoResponse: appPreferences.getUserInfo(), authToken: appPreferences.getAccessToken(), formToken: appPreferences.getFormJwtToken())}'
                        ')');
              },
            ))
        : const Center(
            child: FormsFlowCircularProgressIndicator(),
          );
  }
}
