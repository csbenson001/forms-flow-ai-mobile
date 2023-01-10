import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';

class ColorUtil {
  static Color getColor(String? label) {
    switch (label) {
      case "Review Submission":
        return AppColor.blue3;
      case "Review Applications":
        return AppColor.primaryColor;
      case "Approve/Reject Applications":
        return AppColor.green;
      default:
        return AppColor.green;
    }
  }
}
