import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/logo_image.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_text_form_field.dart';

import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/signup/view_models/signup_vm.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => locator<SignupViewModel>(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        body: ListView(
          padding: AppDimens.PAGE_PADDING,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Image.asset(
              logo_image,
              height: 100,
              width: 100,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Column(
              children: [
                KTextFormField(
                  label: "Name",
                  onChanged: model.onNameChanged,
                ),
                lHeightSpan,
                KTextFormField(
                  label: "Email",
                  onChanged: model.onEmailChanged,
                  hint: "example@gmail.com",
                  // initialValue: "s@gmail.cccom",
                  validator: (value) {
                    RegExp regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

                    if (!regex.hasMatch(value!)) return "Invalid email";

                    return null;
                  },
                ),
                lHeightSpan,
                KTextFormField(
                  label: "Contact Number",
                  onChanged: model.onContactNoChanged,
                ),
                lHeightSpan,
                KTextFormField(
                  label: "Password",
                  obscureText: true,
                  onChanged: model.onPasswordChanged,
                ),
                lHeightSpan,
                KTextFormField(
                  label: "Confirm Password",
                  obscureText: true,
                  onChanged: model.onConfirmPasswordChanged,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                KButton(
                  child: Text("Sign Up"),
                  onPressed: model.onSignup,
                  size: ButtonSize.LARGE,
                  isBusy: model.isBusy,
                ),
                lHeightSpan,
                InkWell(
                  child: Text(
                    "Login",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: SECONDARY_COLOR, fontSize: 16),
                  ),
                  onTap: model.goToLogin,
                ),
                lHeightSpan,
                InkWell(
                  child: Text(
                    "Verify Code",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: SECONDARY_COLOR, fontSize: 16),
                  ),
                  onTap: model.goToCodeVerify,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
