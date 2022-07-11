import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:formsflowai/presentation/features/taskdetails/usecases/index.dart';
import 'package:formsflowai_shared/core/preferences/app_preference.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';
import 'package:formsflowai_shared/widgets/formsflow_image_view.dart';

import '../../../../../shared/app_text_styles.dart';
import '../../../core/di/injection.dart';
import '../../../core/router/app_routes.dart';

/// [AppDrawer] shows the drawer navigation menu

class AppDrawer extends StatelessWidget {
  /// Inject [AppPreferences] and [ClearLocalDatabaseUseCase]
  static final AppPreferences appPreferences = dl();
  static final ClearLocalDatabaseUseCase clearLocalDatabaseUseCase = dl();

  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColor.primarycolor,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: _buildHeader(context, appPreferences.getUserImage(),
                    appPreferences.getUserName(), appPreferences.getUserRole()),
              ),
              _buildDrawerItem(
                  icon: Icons.home_outlined,
                  text: Strings.navTitleHome,
                  onTap: () {
                    closeDrawer(context);
                  },
                  appRoute: AppRoutes.taskListingScreen),
              _buildDrawerItem(
                  icon: Icons.task_alt_outlined,
                  text: Strings.navTitleTasks,
                  onTap: () {
                    closeDrawer(context);
                  },
                  appRoute: AppRoutes.taskListingScreen),
              _buildDrawerItem(
                  icon: Icons.people_outline,
                  text: Strings.navTitleProfile,
                  onTap: () {
                    closeDrawer(context);
                  },
                  appRoute: AppRoutes.taskListingScreen),
              _buildDrawerItem(
                  icon: Icons.privacy_tip_outlined,
                  text: Strings.navTitlePrivacyPolicy,
                  onTap: () {
                    closeDrawer(context);
                  },
                  appRoute: AppRoutes.loginScreen),
              _buildDrawerItem(
                  icon: Icons.rule_sharp,
                  text: Strings.navTitleTerms,
                  onTap: () {
                    closeDrawer(context);
                  },
                  appRoute: AppRoutes.loginScreen),
              _buildDrawerItem(
                  icon: Icons.logout,
                  text: Strings.navLogout,
                  onTap: () async {
                    _showLogoutDialog(context);
                  },
                  appRoute: AppRoutes.logout)
            ],
          ),
        ));
  }

  /// Method to create drawer item
  /// Parameters
  /// [Icon]
  /// [Text]
  /// [OnTap] callback function
  /// [AppRoute] for routing navigation
  /// ---> [Returns] Drawer [ListItem]
  Widget _buildDrawerItem(
      {IconData? icon,
      required String text,
      GestureTapCallback? onTap,
      String? appRoute}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            size: Dimens.spacing_24,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(left: Dimens.spacing_15),
            child: Text(
              text,
              style:
                  const TextStyle(color: Colors.grey, fontSize: Dimens.font_16),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  /// Method to build drawer Header widget
  /// Parameters
  /// [BuildContext]
  /// [ImageUrl]
  /// [UserName]
  /// optional [Role]
  /// ---> [Returns] Drawer [HeaderItem]
  Widget _buildHeader(
    BuildContext context,
    String imageUrl,
    String name,
    String? role,
  ) =>
      InkWell(
          onTap: () => {},
          child: Container(
            padding: const EdgeInsets.only(left: Dimens.spacing_16),
            color: AppColor.primarycolor,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: Dimens.size_160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormsFlowImageView(
                      imageUrl: imageUrl,
                      height: Dimens.size_80,
                      width: Dimens.size_80,
                      boxShape: BoxShape.circle),
                  Padding(
                    padding: const EdgeInsets.only(left: Dimens.spacing_16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: AppTextStyles.semiBoldTextStyle(
                              fontSize: Dimens.font_16,
                              textColor: Colors.white),
                        ),
                        const SizedBox(height: Dimens.size_4),
                        Text(
                          role ?? Strings.navHeaderErrorNoRoleAvailable,
                          style: AppTextStyles.semiBoldTextStyle(
                              fontSize: Dimens.font_14,
                              textColor: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));

  /// Method to close app drawer
  /// since we have used drawer from the end
  /// open drawer closes the drawer
  /// Parameters
  /// [BuildContext]
  void closeDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  /// Method to show Logout Popup Dialog
  /// [ClearLocalDatabase] data before logging out the user
  /// [ClearSessionPreference] data before logging out the user
  /// Route --> To [LoginScreen] on logout
  /// Parameters
  /// [BuildContext]
  void _showLogoutDialog(BuildContext context) {
    AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.INFO,
            btnCancelText: Strings.homeButtonCancel,
            btnOkText: Strings.homeButtonLogout,
            padding: const EdgeInsets.all(Dimens.spacing_16),
            title: Strings.homeTitleLogout,
            desc: Strings.homeLabelLogoutDescription,
            btnOkOnPress: () async {
              // Clear database values and preferences values and logout User
              await clearLocalDatabaseUseCase.call(
                  params: const ClearLocalDatabaseUseCaseParams());
              await appPreferences.clear();
              Scaffold.of(context).openDrawer();
              RouterUtils.logoutUser(
                  context: context, routeName: AppRoutes.loginScreen);
            },
            btnCancelOnPress: () {})
        .show();
  }
}
