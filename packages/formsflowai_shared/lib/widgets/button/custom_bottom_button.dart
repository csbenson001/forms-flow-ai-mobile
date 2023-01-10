import 'package:flutter/material.dart';

import '../../shared/app_text_styles.dart';
import '../../shared/dimens.dart';

class CustomBottomFilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final Color? backgroundColor;

  const CustomBottomFilledButton(
      {super.key, this.onPressed, this.buttonText, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    if (buttonText != null) {
      return Positioned(
          bottom: Dimens.none,
          child: InkWell(
              onTap: onPressed,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: Dimens.size_60,
                  color: backgroundColor,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        buttonText!,
                        style: AppTextStyles.whiteTextStyleBold_16,
                      )))));
    }
    return const SizedBox();
  }
}
