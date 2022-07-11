import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class NetworkManagerController extends StateNotifier<ConnectivityResult> {
  ConnectivityResult connectionType = ConnectivityResult.none;

  //Instance of Flutter Connectivity
  final Connectivity _connectivity = Connectivity();
  //Stream to keep listening to network change state
  late StreamSubscription _streamSubscription;

  Logger logger = Logger();

  NetworkManagerController() : super(ConnectivityResult.none) {
    onInit();
  }

  Future<void> onInit() async {
    await getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  /// a method to get which connection result,
  /// if you we connected to internet or no if yes then which network
  Future<void> getConnectionType() async {
    ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
      state = connectivityResult;
      connectionType = connectivityResult;
    } on PlatformException catch (e) {
      logger.e(e);
    }
  }

  // state update, of network, if you are connected to WIFI connectionType,
  // and update the state to the consumer of that variable.
  _updateState(ConnectivityResult result) {
    state = result;
    connectionType = result;
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }
}
