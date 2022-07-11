import 'package:formsflowai/presentation/features/taskdetails/model/eventbusdm/socket_event_bus_data_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final showTaskInfoProvider = StateProvider<bool>((ref) {
  return false;
});

final formViewLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

final currentTaskCompletedSocketProvider =
    StateProvider.autoDispose<bool>((ref) {
  return false;
});

final socketCallbackProvider = StateProvider<SocketEventBusDM>((ref) {
  return SocketEventBusDM();
});
