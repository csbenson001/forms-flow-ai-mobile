import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../../shared/app_strings.dart';
import 'base_view.dart';

abstract class BaseStatelessWidget extends StatelessWidget implements BaseView {
  const BaseStatelessWidget({Key? key}) : super(key: key);

  @override
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

  @override
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

  @override
  void showProgressLoading() {
    EasyLoading.show(status: Strings.generalLabelPleaseWait);
  }

  @override
  void dismissProgressLoading() {
    EasyLoading.dismiss(animation: true);
  }
}
