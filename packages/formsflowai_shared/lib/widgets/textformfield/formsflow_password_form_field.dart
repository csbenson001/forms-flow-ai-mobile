import 'package:flutter/material.dart';

import '../../validator/validators.dart';

class FormsFlowPasswordFormField extends StatefulWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final bool submitted;
  final bool? enabled;
  final TextEditingController? controller;
  final Function(String?)? onChanged;

  const FormsFlowPasswordFormField({
    Key? key,
    this.labelText = "Password",
    this.validator = Validators.nameValidator,
    this.inputType,
    this.submitted = true,
    this.enabled,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  State<FormsFlowPasswordFormField> createState() =>
      _FormsFlowPasswordFormFieldState();
}

class _FormsFlowPasswordFormFieldState
    extends State<FormsFlowPasswordFormField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() => _obscure = !_obscure);
          },
          icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
        ),
      ),
      validator: widget.validator,
      obscureText: _obscure,
      enableSuggestions: false,
      autocorrect: false,
      autovalidateMode: widget.submitted
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      keyboardType: widget.inputType,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      controller: widget.controller,
    );
  }
}
