import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai/presentation/base/widgets/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/formsflow_image_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/di/injection.dart';
import '../../../core/preferences/app_preference.dart';
import '../../../core/router/app_routes.dart';
import '../../../shared/app_strings.dart';
import '../../../shared/app_text_styles.dart';

/// [AppDrawer] shows the drawer navigation menu

class AppDrawer extends BaseConsumerWidget {
  /// Inject [AppPreferences]
  static final AppPreferences appPreferences = dl();

  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
        color: AppColor.primaryColor,
        child: Drawer(
          backgroundColor: AppColor.white,
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                    padding: const EdgeInsets.only(left: Dimens.spacing_16),
                    color: AppColor.primaryColor,
                    child: _buildHeader(
                        context,
                        appPreferences.getUserImage(),
                        appPreferences.getUserName(),
                        appPreferences.getUserRole())),
              ),
              _buildDrawerItem(
                  icon: Icons.home_outlined,
                  text: Strings.navTitleHome,
                  onTap: () {
                    closeDrawer(context);
                  },
                  appRoute: AppRoutes.taskListingScreen),
              _buildDrawerItem(
                  icon: Icons.privacy_tip_outlined,
                  text: Strings.navTitlePrivacyPolicy,
                  onTap: () {
                    closeDrawer(context);
                    ref
                        .read(taskListViewModelProvider)
                        .openTermsAndConditionsUrlLauncher();
                  },
                  appRoute: AppRoutes.taskListingScreen),
              _buildDrawerItem(
                  icon: Icons.rule_sharp,
                  text: Strings.navTitleTerms,
                  onTap: () {
                    closeDrawer(context);
                    ref
                        .read(taskListViewModelProvider)
                        .openTermsAndConditionsUrlLauncher();
                  },
                  appRoute: AppRoutes.taskListingScreen),
              _buildDrawerItem(
                  icon: Icons.delete_sweep,
                  text: Strings.navTitleClearCache,
                  onTap: () {
                    closeDrawer(context);
                    ref
                        .read(taskListViewModelProvider)
                        .clearAppCache(context: context);
                  },
                  appRoute: AppRoutes.taskListingScreen),
              _buildDrawerItem(
                  icon: Icons.logout,
                  text: Strings.navLogout,
                  onTap: () async {
                    _showLogoutDialog(context: context, ref: ref);
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
                          fontSize: Dimens.font_16, textColor: Colors.white),
                    ),
                    const SizedBox(height: Dimens.size_4),
                    Text(
                      role ?? Strings.navHeaderErrorNoRoleAvailable,
                      style: AppTextStyles.semiBoldTextStyle(
                          fontSize: Dimens.font_14, textColor: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

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
  void _showLogoutDialog(
      {required BuildContext context, required WidgetRef ref}) {
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
              Scaffold.of(context).openDrawer();
              ref
                  .refresh(taskListViewModelProvider)
                  .logoutUser(context: context);
            },
            btnCancelOnPress: () {})
        .show();
  }
}
