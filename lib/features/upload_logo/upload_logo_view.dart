import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/logo_image.dart';
import 'package:orbit/common/constants/ui_helpers.dart';

import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/upload_logo/upload_logo_vm.dart';
import 'package:stacked/stacked.dart';

class UploadLogoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UploadLogoViewModel>.reactive(
      viewModelBuilder: () => locator<UploadLogoViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Image.asset(
              logo_image,
              height: 100,
              width: 100,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              "Upload Logo",
              style: TextStyle(fontSize: AppDimens.HEADLINE_FONT_SIZE_MEDIUM),
            ),
            lHeightSpan,
            Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(shop_logo),
                    ),
                  ),
                ),
                Positioned(
                  child: Icon(Icons.edit),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
