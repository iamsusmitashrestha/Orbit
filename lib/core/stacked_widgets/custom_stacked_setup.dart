import 'package:orbit/core/di/injection.dart';
import 'package:stacked_services/stacked_services.dart';

import 'custom_bottom_sheet.dart';

enum BottomSheetType {
  custom,
}

void customStackedSetup() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.custom: (context, sheetRequest, completer) =>
        CustomBottomSheet(request: sheetRequest, completer: completer)
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
