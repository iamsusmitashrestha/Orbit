import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class ProfileSetupViewModel extends BaseViewModel {
  final TextEditingController locationController = TextEditingController();
  String storeName = "";
  String storeAddress = "";
  LatLng? pickedLocation;
  bool get isLocationPicked => pickedLocation != null;

  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final LocalStorageService localStorageService;
  final Dio _dio;

  ProfileSetupViewModel(this._navigationService, this._snackbarService,
      this._dio, this.localStorageService);

  onStoreNameChanged(value) {
    storeName = value;
  }

  onStoreAddressChanged(value) {
    storeAddress = value;
  }

  Future<void> onSelectMap() async {
    pickedLocation = await _navigationService.navigateTo(Routes.mapViewRoute);
    if (pickedLocation != null) {
      locationController.text =
          "${pickedLocation!.latitude}, ${pickedLocation!.longitude}";
    }
    notifyListeners();
  }

  onSaveButtonClick() async {
    try {
      setBusy(true);
      if (pickedLocation != null) {
        var response = await _dio.post(
          "/store/addStore",
          data: {
            'storeName': storeName,
            'address': storeAddress,
            'location': [pickedLocation!.longitude, pickedLocation!.latitude],
          },
        );
        setBusy(false);
        _snackbarService.showSnackbar(
          message: response.data['message'],
          duration: Duration(seconds: 1),
        );
        Future.delayed(const Duration(seconds: 1), () {
          _navigationService.replaceWith(Routes.splashViewRoute);
        });
      }
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
    _navigationService.navigateTo(Routes.categoryViewRoute);
  }
}
