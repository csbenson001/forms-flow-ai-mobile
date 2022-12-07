import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'network_manager_controller.dart';

final internetConnectivityProvider =
    StateNotifierProvider<NetworkManagerController, ConnectivityResult>(
  (ref) => NetworkManagerController(),
);
