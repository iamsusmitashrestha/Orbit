import 'package:flutter/material.dart';
import 'package:orbit/common/constants/app_dimens.dart';
import 'package:orbit/common/constants/logo_image.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_multi_select_chip_field.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/categories/models/category.dart';
import 'package:orbit/features/categories/view_models/category_vm.dart';
import 'package:stacked/stacked.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryViewModel>.reactive(
      viewModelBuilder: () => locator<CategoryViewModel>(),
      onModelReady: (model) => model.initialise(),
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
            model.isBusy
                ? KBusy()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      KMultiSelectChipField<CategoryModel>(
                        items: model.categoryResponse,
                        selected: model.selectedCategories,
                        onSelectionChanged: model.onSelectionChanged,
                      ),
                    ],
                  ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            model.isBusy
                ? KBusy()
                : KButton(
                    child: Text("Save"),
                    onPressed: model.onCategorySave,
                    isBusy: model.isBusy,
                  ),
            lHeightSpan,
          ],
        ),
      ),
    );
  }
}
