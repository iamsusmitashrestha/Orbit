import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/logo_image.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/role/view_models/role_selection_vm.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class RoleSelectionView extends StatefulWidget {
  @override
  _RoleSelectionViewState createState() => _RoleSelectionViewState();
}

class _RoleSelectionViewState extends State<RoleSelectionView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RoleSelectionViewModel>.reactive(
      viewModelBuilder: () => locator<RoleSelectionViewModel>(),
      builder: (context, model, child) => ListView(
        children: [
          ClipPath(
            clipper: Clipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              padding: mYPagePadding,
              color: SECONDARY_COLOR,
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/choice.svg",
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
            child: ListView(
              shrinkWrap: true,
              padding: sXPadding,
              children: [
                Container(
                  child: Text(
                    "orbit you like to use our platform?",
                    style:
                        TextStyle(fontSize: AppDimens.HEADLINE_FONT_SIZE_SMALL),
                  ),
                ),
                mHeightSpan,
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: model.role == "user"
                            ? PRIMARY_COLOR
                            : INPUT_BORDER_COLOR),
                    borderRadius: AppDimens.INPUT_BORDER_RADIUS,
                    color: Colors.white,
                  ),
                  child: RadioListTile<String>(
                    title: Text(
                      'I want to browse local stores.',
                      style: TextStyle(
                        color: model.role == "user" ? PRIMARY_COLOR : null,
                      ),
                    ),
                    value: "user",
                    groupValue: model.role,
                    onChanged: model.onRoleChanged,
                  ),
                ),
                mHeightSpan,
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: model.role == "vendor"
                            ? PRIMARY_COLOR
                            : INPUT_BORDER_COLOR),
                    borderRadius: AppDimens.INPUT_BORDER_RADIUS,
                    color: Colors.white,
                  ),
                  child: RadioListTile<String>(
                    title: Text(
                      'I want to register my store.',
                      style: TextStyle(
                        color: model.role == "vendor" ? PRIMARY_COLOR : null,
                      ),
                    ),
                    value: "vendor",
                    groupValue: model.role,
                    onChanged: model.onRoleChanged,
                    activeColor: PRIMARY_COLOR,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                KButton(
                  onPressed: model.onButtonClick,
                  child: Text("Continue"),
                  size: ButtonSize.LARGE,
                ),
                mHeightSpan,
              ],
            ),
          ),
        ],
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
