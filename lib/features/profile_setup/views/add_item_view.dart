import 'dart:io';

import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/carousel.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_text_form_field.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/add_item_vm.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class AddItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddItemViewModel>.reactive(
      viewModelBuilder: () => locator<AddItemViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: sPagePadding,
            children: [
              const Text(
                "Add Item",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              mHeightSpan,
              KTextFormField(
                label: "Item Name",
                onChanged: model.onNameChanged,
              ),
              sHeightSpan,
              KTextFormField(
                label: "Price (Rs.)",
                keyboardType: TextInputType.number,
                onChanged: model.onPriceChanged,
              ),
              mHeightSpan,
              Carousel(
                carouselHeight: MediaQuery.of(context).size.width * 0.8,
                itemCount: model.imageFileList.length,
                onPageChanged: model.setCarouselIndex,
                itemBuilder: (BuildContext context, int index) {
                  return Image.file(
                    File(model.imageFileList[index].path),
                    fit: BoxFit.cover,
                  );
                },
                carouselIndex: model.carouselIndex,
              ),
              lHeightSpan,
              InkWell(
                onTap: model.selectImages,
                child: Row(
                  children: [
                    Text(
                      "Add pictures",
                      style: TextStyle(
                        fontSize: 18,
                        color: PRIMARY_COLOR,
                      ),
                    ),
                    lWidthSpan,
                    Icon(
                      Icons.photo_album,
                      color: PRIMARY_COLOR,
                    ),
                  ],
                ),
              ),
              elHeightSpan,
              model.isBusy
                  ? KBusy()
                  : KButton(
                      child: Text("Add item"),
                      onPressed: model.addItem,
                      isBusy: model.isBusy,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
