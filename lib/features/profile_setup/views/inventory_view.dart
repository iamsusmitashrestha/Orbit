import 'package:flutter/material.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/inventory_vm.dart';
import 'package:stacked/stacked.dart';

class InventoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InventoryViewModel>.reactive(
      viewModelBuilder: () => locator<InventoryViewModel>(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: model.addItem,
        ),
        // body: ListView(
        //   padding: AppDimens.PAGE_PADDING,
        //   children: [],
        // ),
      ),
    );
  }
}
