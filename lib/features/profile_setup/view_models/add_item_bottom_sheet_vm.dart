import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class AddItemBottomSheetViewModel extends BaseViewModel {
  String itemName = "";
  String price = "";

  final Dio _dio;
  final SnackbarService _snackbarService;
  final NavigationService _navigationService;
  final UserDataService _userDataService;

  AddItemBottomSheetViewModel(this._dio, this._snackbarService,
      this._navigationService, this._userDataService);

  onNameChanged(value) {
    itemName = value;
  }

  onPriceChanged(value) {
    price = value;
  }

  void addItem() async {
    try {
      setBusy(true);
      print(itemName);
      var response = await _dio.post(
        "/product/${_userDataService.storeId}/addProduct",
        data: {
          'title': itemName,
          'price': price,
        },
      );
      _navigationService.back(result: SheetResponse(confirmed: true));
      print(response);
      setBusy(false);
    } on DioError catch (e) {
      setBusy(false);
      print(e.response);
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response?.data['message'];
        _snackbarService.showSnackbar(message: message);
      }
    }
  }
}
