import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/common/constants/ui_helpers.dart';
import 'package:orbit/common/widgets/k_bottom_sheet.dart';
import 'package:orbit/common/widgets/k_text_button.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:stacked/stacked.dart';
import '../view_models/delete_item_view_model.dart';

@injectable
class DeleteItemBottomSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeleteItemBottomSheetViewModel>.reactive(
      viewModelBuilder: () => locator<DeleteItemBottomSheetViewModel>(),
      builder: (context, model, child) => KBottomSheet(
        children: [
          Text(
            "Do you want to delete ?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          mHeightSpan,
          Row(
            children: [
              Expanded(
                child: KTextButton(
                  text: "No",
                  onPressed: model.cancel,
                ),
              ),
              mWidthSpan,
              Expanded(
                child: KTextButton(
                  onPressed: model.confirm,
                  text: "Yes",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
