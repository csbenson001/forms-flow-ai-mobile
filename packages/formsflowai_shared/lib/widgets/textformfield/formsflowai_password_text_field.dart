import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';

import '../../../shared/dimens.dart';

class FormsFlowAIPasswordTextField extends StatelessWidget {
  final String? hint;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final IconData? icon;
  final TextInputAction? textInputAction;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final bool? passwordVisible;
  final VoidCallback? onPressed;
  final TextEditingController? controller;
  final bool? submitted;

  const FormsFlowAIPasswordTextField(
      {super.key,
      this.hint,
      this.keyboardType,
      this.icon,
      this.obscureText,
      this.onChanged,
      this.onFieldSubmitted,
      required this.submitted,
      this.errorText,
      this.textInputAction,
      this.passwordVisible,
      this.onPressed,
      this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      cursorColor: AppColor.primaryColor,
      onChanged: onChanged,
      controller: controller,
      textInputAction: textInputAction,
      obscureText: obscureText!,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: submitted != null && submitted == true
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon:
            Icon(icon, color: AppColor.primaryColor, size: Dimens.size_20),
        hintText: hint,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
            vertical: Dimens.spacing_8, horizontal: Dimens.spacing_20),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            passwordVisible! ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: onPressed,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.radius_30),
            borderSide: BorderSide.none),
      ),
    );
  }
}
