import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_font.dart';
import 'package:formsflowai_shared/shared/dimens.dart';

/// [AppTextStyles] contains all text styles used in the formsFlow.ai
/// mobile application

class AppTextStyles {
  /// Returns [Bold] font text style
  static TextStyle boldTextStyle(
      {required double fontSize, required Color textColor}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: textColor,
        fontFamily: AppFont.FONT_MONTERSERAT);
  }

  /// Returns [Heading] font text style
  static TextStyle headingBoldTextStyle(
      {required double fontSize, required Color textColor}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: textColor,
        fontFamily: AppFont.FONT_MONTERSERAT);
  }

  /// Returns [Medium] font text style
  static TextStyle mediumTextStyle(
      {required double fontSize, required Color textColor}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: textColor,
        fontFamily: AppFont.FONT_MONTERSERAT);
  }

  /// Returns [SemiBold] font text style
  static TextStyle semiBoldTextStyle({
    required double fontSize,
    required Color textColor,
    TextInputType? keyboardType,
  }) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: textColor,
        fontFamily: AppFont.FONT_MONTERSERAT);
  }

  /// Returns [Regular] font text style
  static TextStyle regularTextStyle(
      {required double fontSize, required Color textColor}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: textColor,
        fontFamily: AppFont.FONT_MONTERSERAT);
  }

  /// Returns [Bold][Black] font text style with text size 24
  static const blackTextStyle_24 = TextStyle(
      fontSize: Dimens.font_24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: AppFont.FONT_MONTERSERAT);

  /// Returns [Regular][Black] font text style with text size 12
  static const blackRegularTextStyle_12 = TextStyle(
      fontSize: Dimens.font_12,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: AppFont.FONT_MONTERSERAT);

  /// Returns [Bold][White] font text style with text size 24
  static const whiteTextStyle_24 = TextStyle(
      fontSize: Dimens.font_24,
      fontWeight: FontWeight.bold,
      fontFamily: AppFont.FONT_MONTERSERAT,
      color: Colors.white);

  /// Returns [Bold][White] font text style with text size 14
  static const whiteTextStyle_14 = TextStyle(
      fontSize: Dimens.font_14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: AppFont.FONT_MONTERSERAT);

  /// Returns [Bold][White] font text style with text size 16
  static const whiteTextStyle_Bold_16 = TextStyle(
      fontSize: Dimens.font_16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: AppFont.FONT_MONTERSERAT);

  /// Returns [Bold][Blue] font text style with text size 14 with custom height
  static const blueMediumTextStyleWithHeight = TextStyle(
      fontSize: Dimens.font_14,
      fontWeight: FontWeight.w600,
      height: 1.5,
      color: AppColor.primarycolor,
      fontFamily: AppFont.FONT_MONTERSERAT);

  /// Returns [Bold][Regular] font text style with text size 14
  static const blackRegularTextStyleWithHeight_14 = TextStyle(
      fontSize: Dimens.font_14,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: Colors.black,
      fontFamily: AppFont.FONT_MONTERSERAT);
}
