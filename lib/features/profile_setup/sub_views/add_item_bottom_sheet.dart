import 'package:flutter/material.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_bottom_sheet.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_button.dart';
import 'package:orbit/common/widgets/k_text_form_field.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/add_item_bottom_sheet_vm.dart';
import 'package:stacked/stacked.dart';

class AddItemBottomSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddItemBottomSheetViewModel>.reactive(
      viewModelBuilder: () => locator<AddItemBottomSheetViewModel>(),
      builder: (context, model, child) => KBottomSheet(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Add Item",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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
          model.isBusy
              ? KBusy()
              : KButton(
                  child: Text("Add item"),
                  onPressed: model.addItem,
                  isBusy: model.isBusy,
                )
        ],
      ),
    );
  }
}
