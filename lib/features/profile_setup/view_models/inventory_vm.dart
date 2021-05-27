import 'package:injectable/injectable.dart';
import '../widgets/add_item_bottom_sheet.dart';
import '../../../core/utils/show_custom_bottom_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class InventoryViewModel extends BaseViewModel {
  List items = [];

  addItem() async {
    SheetResponse? response = await showCustomBottomSheet(
      widget: AddItemBottomSheetView(),
    );
    if (response != null && response.confirmed) {
      items.add(response.responseData);
      notifyListeners();
    }
  }
}
