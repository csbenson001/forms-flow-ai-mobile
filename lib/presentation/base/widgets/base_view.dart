import 'package:flutter/material.dart';

abstract class BaseView<T> {
  void showSuccessToast(
      {required BuildContext context, required String description});

  void showProgressLoading();

  void dismissProgressLoading();

  void showErrorToast(
      {required BuildContext context, required String description});
}
