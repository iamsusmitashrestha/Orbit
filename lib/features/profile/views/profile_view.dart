import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile/view_models/profile_vm.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => locator<ProfileViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: ListView(
          padding: AppDimens.PAGE_PADDING,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: model.goBack,
                ),
                sWidthSpan,
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    model.userDataService.logo!,
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                ),
                sWidthSpan,
                Text(
                  "Butcher",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
