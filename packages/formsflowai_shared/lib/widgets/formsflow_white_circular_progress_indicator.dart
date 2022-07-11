import 'package:flutter/material.dart';

class FormsFlowWhiteCircularProgressIndicator extends StatelessWidget {
  const FormsFlowWhiteCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30.0,
      width: 30.0,
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
