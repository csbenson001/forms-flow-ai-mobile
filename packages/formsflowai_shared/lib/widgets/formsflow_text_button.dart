import 'package:flutter/material.dart';

class FormsFlowTextButton extends StatelessWidget {
  final void Function() onPressed;
  final bool enabled;
  final Widget child;

  const FormsFlowTextButton({
    Key? key,
    required this.onPressed,
    this.enabled = true,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
