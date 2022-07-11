import 'package:flutter/material.dart';

class FormsFlowOpenWebPopup extends StatelessWidget {
  const FormsFlowOpenWebPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Feature Unavailable"),
      content: Text("This feature is not available in mobile"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Close"),
        )
      ],
    );
  }
}
