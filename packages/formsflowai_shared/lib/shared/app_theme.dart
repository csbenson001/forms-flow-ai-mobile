import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData tealAppTheme = ThemeData(
      primaryColor: AppColor.primarycolor,
      primaryColorDark: Colors.black,
      secondaryHeaderColor: AppColor.primarycolor);

  static ThemeData baseAppTheme = ThemeData(
      secondaryHeaderColor: Colors.black,
      primaryColor: Colors.white,
      primaryColorDark: Colors.black);
}
