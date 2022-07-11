import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai/presentation/features/login/viewmodel/login_state_notifier.dart';
import 'package:formsflowai_shared/core/base/base_hooks_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_font.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/button/customfilledbutton.dart';
import 'package:formsflowai_shared/widgets/textformfield/formsflowai_password_text_field.dart';
import 'package:formsflowai_shared/widgets/textformfield/formsflowai_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../shared/app_text_styles.dart';
import '../../../../../shared/imageassets/formsflowai_image_assets.dart';

class LoginFormView extends BaseHooksConsumerWidget {
  // Form Key
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  const LoginFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch loginViewState password visible
    // for the showing/hiding the password
    final isPasswordVisible = ref
        .watch(loginStateProvider.select((value) => value.isPasswordVisible));

    /// watch loginViewState submitted value to update page submission status
    /// for enabling auto validation
    final isSubmitted =
        ref.watch(loginStateProvider.select((value) => value.isSubmitted));

    /// watch loginViewState agreed to terms
    /// for the login validation
    final isAgreedToTerms =
        ref.watch(loginStateProvider.select((value) => value.isAgreedToTerms));

    final _userNameController = useTextEditingController();
    final _passwordController = useTextEditingController();

    return Form(
        key: _formKey,
        child: SingleChildScrollView(
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
              const Text(
                Strings.loginTitle,
                style: AppTextStyles.whiteTextStyle_24,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: Dimens.spacing_50,
                      left: Dimens.spacing_32,
                      right: Dimens.spacing_32),
                  child: FormsFlowAICustomTextField(
                      controller: _userNameController,
                      keyboardType: TextInputType.name,
                      submitted: isSubmitted,
                      validator: (value) =>
                          value!.isEmpty ? Strings.loginErrorUserName : null,
                      icon: Icons.supervised_user_circle_outlined,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).nextFocus(),
                      hint: Strings.loginHintUserName)),
              Padding(
                  padding: const EdgeInsets.only(
                      top: Dimens.spacing_40,
                      left: Dimens.spacing_32,
                      right: Dimens.spacing_32),
                  child: FormsFlowAIPasswordTextField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      icon: Icons.lock,
                      submitted: isSubmitted,
                      obscureText: !isPasswordVisible,
                      passwordVisible: isPasswordVisible,
                      textInputAction: TextInputAction.done,
                      validator: (value) =>
                          value!.isEmpty ? Strings.loginErrorPassword : null,
                      onPressed: () {
                        ref
                            .read(loginViewModelProvider)
                            .updatePasswordVisible();
                      },
                      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                      hint: Strings.loginHintPassword)),
              Padding(
                  padding: const EdgeInsets.only(
                      top: Dimens.spacing_32,
                      left: Dimens.spacing_32,
                      right: Dimens.spacing_32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Dimens.size_30,
                        height: Dimens.size_30,
                        child: Checkbox(
                          value: isAgreedToTerms,
                          checkColor: AppColor.white,
                          activeColor: AppColor.primarycolor,
                          onChanged: (value) {
                            ref
                                .read(loginViewModelProvider)
                                .updateAgreedToTermsAndConditions(
                                    isAgreed: value ?? false);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: Dimens.size_5,
                      ),
                      Expanded(
                          child: RichText(
                              maxLines: Dimens.maxlines_2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: Strings
                                      .loginLabelAgreeToFormsFlowaiPolicy,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimens.font_12,
                                      fontFamily: AppFont.FONT_MONTERSERAT,
                                      overflow: TextOverflow.ellipsis),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            ' ${Strings.loginLabelTermsConditions}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent,
                                            fontSize: Dimens.font_12,
                                            fontFamily:
                                                AppFont.FONT_MONTERSERAT,
                                            fontStyle: FontStyle.normal,
                                            overflow: TextOverflow.ellipsis),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            launch(
                                                "https://fahad-aot.github.io/terms_and_conditions/");
                                          })
                                  ]))),
                    ],
                  )),
              CustomFilledButton(
                  buttonText: Strings.loginButtonTitle,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate() && isAgreedToTerms) {
                      ref.read(loginViewModelProvider).loginUser(
                          userName: _userNameController.text.trim(),
                          password: _passwordController.text.trim());
                    } else if (_formKey.currentState!.validate()) {
                      showErrorToast(
                          context: context,
                          description: Strings.loginLabelAgreeToTerms);
                    }
                    if (!isSubmitted) {
                      ref.read(loginViewModelProvider).updateSubmittedStatus();
                    }
                  },
                  margin: const EdgeInsets.only(
                      top: Dimens.spacing_40,
                      bottom: Dimens.spacing_16,
                      left: Dimens.size_80,
                      right: Dimens.size_80)),
            ])));
  }
}
