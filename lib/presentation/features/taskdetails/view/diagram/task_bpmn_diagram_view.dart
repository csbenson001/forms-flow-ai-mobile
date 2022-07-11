import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:formsflowai_shared/core/base/base_hooks_consumer_widget.dart';
import 'package:formsflowai_shared/core/networkmanager/internet_connectivity_provider.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/webview_constants.dart';
import 'package:formsflowai_shared/utils/form/formsflowai_webview_utils.dart';
import 'package:formsflowai_shared/widgets/nointernetview/no_internet_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/module/providers/view_model_provider.dart';

class TaskBpmnDiagramView extends BaseHooksConsumerWidget {
  const TaskBpmnDiagramView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var diagramVIewIndexedStackPosition = ref.watch(
        bpmnDiagramTabViewModelProvider
            .select((value) => value.bpmnDiagramViewStackedPosition));
    var connectivity = ref.watch(internetConnectivityProvider);
    var processDefinitionResponse = ref.watch(taskListViewModelProvider
        .select((value) => value.processDefinitionResponse));
    var appPreferences = ref.watch(
        taskListViewModelProvider.select((value) => value.appPreferences));
    var taskListingDM = ref.watch(
        taskDetailsViewModelProvider.select((value) => value.taskListingDM));

    return IndexedStack(
      index: diagramVIewIndexedStackPosition,
      children: [
        connectivity == ConnectivityResult.none
            ? NoInternetView(
                heading: Strings.generalNoInternet,
                description: Strings.taskDetailsErrorNoInterenetDescription,
              )
            : InAppWebView(
                gestureRecognizers: Set()
                  ..add(Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
                initialData: FormsFlowAIWebViewUtils.loadBpmnDiagram(
                    bearerToken: appPreferences.getBearerAccessToken(),
                    processDefinitionResponse: processDefinitionResponse,
                    processDefinitionName: taskListingDM?.processDefinitionName,
                    processInstanceId: taskListingDM?.processInstanceId),
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
                onWebViewCreated: (webviewController) {
                  ref
                      .read(bpmnDiagramTabViewModelProvider)
                      .bpmnDiagramWebViewController = webviewController;
                  ref
                      .read(bpmnDiagramTabViewModelProvider)
                      .bpmnDiagramWebViewController
                      .addJavaScriptHandler(
                          handlerName:
                              FormsFlowWebViewConstants.HANDLER_IS_LOADING,
                          callback: (data) {
                            if (data[0] == false) {
                              ref
                                  .read(bpmnDiagramTabViewModelProvider)
                                  .updateDiagramStackedIndexPosition(0);
                            }
                          });
                },
                onLoadStart: (webController, uri) {
                  ref
                      .read(bpmnDiagramTabViewModelProvider)
                      .updateDiagramStackedIndexPosition(1);
                },
                androidOnPermissionRequest:
                    (controller, origin, resources) async {
                  return PermissionRequestResponse(
                      resources: resources,
                      action: PermissionRequestResponseAction.GRANT);
                },
                onConsoleMessage: (controller, consoleMessage) {},
              ),
        const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
