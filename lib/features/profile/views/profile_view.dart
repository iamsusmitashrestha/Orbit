import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';

import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/profile_setup_vm.dart';
import 'package:stacked/stacked.dart';

class ProfileSetupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileSetupViewModel>.reactive(
      viewModelBuilder: () => locator<ProfileSetupViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: ListView(
          padding: AppDimens.PAGE_PADDING,
          children: [],
        ),
      ),
    );
  }
}
