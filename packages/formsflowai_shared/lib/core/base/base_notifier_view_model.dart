import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';

abstract class BaseNotifierViewModel extends ChangeNotifier {
  /// variable to hold disposed state
  bool _disposed = false;

  /// function to show progress loading
  void showProgressLoading() {
    EasyLoading.show(status: Strings.generalLabelPleaseWait);
  }

  /// function to dismiss progress loading
  void dismissProgressLoading() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss(animation: true);
    }
  }

  /// function to set the dispose state value
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  /// function to check if viewmodel is disposed before notifying changes
  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
