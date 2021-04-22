import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/logo_image.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_icon_button.dart';
import 'package:orbit/common/widgets/k_text_form_field.dart';

import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/profile_setup_vm.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class ProfileSetupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileSetupViewModel>.reactive(
      viewModelBuilder: () => locator<ProfileSetupViewModel>(),
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
            KTextFormField(label: "Store Name"),
            lHeightSpan,
            KTextFormField(label: "City"),
            lHeightSpan,
            Row(
              children: [
                Expanded(child: KTextFormField(label: " Location")),
                mWidthSpan,
                SizedBox(
                  width: 64,
                  height: 64,
                  child: Container(
                    decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: AppDimens.INPUT_BORDER_RADIUS,
                    ),
                    child: KIconButton(
                      iconFill: Icons.location_on,
                      filled: true,
                      fillColor: Colors.white,
                      onPressed: model.onButtonClick,

                      // size: IconButtonSize.LARGE,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.12),
            KButton(
              onPressed: model.onButtonClick,
              child: Text("Save"),
              size: ButtonSize.LARGE,
            ),
            mHeightSpan,
          ],
        ),
      ),
    );
  }
}