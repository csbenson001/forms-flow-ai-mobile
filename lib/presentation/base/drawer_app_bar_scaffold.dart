import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';

import '../../../../../shared/app_text_styles.dart';
import '../../shared/imageassets/formsflowai_image_assets.dart';
import 'drawer/app_drawer.dart';

/// [DrawerAppScaffold] base drawer class widget with scaffold
/// Parameters
/// [PageTitle]
/// Widget [Body]
/// [FloatingActionButton]
/// [BackGroundColor]
class DrawerAppScaffold extends StatelessWidget {
  const DrawerAppScaffold(
      {required this.pageTitle,
      this.body,
      this.floatingActionButton,
      required this.backgroundColor,
      Key? key})
      : super(key: key);

  final Widget? body;
  final String pageTitle;
  final Color backgroundColor;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      appBar: AppBar(
        backgroundColor: AppColor.primarycolor,
        leadingWidth: Dimens.size_120,
        toolbarHeight: Dimens.size_55,
        centerTitle: true,
        leading: Container(
            margin: const EdgeInsets.only(left: Dimens.spacing_8),
            width: Dimens.size_120,
            height: Dimens.size_55,
            child: SvgPicture.asset(
              FormsFlowAIImageAssets.imagesIcFormsFlowLogo,
              color: Colors.white,
              width: Dimens.size_120,
              height: Dimens.size_55,
              fit: BoxFit.contain,
            )),
        title: Text(
          pageTitle,
          style: AppTextStyles.boldTextStyle(
              fontSize: Dimens.font_18, textColor: Colors.white),
        ),
        // actions: <Widget>[showCartImage()],
      ),
      endDrawer: const AppDrawer(),
      body: body,
    );
  }
}
