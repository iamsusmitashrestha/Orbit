import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/logo_image.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/upload_logo/upload_logo_vm.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class UploadLogoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UploadLogoViewModel>.reactive(
      viewModelBuilder: () => locator<UploadLogoViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: SizedBox.expand(
          child: Padding(
            padding: sPagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Image.asset(
                  logo_image,
                  height: 100,
                  width: 100,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Text(
                  "Upload Logo",
                  style: TextStyle(
                    fontSize: AppDimens.HEADLINE_FONT_SIZE_MEDIUM,
                  ),
                ),
                elHeightSpan,
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    model.image != null
                        ? new CircleAvatar(
                            backgroundImage: new FileImage(model.image!),
                            radius: 100.0,
                          )
                        : Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CHIP_GREY,
                            ),
                          ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: PRIMARY_COLOR,
                      ),
                      child: IconButton(
                        onPressed: model.getImage,
                        icon: Icon(Icons.edit_outlined),
                        color: Colors.white,
                        autofocus: true,
                      ),
                    ),
                  ],
                ),
                elHeightSpan,
                elHeightSpan,
                // SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                KButton(
                  isBusy: model.isBusy,
                  child: Text("Upload"),
                  size: ButtonSize.LARGE,
                  onPressed: model.uploadLogo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
