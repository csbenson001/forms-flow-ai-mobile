import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';

class FormsFlowCircularProgressIndicator extends StatelessWidget {
  const FormsFlowCircularProgressIndicator({Key? key, this.progressColor})
      : super(key: key);

  final Color? progressColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      width: 30.0,
      child: CircularProgressIndicator(
        color: progressColor ?? AppColor.primaryColor,
      ),
    );
  }
}
