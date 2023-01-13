import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';

class AppTheme {
  static ThemeData tealAppTheme = ThemeData(
      primaryColor: AppColor.primaryColor,
      primaryColorDark: Colors.black,
      secondaryHeaderColor: AppColor.primaryColor);

  static ThemeData baseAppTheme = ThemeData(
      secondaryHeaderColor: Colors.black,
      primaryColor: Colors.white,
      primaryColorDark: Colors.black);
}
