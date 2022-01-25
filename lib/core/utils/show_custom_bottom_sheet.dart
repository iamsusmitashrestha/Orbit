import 'package:orbit/core/di/injection.dart';
import './../../core/stacked_widgets/custom_stacked_setup.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

Future<SheetResponse?> showCustomBottomSheet(
    {required Widget widget, bool isDismissible = true}) {
  BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  return _bottomSheetService.showCustomSheet(
    data: widget,
    variant: BottomSheetType.custom,
    barrierDismissible: isDismissible,
    isScrollControlled: true,
  );
}
