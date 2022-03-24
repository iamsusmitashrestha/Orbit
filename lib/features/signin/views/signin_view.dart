import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/logo_image.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_text_form_field.dart';

import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/signin/view_models/signin_vm.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class SigninView extends StatefulWidget {
  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SigninViewModel>.reactive(
      viewModelBuilder: () => locator<SigninViewModel>(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        body: ListView(
          children: [
            ClipPath(
              clipper: Clipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                padding: mYPagePadding,
                color: SECONDARY_COLOR,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/signin.svg",
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
              ),
            ),
            Image.asset(
              logo_image,
              height: 100,
              width: 100,
            ),
            lHeightSpan,
            Padding(
              padding: AppDimens.PAGE_PADDING,
              child: Column(
                children: [
                  KTextFormField(
                    label: "Email",
                    onChanged: model.onEmailChanged,
                    hint: "example@gmail.com",
                    // initialValue: "s@gmail.cccom",
                    validator: (value) {
                      RegExp regex =
                          RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

                      if (!regex.hasMatch(value!)) return "Invalid email";

                      return null;
                    },
                  ),
                  lHeightSpan,
                  KTextFormField(
                    label: "Password",
                    obscureText: true,
                    onChanged: model.onPasswordChanged,
                  ),
                  InkWell(
                    onTap: model.goToForgetPassword,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  KButton(
                    child: Text("Login"),
                    onPressed: model.onSignin,
                    size: ButtonSize.LARGE,
                    isBusy: model.isBusy,
                  ),
                  lHeightSpan,
                  InkWell(
                    child: Text(
                      "Create an account",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: SECONDARY_COLOR, fontSize: 16),
                    ),
                    onTap: model.onCreateAccountClick,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    var controllPoint = Offset(size.width * 0.5, size.height * 0.66);
    var endPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.arcToPoint(endPoint);

    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
