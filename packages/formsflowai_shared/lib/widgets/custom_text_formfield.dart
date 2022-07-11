import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';

import '../shared/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? icon;
  final TextInputAction? textInputAction;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final bool? enabled;

  const CustomTextFormField(
      {this.hint,
      this.keyboardType,
      this.icon,
      this.obscureText = false,
      this.onChanged,
      this.onFieldSubmitted,
      this.errorText,
      this.textInputAction,
      this.initialValue,
      this.validator,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      keyboardType: keyboardType,
      cursorColor: AppColor.primarycolor,
      onChanged: onChanged,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      initialValue: initialValue,
      validator: validator,
      enabled: enabled,
      style: AppTextStyles.regularTextStyle(
          fontSize: Dimens.font_13, textColor: Colors.black),
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        isDense: true, // Added this
        contentPadding: const EdgeInsets.all(8),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.grey)),
        hintText: hint,
        hintStyle: AppTextStyles.regularTextStyle(
            fontSize: Dimens.font_13, textColor: AppColor.grey4),
      ),
    ));
  }
}
