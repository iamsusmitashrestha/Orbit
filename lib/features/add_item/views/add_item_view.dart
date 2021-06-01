import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/add_item/view_models/add_item_vm.dart';
import 'package:stacked/stacked.dart';

class AddItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddItemViewModel>.reactive(
      viewModelBuilder: () => locator<AddItemViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: ListView(
          padding: AppDimens.PAGE_PADDING,
          children: [
            Text("hi"),
            Text("hi"),
          ],
        ),
      ),
    );
  }
}
