import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_font.dart';
import 'package:formsflowai_shared/shared/dimens.dart';

class AppTextStyles {
  /// Function to return bold text style
  /// Input Parameter
  /// [FontSize]
  /// [TextColor]
  /// ---> Returns [TextStyle]
  static TextStyle boldTextStyle(
      {required double fontSize, required Color textColor}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: textColor,
        fontFamily: AppFont.fontMontserrat);
  }

  /// Function to return heading text style
  /// Input Parameter
  /// [FontSize]
  /// [TextColor]
  /// ---> Returns [TextStyle]
  static TextStyle headingBoldTextStyle(
      {required double fontSize, required Color textColor}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: textColor,
        fontFamily: AppFont.fontMontserrat);
  }

  /// Function to return font medium text style
  /// Input Parameter
  /// [FontSize]
  /// [TextColor]
  /// ---> Returns [TextStyle]
  static TextStyle mediumTextStyle(
      {required double fontSize, required Color textColor}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: textColor,
        fontFamily: AppFont.fontMontserrat);
  }

  /// Function to return font semi bold text style
  /// Input Parameter
  /// [FontSize]
  /// [TextColor]
  /// ---> Returns [TextStyle]
  static TextStyle semiBoldTextStyle({
    required double fontSize,
    required Color textColor,
    TextInputType? keyboardType,
  }) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: textColor,
        fontFamily: AppFont.fontMontserrat);
  }

  /// Function to return font regular text style
  /// Input Parameter
  /// [FontSize]
  /// [TextColor]
  /// ---> Returns [TextStyle]
  static TextStyle regularTextStyle(
      {required double fontSize, required Color textColor}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: textColor,
        fontFamily: AppFont.fontMontserrat);
  }

  /// black bold text style font 24
  static TextStyle blackTextStyle_24 = const TextStyle(
      fontSize: Dimens.font_24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: AppFont.fontMontserrat);

  /// black medium text style font 12
  static TextStyle blackRegularTextStyle_12 = const TextStyle(
      fontSize: Dimens.font_12,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: AppFont.fontMontserrat);

  /// white bold text style font 24
  static TextStyle whiteTextStyle_24 = const TextStyle(
      fontSize: Dimens.font_24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: AppFont.fontMontserrat);

  /// white bold text style font 14
  static TextStyle whiteTextStyle_14 = const TextStyle(
      fontSize: Dimens.font_14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: AppFont.fontMontserrat);

  /// white bold text style font 16
  static TextStyle whiteTextStyleBold_16 = const TextStyle(
      fontSize: Dimens.font_16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: AppFont.fontMontserrat);

  /// black medium text style font 14
  static TextStyle blueMediumTextStyleWithHeight = const TextStyle(
      fontSize: Dimens.font_14,
      fontWeight: FontWeight.w600,
      height: 1.5,
      color: AppColor.primaryColor,
      fontFamily: AppFont.fontMontserrat);

  /// black regular text style font 14
  static TextStyle blackRegularTextStyleWithHeight_14 = const TextStyle(
      fontSize: Dimens.font_14,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: Colors.black,
      fontFamily: AppFont.fontMontserrat);

  /// white regular text style font 14
  static TextStyle whiteRegularTextStyleWithHeight_14 = const TextStyle(
      fontSize: Dimens.font_14,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: Colors.white,
      fontFamily: AppFont.fontMontserrat);
}
