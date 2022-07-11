import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:formsflowai_shared/shared/app_color.dart';

import 'formsflow_white_circular_progress_indicator.dart';

class FormsFlowImageView extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxShape? boxShape;

  const FormsFlowImageView(
      {Key? key,
      required this.imageUrl,
      required this.width,
      required this.height,
      this.boxShape = BoxShape.circle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        progressIndicatorBuilder: (context, image, progress) {
          return const FormsFlowWhiteCircularProgressIndicator();
        },
        imageBuilder: (context, imageProvider) => Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                shape: boxShape!,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
        // placeholder: (context, url) => Container(
        //     alignment: Alignment.center,
        //     child: FormsFlowShimmer(
        //       width: width,
        //       height: height,
        //       boxShape: boxShape,
        //     )),

        errorWidget: (context, url, error) => Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                shape: boxShape!,
                color: AppColor.grey6,
              ),
            ));
  }
}
