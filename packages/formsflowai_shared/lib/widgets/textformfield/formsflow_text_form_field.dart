import 'package:flutter/material.dart';

import '../../../shared/dimens.dart';
import '../../shared/app_color.dart';
import '../../shared/app_text_styles.dart';

class FormsFlowTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final bool submitted;
  final bool? enabled;
  final bool obscure;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final IconData? icon;
  final ValueChanged<String>? onFieldSubmitted;

  const FormsFlowTextFormField(
      {Key? key,
      this.labelText,
      this.hintText,
      this.validator,
      this.inputType,
      this.submitted = true,
      this.enabled,
      this.obscure = false,
      this.controller,
      this.onChanged,
      this.textInputAction,
      this.icon,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // decoration: InputDecoration(
      //   labelText: labelText,
      //   hintText: hintText,
      //   border: OutlineInputBorder(
      //       // borderRadius: BorderRadius.all(Radius.circular(10)),
      //       borderRadius: BorderRadius.circular(10)),
      // ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        isDense: true, // Added this
        contentPadding: const EdgeInsets.all(8),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.grey)),
        hintText: hintText,
        hintStyle: AppTextStyles.regularTextStyle(
            fontSize: Dimens.font_13, textColor: AppColor.grey4),
      ),
      validator: validator,
      autovalidateMode:
          submitted ? AutovalidateMode.always : AutovalidateMode.disabled,
      keyboardType: inputType,
      onChanged: onChanged,
      enabled: enabled,
      controller: controller,
      obscureText: obscure,
      textInputAction: textInputAction,
    );
  }
}
