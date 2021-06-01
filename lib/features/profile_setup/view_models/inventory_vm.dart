import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:orbit/features/profile_setup/models/items.dart';
import 'package:orbit/features/profile_setup/sub_views/delete_item_bottom_sheet.dart';
import '../sub_views/add_item_bottom_sheet.dart';
import '../../../core/utils/show_custom_bottom_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class InventoryViewModel extends BaseViewModel {
  List<ItemModel> items = [];

  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final Dio _dio;
  final UserDataService _userDataService;

  InventoryViewModel(this._navigationService, this._dio, this._userDataService,
      this._snackbarService);

  void initialise() {
    getItem();
  }

  addItem() async {
    SheetResponse? response = await showCustomBottomSheet(
      widget: AddItemBottomSheetView(),
    );
    if (response != null && response.confirmed) {
      getItem();
    }
  }

  getItem() async {
    print("before try");
    setBusy(true);
    try {
      var response =
          await _dio.get("/store/${_userDataService.storeId}/getProduct");
      items = response.data
          .map<ItemModel>((item) => ItemModel.fromJson(item))
          .toList();
      setBusy(false);
    } on DioError catch (e) {
      print("catch");

      setError("Something went wrong !");
      print(e);
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        print(e.message);
        String message = "";
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
  }

  void deleteItem(int index) async {
    SheetResponse? response = await showCustomBottomSheet(
      widget: DeleteItemBottomSheetView(),
    );

    try {
      setBusy(true);
      if (response != null && response.confirmed) {
        var response = await _dio.delete("/product/${items[index].id}");
        items.removeAt(index);
        notifyListeners();
      }
      setBusy(false);
    } on DioError catch (e) {
      setBusy(false);
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = "";

        _snackbarService.showSnackbar(message: message.trim());
      }
    }
  }

  goToStoreProfile() {
    _navigationService.back();
  }
}
