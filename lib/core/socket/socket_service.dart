import 'dart:convert';

import 'package:formsflowai_shared/shared/api_constants_url.dart';
import 'package:formsflowai_shared/shared/formsflow_api_constants.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import '../preferences/app_preference.dart';

class SocketService {
  SocketService(this._preferences);

  // Inject preferences
  final AppPreferences _preferences;

  final _bpmSocketUrl = ApiConstantUrl.SOCKET_URL;

  // Stomp socket client
  StompClient? _stompClient;

  // Socket Event Callback Function
  void Function(String, String)? _socketEventCallback;

  /// Service OnClose Function
  void onClose() {
    if (_stompClient != null && _stompClient?.connected == true) {
      _stompClient?.deactivate();
    }
  }

  /// Function to connect Socket
  void activateSocket() {
    initSocket();
    _stompClient?.activate();
  }

  /// Function to disconnect Socket
  void deActivateSocket() {
    if (_stompClient != null) {
      _stompClient?.deactivate();
      _stompClient = null;
    }
  }

  /// Method to get Stomp Client
  StompClient _getStompClient() {
    return StompClient(
      config: StompConfig.SockJS(
          url: _bpmSocketUrl,
          onConnect: onConnect,
          onWebSocketError: (dynamic error) => {},
          stompConnectHeaders: {
            FormsFlowAIAPIConstants.socketAccessToken:
                _preferences.getAccessToken()
          },
          onStompError: onStompClientError,
          onDisconnect: onDisConnect),
    );
  }

  /// Function to initialise Socket
  void initSocket() {
    _stompClient ??= _getStompClient();
  }

  /// OnSocket Connect Callback Function
  void onConnect(StompFrame frame) {
    _stompClient?.subscribe(
      destination: FormsFlowAIAPIConstants.socketTopicTaskEvent,
      callback: (frame) {
        Map<String, dynamic>? result = json.decode(frame.body!);
        String eventName = result![FormsFlowAIAPIConstants.socketKeyEventName];
        String taskId = result[FormsFlowAIAPIConstants.socketKeyTaskId];
        try {
          if (_socketEventCallback != null) {
            _socketEventCallback!(taskId, eventName);
          }
        } catch (exception) {}
      },
    );
  }

  /// OnSocket Stomp Client Error Function
  void onStompClientError(StompFrame frame) {}

  /// OnSocket Disconnect Callback Function
  void onDisConnect(StompFrame frame) {}

  /// OnSocket Event Callback Function
  void setCallback({required Function(String, String) callback}) {
    _socketEventCallback = callback;
  }

  /// Function to check whether is socket connected
  bool isSocketConnected() {
    if (_stompClient == null) {
      return false;
    }
    return _stompClient?.connected ?? false;
  }

  /// Function to check whether is socket initialized
  bool isSocketInitialized() {
    return _stompClient != null;
  }
}
