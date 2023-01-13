import 'package:flutter/material.dart';

class Dimens {
  //Spacing  Size

  static const double spacing_0 = 0.0;
  static const double spacing_2 = 2.0;
  static const double spacing_4 = 4.0;
  static const double spacing_5 = 5.0;
  static const double spacing_6 = 6.0;
  static const double spacing_8 = 8.0;
  static const double spacing_10 = 10.0;
  static const double spacing_12 = 12.0;
  static const double spacing_14 = 14.0;
  static const double spacing_15 = 15.0;
  static const double spacing_16 = 16.0;
  static const double spacing_18 = 18.0;
  static const double spacing_20 = 20.0;
  static const double spacing_24 = 24.0;
  static const double spacing_30 = 30.0;
  static const double spacing_32 = 32.0;
  static const double spacing_35 = 35.0;
  static const double spacing_40 = 40.0;
  static const double spacing_50 = 50.0;
  static const double spacing_55 = 55.0;
  static const double spacing_60 = 60.0;
  static const double spacing_80 = 80.0;

  //Sizes
  static const double size_2 = 2.0;
  static const double size_4 = 4.0;
  static const double size_5 = 5.0;
  static const double size_7 = 7.0;
  static const double size_8 = 8.0;
  static const double size_10 = 10.0;
  static const double size_12 = 12.0;
  static const double size_15 = 15.0;
  static const double size_16 = 16.0;
  static const double size_18 = 18.0;
  static const double size_20 = 20.0;
  static const double size_22 = 22.0;
  static const double size_24 = 24.0;
  static const double size_25 = 25.0;
  static const double size_26 = 26.0;
  static const double size_29 = 29.0;
  static const double size_30 = 30.0;
  static const double size_33 = 33.0;
  static const double size_35 = 35.0;
  static const double size_40 = 40.0;
  static const double size_45 = 45.0;
  static const double size_50 = 50.0;
  static const double size_55 = 55.0;
  static const double size_60 = 60.0;
  static const double size_65 = 65.0;
  static const double size_75 = 75.0;
  static const double size_70 = 70.0;
  static const double size_80 = 80.0;
  static const double size_90 = 90.0;
  static const double size_100 = 100.0;
  static const double size_120 = 120.0;
  static const double size_125 = 125.0;
  static const double size_140 = 140.0;
  static const double size_150 = 150.0;
  static const double size_155 = 155.0;
  static const double size_160 = 160.0;
  static const double size_180 = 180.0;
  static const double size_190 = 190.0;
  static const double size_200 = 200.0;
  static const double size_220 = 220.0;
  static const double size_230 = 230.0;
  static const double size_240 = 240.0;
  static const double size_250 = 250.0;
  static const double size_300 = 300.0;

  //Font Size

  static const double font_11 = 11.0;
  static const double font_11_5 = 11.5;
  static const double font_10 = 10.0;
  static const double font_12 = 12.0;
  static const double font_13 = 13.0;
  static const double font_14 = 14.0;
  static const double font_15 = 15.0;
  static const double font_16 = 16.0;
  static const double font_17 = 17.0;
  static const double font_18 = 18.0;
  static const double font_19 = 19.0;
  static const double font_20 = 20.0;
  static const double font_21 = 21.0;
  static const double font_22 = 22.0;
  static const double font_23 = 23.0;
  static const double font_24 = 24.0;
  static const double font_25 = 25.0;
  static const double font_26 = 26.0;
  static const double font_27 = 27.0;
  static const double font_28 = 28.0;
  static const double font_29 = 29.0;
  static const double font_30 = 30.0;

  /// Radius

  static const double radius_2 = 2.0;
  static const double radius_3 = 3.0;
  static const double radius_5 = 5.0;
  static const double radius_6 = 6.0;
  static const double radius_8 = 8.0;
  static const double radius_10 = 10.0;
  static const double radius_0 = 0;
  static const double radius_30 = 30.0;

  /// Elevation
  static const double elevation_8 = 8.0;
  static const double elevation_5 = 5.0;

  // MaxLines
  static const int maxlines_2 = 2;

  /// Returns a vertical space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(spacing_60);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }

  static double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double deviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  // Elevation

  static const double elevation_1 = 1.0;
  static const double elevation_2 = 2.0;

  /// Opacity
  static const double opacity_0_4 = 0.4;

  /// Offset
  static const double offset_4 = 4.0;
  static const double offset_0 = 0;
  static const double offset_10 = 10.0;
}
