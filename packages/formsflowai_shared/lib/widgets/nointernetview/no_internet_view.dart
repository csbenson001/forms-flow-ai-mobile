import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';

import '../../assets.dart';
import '../../shared/app_text_styles.dart';

class NoInternetView extends StatelessWidget {
  final String? heading;
  final String? description;

  NoInternetView({required this.heading, required this.description});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        SvgPicture.asset(
          Assets.imagesImgNoInternet,
          width: Dimens.size_200,
          height: Dimens.size_200,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            heading ?? Strings.generalNoData,
            textAlign: TextAlign.center,
            style: AppTextStyles.boldTextStyle(
                fontSize: Dimens.font_22, textColor: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: Dimens.spacing_16,
              left: Dimens.spacing_16,
              right: Dimens.spacing_16,
              bottom: Dimens.spacing_16),
          child: Text(
            description ?? Strings.generalNoDataErrorDescription,
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumTextStyle(
                fontSize: Dimens.font_16, textColor: Colors.black),
          ),
        )
      ],
    );
  }
}
