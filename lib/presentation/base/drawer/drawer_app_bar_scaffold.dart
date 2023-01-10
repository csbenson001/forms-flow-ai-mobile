import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formsflowai/core/preferences/app_preference.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';

import '../../../../../../shared/app_text_styles.dart';
import '../../../core/di/injection.dart';
import '../../../shared/imageassets/formsflowai_image_assets.dart';
import '../widgets/base_stateless_widget.dart';
import 'app_drawer.dart';

/// [DrawerAppScaffold] base drawer class widget with scaffold
/// Parameters
/// [PageTitle]
/// Widget [Body]
/// [FloatingActionButton]
/// [BackGroundColor]
class DrawerAppScaffold extends BaseStatelessWidget {
  DrawerAppScaffold(
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
  final AppPreferences appPreferences = dl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        toolbarHeight: Dimens.size_55,
        centerTitle: true,

        // actions: [
        //   InkWell(
        //       onTap: () {
        //         final tokenExpiryDuration = TokenUtils.tokenExpiryTime(
        //             token: appPreferences.getAccessToken());
        //
        //         showSuccessToast(
        //             context: context,
        //             description:
        //                 "Access Token Expires in ${tokenExpiryDuration.inSeconds} Seconds");
        //       },
        //       child: const Padding(
        //         padding: EdgeInsets.only(right: 24),
        //         child: Icon(
        //           Icons.timer_sharp,
        //           color: Colors.white,
        //         ),
        //       )),
        //   InkWell(
        //       onTap: () {
        //         final tokenExpiryDuration = TokenUtils.tokenExpiryTime(
        //             token: appPreferences.getRefreshToken());
        //
        //         showSuccessToast(
        //             context: context,
        //             description:
        //                 "Refresh Token Expires in ${tokenExpiryDuration.inSeconds} Seconds");
        //       },
        //       child: const Padding(
        //         padding: EdgeInsets.only(right: 24),
        //         child: Icon(
        //           Icons.refresh,
        //           color: Colors.white,
        //         ),
        //       ))
        // ],
        actions: [
          Container(
              margin: const EdgeInsets.only(
                  left: Dimens.spacing_8, right: Dimens.spacing_16),
              width: Dimens.size_100,
              height: Dimens.size_55,
              child: SvgPicture.asset(
                FormsFlowAIImageAssets.imagesIcFormsFlowLogo,
                color: Colors.white,
                width: Dimens.size_100,
                height: Dimens.size_55,
                fit: BoxFit.contain,
              ))
        ],
        title: Text(
          pageTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.boldTextStyle(
              fontSize: Dimens.font_18, textColor: Colors.white),
        ),
        // actions: <Widget>[showCartImage()],
      ),
      drawer: const AppDrawer(),
      body: body,
    );
  }
}
