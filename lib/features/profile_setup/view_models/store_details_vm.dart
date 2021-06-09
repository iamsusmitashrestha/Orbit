import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/user_data_service.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class StoreDetailsViewModel extends BaseViewModel {
  final UserDataService userDataService;
  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final Dio _dio;

  bool isSelected = false;
  bool isStoreDetailsPressed = true;
  bool isLocationPressed = false;
  TimeOfDay? openingTime;
  TimeOfDay? closingTime;

  StoreDetailsViewModel(this.userDataService, this._navigationService,
      this._snackbarService, this._dio);

  setOpeningTime(pickedTime) {
    openingTime = pickedTime;
  }

  setClosingTime(pickedTime) {
    closingTime = pickedTime;
  }

  setStoreDetailsPressed() {
    isStoreDetailsPressed = true;
    isLocationPressed = false;
    notifyListeners();
  }

  setLocationPressed() {
    isLocationPressed = true;
    isStoreDetailsPressed = false;
    notifyListeners();
  }

  goToMapView() {
    _navigationService.navigateTo(Routes.mapViewRoute);
  }

  save() async {
    try {
      setBusy(true);
      var response = await _dio.post(
        "/store/${userDataService.storeId}/time",
        data: {
          'open': openingTime,
          'close': closingTime,
        },
      );
      setBusy(false);
      // (response.data['message']);
      _snackbarService.showSnackbar(
        message: response.data['message'],
        duration: Duration(seconds: 1),
      );
      Future.delayed(const Duration(seconds: 1), () {
        _navigationService.replaceWith(Routes.splashViewRoute);
      });
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        _snackbarService.showSnackbar(
            message: "Please check your internet connection.");
      } else if (e.type == DioErrorType.response) {
        if (e.response != null) {
          String message = e.response?.data['message'];
          _snackbarService.showSnackbar(message: message);
        }
      }
    }
  }
}
