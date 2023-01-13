import 'package:flutter/material.dart';

class FormsflowPrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool enabled;

  const FormsflowPrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF34C3A7),
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      child: Text(text),
    );
  }
}
