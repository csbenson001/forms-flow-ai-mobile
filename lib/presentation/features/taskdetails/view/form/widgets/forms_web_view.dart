import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/formsflow_circular_progress_indicator.dart';
import 'package:formsflowai_shared/widgets/nodata/no_data_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../shared/app_strings.dart';
import '../../../../../../shared/webview_constants.dart';
import '../../../../../../utils/general_util.dart';
import '../../../../../base/widgets/base_consumer_widget.dart';
import '../../../viewmodel/task_details_providers.dart';

class FormsWebView extends BaseConsumerWidget {
  FormsWebView({Key? key}) : super(key: key);

  final GlobalKey webViewKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formIoModel = ref
        .watch(formsTabViewModelProvider.select((value) => value.formIoModel));
    final noFormResourceFound = ref.watch(
        formsTabViewModelProvider.select((value) => value.noFormResourceFound));
    final isLoadingForm = ref.watch(formViewLoadingProvider);

    return noFormResourceFound
        ? const NoDataView(
            heading: Strings.taskDetailsNoResourceFound,
            description: Strings.taskDetailsErrorSelectedFormResourceNotFound,
          )
        : !isLoadingForm && !GeneralUtil.isStringEmpty(formIoModel.formData)
            ? Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                    left: Dimens.spacing_8,
                    right: Dimens.spacing_8,
                    top: Dimens.spacing_8,
                    bottom: Dimens.spacing_8),
                child: InAppWebView(
                  key: webViewKey,
                  initialFile: 'assets/formio/form.html',
                  gestureRecognizers: {}..add(
                      Factory<VerticalDragGestureRecognizer>(
                          () => VerticalDragGestureRecognizer())),
                  initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                          useShouldOverrideUrlLoading: true,
                          allowFileAccessFromFileURLs: true,
                          allowUniversalAccessFromFileURLs: true,
                          javaScriptEnabled: true,
                          supportZoom: false,
                          mediaPlaybackRequiresUserGesture: false),
                      android: AndroidInAppWebViewOptions(
                          useHybridComposition: true,
                          builtInZoomControls: false,
                          displayZoomControls: false),
                      ios: IOSInAppWebViewOptions(
                        allowsInlineMediaPlayback: true,
                      )),
                  onLoadStart: (webcontroller, uri) {},
                  onWebViewCreated: (controller) {
                    ref
                        .read(formsTabViewModelProvider)
                        .updateWebViewController(webViewController: controller);

                    ref
                        .read(formsTabViewModelProvider)
                        .webViewPluscontroller
                        ?.addJavaScriptHandler(
                            handlerName:
                                FormsFlowWebViewConstants.handlerIsLoading,
                            callback: (data) {
                              if (data[0] == false) {}
                            });
                    ref
                        .read(formsTabViewModelProvider)
                        .webViewPluscontroller
                        ?.addJavaScriptHandler(
                            handlerName: FormsFlowWebViewConstants
                                .handlerOnSubmissionChanged,
                            callback: (data) {});

                    ref
                        .read(formsTabViewModelProvider)
                        .webViewPluscontroller
                        ?.addJavaScriptHandler(
                            handlerName: FormsFlowWebViewConstants
                                .handlerOnValidityChecked,
                            callback: (data) {});
                    ref
                        .read(formsTabViewModelProvider)
                        .webViewPluscontroller
                        ?.addJavaScriptHandler(
                            handlerName:
                                FormsFlowWebViewConstants.handlerSubmissionData,
                            callback: (data) {
                              dynamic formData = data[0];
                              if (formData[FormsFlowWebViewConstants
                                      .formKeyEventType] ==
                                  FormsFlowWebViewConstants
                                      .handlerActionCustomSubmissionEvent) {
                                ref
                                    .read(formsTabViewModelProvider)
                                    .onClickSubmitCustomFormEvent(
                                        formSubmissionData: formData[
                                            FormsFlowWebViewConstants
                                                .formKeySubmissionData],
                                        type: formData[FormsFlowWebViewConstants
                                            .formKeyType],
                                        formActionType: formData[
                                            FormsFlowWebViewConstants
                                                .formKeyActionType]);
                              } else {
                                ref
                                    .read(formsTabViewModelProvider)
                                    .onClickSubmitFormEvent(
                                        formSubmissionData: formData[
                                            FormsFlowWebViewConstants
                                                .formKeySubmissionData]);
                              }
                            });
                    ref
                        .read(formsTabViewModelProvider)
                        .webViewPluscontroller
                        ?.addJavaScriptHandler(
                            handlerName:
                                FormsFlowWebViewConstants.handlerOnRenderedData,
                            callback: (data) {});
                  },
                  androidOnPermissionRequest:
                      (controller, origin, resources) async {
                    return PermissionRequestResponse(
                        resources: resources,
                        action: PermissionRequestResponseAction.GRANT);
                  },
                  onConsoleMessage: (controller, consoleMessage) {},
                  onLoadStop:
                      (InAppWebViewController inappController, Uri? uri) async {
                    ref.read(formsTabViewModelProvider).loadForm();
                  },
                ))
            : const Center(
                child: FormsFlowCircularProgressIndicator(),
              );
  }
}
