import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/logo_image.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_multi_select_chip_field.dart';
import 'package:orbit/common/widgets/k_text_form_field.dart';

import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/categories/view_models/category_vm.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked/stacked.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryViewModel>.reactive(
      viewModelBuilder: () => locator<CategoryViewModel>(),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              "Select Categories",
              style: TextStyle(fontSize: AppDimens.HEADLINE_FONT_SIZE_MEDIUM),
            ),
            lHeightSpan,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KMultiSelectChipField(
                  items: [
                    "Vegetable Shop",
                    "Fruits",
                    "Kirana",
                    "Cosmetics",
                    "Mobile Phone",
                    "Clothes",
                    "Furniture",
                    "Car Showroom",
                    "Bike Showroom",
                    "Ornaments",
                    "Utensils",
                    "Electricals",
                    "Dairy",
                    "Stationary",
                  ],
                  selected: model.selectedCategories,
                  onSelectionChanged: model.onSelectionChanged,
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            KButton(
              child: Text("Save"),
              onPressed: model.onCategorySave,
            ),
            lHeightSpan,
          ],
        ),
      ),
    );
  }
}
