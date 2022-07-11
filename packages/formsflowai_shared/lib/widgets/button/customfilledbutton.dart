import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';

import '../../shared/app_font.dart';
import '../../shared/dimens.dart';

class CustomFilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final EdgeInsetsGeometry? margin;

  CustomFilledButton(
      {this.onPressed, this.buttonText, this.margin, IconData? icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      height: 50.0,
      child: InkWell(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: AppColor.primarycolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5.0,
            padding: const EdgeInsets.all(0.0),
          ),
          child: Ink(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColor.purple, AppColor.purple, AppColor.purple2],
                ),
                borderRadius: BorderRadius.circular(15.0)),
            child: Container(
              alignment: Alignment.center,
              child: ClipRect(
                child: Text(
                  buttonText!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: Dimens.font_16,
                      color: Colors.white,
                      fontFamily: AppFont.FONT_MONTERSERAT,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
