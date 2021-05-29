import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/logo_image.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/store_profile_vm.dart';
import 'package:orbit/features/profile_setup/widgets/profile_container.dart';
import 'package:stacked/stacked.dart';

class StoreProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreProfileViewModel>.reactive(
      viewModelBuilder: () => locator<StoreProfileViewModel>(),
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
            elHeightSpan,
            Row(
              children: [
                InkWell(
                  onTap: model.updateLogo,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      model.userDataService.logo!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Phalano Store",
                      style: TextStyle(
                        fontSize: 27,
                      ),
                    ),
                    Text(
                      "Naagdhunga Chowk, Palung",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            elHeightSpan,
            ElevatedButton(
              child: Text(
                "OPEN",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(16),
                ),
                padding: mYPadding,
              ),
              onPressed: () {},
            ),
            lHeightSpan,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: model.goToInventory,
                  child: buildProfileContainer(context, "Inventory", "", false),
                ),
                InkWell(
                  onTap: model.goToPaymentMethod,
                  child:
                      buildProfileContainer(context, "Store", "Details", true),
                ),
              ],
            ),
            sHeightSpan,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: model.goToPaymentMethod,
                  child: buildProfileContainer(
                      context, "Payment", "Methods", true),
                ),
                InkWell(
                  onTap: model.goToCategories,
                  child:
                      buildProfileContainer(context, "Categories", "", false),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
