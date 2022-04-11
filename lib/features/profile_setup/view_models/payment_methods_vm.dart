import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/services/user_data_service.dart';
import 'package:orbit/features/profile_setup/sub_views/image_source_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class PaymentMethodViewModel extends BaseViewModel {
  final UserDataService userDataService;
  final SnackbarService _snackbarService;
  final Dio dio;

  List<String> paymentOptions = [];

  PaymentMethodViewModel(this.userDataService, this._snackbarService, this.dio);

  initialise() {
    getData();
  }

  getData() async {
    setBusy(true);
    try {
      var response =
          await dio.get("/store/getpaymentQR/" + userDataService.storeId!);
      paymentOptions = response.data
          .map<String>((paymentOption) => paymentOption.toString())
          .toList();
    } on DioError catch (e) {
      setError("Something went wrong !");
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        String message = e.response!.data['message'];

        _snackbarService.showSnackbar(message: message.trim());
      }
    }
    setBusy(false);
  }

  addQR(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => ImageSourceDialog(onSucces: () {
              getData();
            }));
  }
}
