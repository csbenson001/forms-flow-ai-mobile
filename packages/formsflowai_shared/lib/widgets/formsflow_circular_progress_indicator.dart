import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';

class FormsFlowCircularProgressIndicator extends StatelessWidget {
  const FormsFlowCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30.0,
      width: 30.0,
      child: CircularProgressIndicator(
        color: AppColor.primarycolor,
      ),
    );
  }
}
