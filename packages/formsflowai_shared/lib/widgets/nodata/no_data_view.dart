import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets.dart';
import '../../shared/app_text_styles.dart';
import '../../shared/dimens.dart';

class NoDataView extends StatelessWidget {
  final String? heading;
  final String? description;

  const NoDataView(
      {super.key, required this.heading, required this.description});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        SvgPicture.asset(
          Assets.imagesIconNoResults,
          width: Dimens.size_200,
          height: Dimens.size_200,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            heading ?? "No Data",
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
            description ?? "No Data",
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumTextStyle(
                fontSize: Dimens.font_16, textColor: Colors.black),
          ),
        )
      ],
    );
  }
}
