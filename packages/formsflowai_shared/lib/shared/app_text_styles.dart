import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_font.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle boldTextStyle(
      {required double fontSize, required Color textColor}) {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
            fontFamily: AppFont.FONT_MONTERSERAT));
  }

  static TextStyle headingBoldTextStyle(
      {required double fontSize, required Color textColor}) {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: textColor,
            fontFamily: AppFont.FONT_MONTERSERAT));
  }

  static TextStyle mediumTextStyle(
      {required double fontSize, required Color textColor}) {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: textColor,
            fontFamily: AppFont.FONT_MONTERSERAT));
  }

  static TextStyle semiBoldTextStyle({
    required double fontSize,
    required Color textColor,
    TextInputType? keyboardType,
  }) {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: textColor,
            fontFamily: AppFont.FONT_MONTERSERAT));
  }

  static TextStyle regularTextStyle(
      {required double fontSize, required Color textColor}) {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: textColor,
            fontFamily: AppFont.FONT_MONTERSERAT));
  }

  static TextStyle blackTextStyle_24 = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontSize: Dimens.font_24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: AppFont.FONT_MONTERSERAT));

  static TextStyle blackRegularTextStyle_12 = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontSize: Dimens.font_12,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontFamily: AppFont.FONT_MONTERSERAT));

  static TextStyle whiteTextStyle_24 = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontSize: Dimens.font_24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: AppFont.FONT_MONTERSERAT));

  static TextStyle whiteTextStyle_14 = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontSize: Dimens.font_14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: AppFont.FONT_MONTERSERAT));

  static TextStyle whiteTextStyle_Bold_16 = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontSize: Dimens.font_16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: AppFont.FONT_MONTERSERAT));

  static TextStyle blueMediumTextStyleWithHeight = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontSize: Dimens.font_14,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: AppColor.primarycolor,
          fontFamily: AppFont.FONT_MONTERSERAT));

  static TextStyle blackRegularTextStyleWithHeight_14 = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontSize: Dimens.font_14,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: Colors.black,
          fontFamily: AppFont.FONT_MONTERSERAT));
}
