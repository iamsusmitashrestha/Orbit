import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:orbit/features/profile_setup/models/items.dart';
import 'package:orbit/features/profile_setup/sub_views/delete_item_bottom_sheet.dart';
import '../../../core/utils/show_custom_bottom_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class InventoryViewModel extends BaseViewModel {
  List<ItemModel> items = [];
  int carouselIndex = 0;

  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final Dio dio;
  final UserDataService _userDataService;

  InventoryViewModel(this._navigationService, this.dio, this._userDataService,
      this._snackbarService);

  void initialise() {
    getItem();
  }

  setCarouselIndex(index) {
    carouselIndex = index;
    notifyListeners();
  }

  addItem() async {
    _navigationService.navigateTo(Routes.addItemViewRoute);
  }

  String search = "";

  onSearchChange(value) {
    search = value;
    notifyListeners();
  }

  getItem() async {
    setBusy(true);
    try {
      print("sus get");
      var response =
          await dio.get("/store/${_userDataService.storeId}/getProduct");
      print("sus call");

      items = response.data
          .map<ItemModel>(
              (item) => ItemModel.fromJson(item, dio.options.baseUrl))
          .toList();
      print("sus called");

      setBusy(false);
    } on DioError catch (e) {
      setError("Something went wrong !");
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = "";
        _snackbarService.showSnackbar(message: message.trim());
      }
    }
  }

  Future<void> showMyDialog(int index, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you want to delete this product?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This will remove the product permanently.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                try {
                  setBusy(true);
                  var response =
                      await dio.delete("/product/${items[index].id}");
                  items.removeAt(index);
                  notifyListeners();
                  Navigator.of(context).pop();

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
              },
            ),
          ],
        );
      },
    );
  }

  goToStoreProfile() {
    _navigationService.back();
  }
}
