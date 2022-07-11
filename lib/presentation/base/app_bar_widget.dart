import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';

import '../../shared/app_text_styles.dart';

/// [AppBarWidget] is the custom created app bar used in the formsFlow.AI
/// Mobile application
class AppBarWidget extends AppBar {
  AppBarWidget({
    Key? key,
    String pageTitle = Strings.generalTextSpacer,
    IconData? iconData,
    required BuildContext context,
    List<Widget> rightActions = const [],
  }) : super(
          key: key,
          title: Text(
            pageTitle,
            style: AppTextStyles.boldTextStyle(
                fontSize: Dimens.font_18, textColor: Colors.white),
          ),
          backgroundColor: AppColor.primarycolor,
          toolbarHeight: Dimens.size_55,
          leading: IconButton(
              onPressed: () async {
                RouterUtils.popRoute(context: context);
              },
              icon: Icon(
                iconData,
                color: Colors.white,
                size: Dimens.size_26,
              )),
          actions: rightActions,
        );
}
