import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';

import '../../../shared/dimens.dart';

class FormsFlowAICustomTextField extends StatelessWidget {
  final String? hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? icon;
  final TextInputAction? textInputAction;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool? submitted;

  const FormsFlowAICustomTextField(
      {super.key,
      this.hint,
      this.keyboardType,
      this.icon,
      this.obscureText = false,
      this.onChanged,
      this.onFieldSubmitted,
      this.errorText,
      this.textInputAction,
      required this.submitted,
      this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: AppColor.primaryColor,
      onChanged: onChanged,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      autovalidateMode: submitted != null && submitted == true
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon:
            Icon(icon, color: AppColor.primaryColor, size: Dimens.size_20),
        hintText: hint,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
            vertical: Dimens.spacing_8, horizontal: Dimens.spacing_16),
        errorMaxLines: 1,
        errorStyle: const TextStyle(fontSize: Dimens.font_12, height: 1.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.radius_30),
            borderSide: BorderSide.none),
      ),
    );
  }
}
