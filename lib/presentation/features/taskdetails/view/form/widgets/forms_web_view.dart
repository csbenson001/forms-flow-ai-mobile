import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/shared/webview_constants.dart';
import 'package:formsflowai_shared/utils/form/formsflowai_webview_utils.dart';
import 'package:formsflowai_shared/widgets/formsflow_circular_progress_indicator.dart';
import 'package:formsflowai_shared/widgets/nodata/no_data_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../utils/general_util.dart';
import '../../../viewmodel/task_details_providers.dart';

class FormsWebView extends BaseConsumerWidget {
  const FormsWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formIoModel = ref
        .watch(formsTabViewModelProvider.select((value) => value.formIoModel));
    final noFormResourceFound = ref.watch(
        formsTabViewModelProvider.select((value) => value.noFormResourceFound));
    final isLoadingForm = ref.watch(formViewLoadingProvider);
    final appPreferences = ref.watch(
        taskDetailsViewModelProvider.select((value) => value.appPreferences));

    return noFormResourceFound
        ? NoDataView(
            heading: Strings.taskDetailsNoResourceFound,
            description: Strings.taskDetailsErrorSelectedFormResourceNotFound,
          )
        : !isLoadingForm && !GeneralUtil.isStringEmpty(formIoModel.formData)
            ? Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.spacing_8,
                    right: Dimens.spacing_8,
                    top: Dimens.spacing_8,
                    bottom: Dimens.spacing_8),
                child: InAppWebView(
                  key: UniqueKey(),
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
                        .read(taskDetailsViewModelProvider)
                        .formWebViewController = controller;

                    ref
                        .read(taskDetailsViewModelProvider)
                        .formWebViewController
                        .addJavaScriptHandler(
                            handlerName:
                                FormsFlowWebViewConstants.HANDLER_IS_LOADING,
                            callback: (data) {
                              if (data[0] == false) {}
                            });
                    ref
                        .read(taskDetailsViewModelProvider)
                        .formWebViewController
                        .addJavaScriptHandler(
                            handlerName: FormsFlowWebViewConstants
                                .HANDLER_ON_SUBMISSION_CHANGED,
                            callback: (data) {});

                    ref
                        .read(taskDetailsViewModelProvider)
                        .formWebViewController
                        .addJavaScriptHandler(
                            handlerName: FormsFlowWebViewConstants
                                .HANDLER_ON_VALIDITY_CHECKED,
                            callback: (data) {});
                    ref
                        .read(taskDetailsViewModelProvider)
                        .formWebViewController
                        .addJavaScriptHandler(
                            handlerName: FormsFlowWebViewConstants
                                .HANDLER_SUBMISSION_DATA,
                            callback: (data) {
                              dynamic formData = data[0];
                              if (formData[FormsFlowWebViewConstants
                                      .FORM_KEY_EVENT_TYPE] ==
                                  FormsFlowWebViewConstants
                                      .HANDLER_ACTION_CUSTOM_SUBMISSION_EVENT) {
                                ref
                                    .read(formsTabViewModelProvider)
                                    .onClickSubmitCustomFormEvent(
                                        formSubmissionData: formData[
                                            FormsFlowWebViewConstants
                                                .FORM_KEY_SUBMISSION_DATA],
                                        type: formData[FormsFlowWebViewConstants
                                            .FORM_KEY_TYPE],
                                        formActionType: formData[
                                            FormsFlowWebViewConstants
                                                .FORM_KEY_ACTION_TYPE]);
                              } else {
                                ref
                                    .read(formsTabViewModelProvider)
                                    .onClickSubmitFormEvent(
                                        formSubmissionData: formData);
                              }
                            });
                    ref
                        .read(taskDetailsViewModelProvider)
                        .formWebViewController
                        .addJavaScriptHandler(
                            handlerName: FormsFlowWebViewConstants
                                .HANDLER_ON_RENDERED_DATA,
                            callback: (data) {});
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
