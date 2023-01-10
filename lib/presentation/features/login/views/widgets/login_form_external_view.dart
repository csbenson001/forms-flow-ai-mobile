import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/button/customfilledbutton.dart';
import 'package:formsflowai_shared/widgets/formsflow_circular_progress_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../shared/app_status.dart';
import '../../../../../shared/app_strings.dart';
import '../../../../../shared/app_text_styles.dart';
import '../../../../../shared/imageassets/formsflowai_image_assets.dart';
import '../../../../base/widgets/base_consumer_widget.dart';

class LoginFormExternalView extends BaseConsumerWidget {
  const LoginFormExternalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loginViewModelProvider
        .select((value) => value.showLoginApiLoadingProgress));

    return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(children: [
          Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: Dimens.spacing_10),
              child: SvgPicture.asset(
                FormsFlowAIImageAssets.imagesFormsflowaiIcon,
                width: Dimens.size_200,
                height: Dimens.size_120,
                color: Colors.white,
                fit: BoxFit.cover,
              )),
          Text(
            Strings.loginTitle,
            style: AppTextStyles.whiteTextStyle_24,
          ),
          isLoading == LoginStatus.loading ||
                  isLoading == LoginStatus.success ||
                  isLoading == LoginStatus.launched
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: Dimens.spacing_16),
                  child: Column(
                    children: [
                      const FormsFlowCircularProgressIndicator(
                        progressColor: Colors.white,
                      ),
                      const SizedBox(height: Dimens.size_16),
                      if (isLoading == LoginStatus.success)
                        Text(
                          Strings.loginLabelLoggingIn,
                          style:
                              AppTextStyles.whiteRegularTextStyleWithHeight_14,
                        )
                    ],
                  ))
              : CustomFilledButton(
                  buttonText: Strings.loginButtonTitle,
                  onPressed: () {
                    ref
                        .read(loginViewModelProvider)
                        .loginUserKeycloakExternal();
                  },
                  margin: const EdgeInsets.only(
                      top: Dimens.spacing_40,
                      bottom: Dimens.spacing_16,
                      left: Dimens.size_80,
                      right: Dimens.size_80)),
        ]));
  }
}
