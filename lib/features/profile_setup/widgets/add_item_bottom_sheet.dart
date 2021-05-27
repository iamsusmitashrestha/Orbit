import 'package:flutter/material.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/add_item_bottom_sheet_vm.dart';
import 'package:stacked/stacked.dart';

class AddItemBottomSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddItemBottomSheetViewModel>.reactive(
      viewModelBuilder: () => locator<AddItemBottomSheetViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            Text("hi"),
            Text("he"),
          ],
        ),
      ),
    );
  }
}
