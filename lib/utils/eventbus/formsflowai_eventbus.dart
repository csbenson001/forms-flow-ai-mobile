import 'package:event_bus/event_bus.dart';

/// [FormsFlowEventBus] class to pass/update data without
/// navigating to the screen
class FormsFlowEventBus {
  EventBus? eventBus;

  FormsFlowEventBus() {
    eventBus = EventBus();
  }
}
