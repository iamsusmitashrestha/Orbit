import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/settings_vm.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => locator<SettingsViewModel>(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton:
            IconButton(icon: Icon(Icons.add), onPressed: () {}),
        // body: ListView(
        //   padding: AppDimens.PAGE_PADDING,
        //   children: [],
        // ),
      ),
    );
  }
}
