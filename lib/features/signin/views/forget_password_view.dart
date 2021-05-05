import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/logo_image.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_text_form_field.dart';

import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/signin/view_models/signin_vm.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class ForgetPasswordView extends StatefulWidget {
  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SigninViewModel>.reactive(
      viewModelBuilder: () => locator<SigninViewModel>(),
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
                    label: "New Password",
                    obscureText: true,
                    onChanged: model.onPasswordChanged,
                  ),
                  mHeightSpan,
                  KTextFormField(
                    label: "Confirm Password",
                    obscureText: true,
                    onChanged: model.onPasswordChanged,
                  ),
                  lHeightSpan,
                  KButton(
                    child: Text("Continue"),
                    onPressed: model.onForgetPassword,
                    size: ButtonSize.LARGE,
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
