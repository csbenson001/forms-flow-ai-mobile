import 'package:flutter/material.dart';

class FormsFlowOpenWebPopup extends StatelessWidget {
  const FormsFlowOpenWebPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Feature Unavailable"),
      content: const Text("This feature is not available in mobile"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Close"),
        )
      ],
    );
  }
}
