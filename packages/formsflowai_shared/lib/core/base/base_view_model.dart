import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';

abstract class BaseViewModel {
  // Method to show Progress Loading
  void showProgressLoading() {
    EasyLoading.show(status: Strings.generalLabelPleaseWait);
  }

  // Method to dismiss Progress Loading
  void dismissProgressLoading() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss(animation: true);
    }
  }
}
