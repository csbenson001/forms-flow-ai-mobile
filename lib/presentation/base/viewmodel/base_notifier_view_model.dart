import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../../shared/app_strings.dart';

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

  void showSuccessToast(
      {required BuildContext context, required String description}) {
    MotionToast.success(
            title: null,
            position: MotionToastPosition.bottom,
            description: Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            toastDuration: const Duration(seconds: 3),
            height: Dimens.size_80,
            width: Dimens.size_300)
        .show(context);
  }

  void showErrorToast(
      {required BuildContext context, required String description}) {
    MotionToast.error(
            title: null,
            position: MotionToastPosition.bottom,
            description: Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            toastDuration: const Duration(seconds: 3),
            height: Dimens.size_80,
            width: Dimens.size_300)
        .show(context);
  }
}
