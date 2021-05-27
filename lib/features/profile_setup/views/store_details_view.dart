import 'package:flutter/material.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/store_details_vm.dart';
import 'package:stacked/stacked.dart';

class StoreDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreDetailsViewModel>.reactive(
      viewModelBuilder: () => locator<StoreDetailsViewModel>(),
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
