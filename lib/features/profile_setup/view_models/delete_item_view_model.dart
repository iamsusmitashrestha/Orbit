import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class DeleteItemBottomSheetViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  DeleteItemBottomSheetViewModel(this._navigationService);

  void confirm() {
    _navigationService.back(
      result: SheetResponse(confirmed: true, data: "Deleted item"),
    );
  }

  void cancel() {
    _navigationService.back(
      result: SheetResponse(confirmed: false, data: "Deleted item"),
    );
  }
}
