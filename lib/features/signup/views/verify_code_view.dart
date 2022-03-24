import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/logo_image.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_text_form_field.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/signup/view_models/verify_code_vm.dart';
import 'package:stacked/stacked.dart';

class VerifyCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyCodeViewModel>.reactive(
      viewModelBuilder: () => locator<VerifyCodeViewModel>(),
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
            KTextFormField(
              label: "Code",
              onChanged: model.onCodeChanged,
            ),
            lHeightSpan,
            KButton(
              child: Text("Verify"),
              onPressed: model.onVerify,
              isBusy: model.isBusy,
            ),
          ],
        ),
      ),
    );
  }
}
