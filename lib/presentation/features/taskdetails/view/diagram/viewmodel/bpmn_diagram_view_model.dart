import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [BPMNDiagramViewModel] ViewModel class contains business logic
/// related to BPMNDiagramTab
class BPMNDiagramViewModel extends ChangeNotifier {
  final Ref ref;
  late InAppWebViewController bpmnDiagramWebViewController;
  // value to show diagram webview loading indicator until webview loads
  int bpmnDiagramViewStackedPosition = 0;
  bool showBpmnDiagram = false;

  BPMNDiagramViewModel({required this.ref});

  /// Function to show/hide circular progress while BPMN Diagram loading
  void updateDiagramStackedIndexPosition(int position) {
    bpmnDiagramViewStackedPosition = position;
    notifyListeners();
  }
}
