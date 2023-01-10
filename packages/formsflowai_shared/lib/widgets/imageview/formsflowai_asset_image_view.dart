import 'package:flutter/cupertino.dart';

import '../../shared/dimens.dart';

class FormsFlowAIAssetImageView extends StatelessWidget {
  final String assetUrl;
  final double? width;
  final double? height;

  const FormsFlowAIAssetImageView(
      {Key? key, required this.assetUrl, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetUrl,
      width: width ?? Dimens.size_24,
      height: height ?? Dimens.size_24,
    );
  }
}
