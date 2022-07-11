import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

abstract class BaseHooksConsumerWidget extends HookConsumerWidget {
  const BaseHooksConsumerWidget({Key? key}) : super(key: key);

  void showSuccessToast(
      {required BuildContext context, required String description}) {
    MotionToast.success(
            title: null,
            position: MotionToastPosition.bottom,
            description: Text(description),
            toastDuration: const Duration(seconds: 3),
            width: Dimens.size_300)
        .show(context);
  }

  void showErrorToast(
      {required BuildContext context, required String description}) {
    MotionToast.error(
            title: null,
            position: MotionToastPosition.bottom,
            description: Text(description),
            toastDuration: const Duration(seconds: 3),
            width: Dimens.size_300)
        .show(context);
  }

  void showProgressLoading() {
    EasyLoading.show(status: Strings.generalLabelPleaseWait);
  }

  void dismissProgressLoading() {
    EasyLoading.dismiss(animation: true);
  }
}
