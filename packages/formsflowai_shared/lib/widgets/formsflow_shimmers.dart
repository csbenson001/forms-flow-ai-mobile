import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:shimmer/shimmer.dart';

class FormsFlowShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxShape? boxShape;

  const FormsFlowShimmer({Key? key, this.width, this.height, this.boxShape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          color: AppColor.grey7,
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: boxShape!,
            color: AppColor.grey6,
          ),
        ));
  }
}
