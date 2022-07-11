import 'package:freezed_annotation/freezed_annotation.dart';

part 'socket_event_bus_data_model.freezed.dart';

/// [SocketEventBusDM] freezed data class to update socket events
@freezed
class SocketEventBusDM with _$SocketEventBusDM {
  const factory SocketEventBusDM({String? taskId, String? eventName}) =
      _SocketEventBusDM;
}
