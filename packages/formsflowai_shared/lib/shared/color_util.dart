import 'package:flutter/material.dart';

import 'app_color.dart';

class ColorUtil {
  static Color getColor(String? label) {
    switch (label) {
      case "Review Submission":
        return AppColor.blue3;
      case "Review Applications":
        return AppColor.primarycolor;
      case "Approve/Reject Applications":
        return AppColor.green;
      default:
        return AppColor.green;
    }
  }
}
