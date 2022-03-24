import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:orbit/common/utils/latlng_from_list.dart';
import 'package:orbit/common/utils/time_from_string.dart';
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
  String? storeName;
  String? description;
  String? address;
  String? hints;
  bool deliveryOption = false;

  LatLng? pickedLocation;
  final TextEditingController locationController = TextEditingController();
  bool get isLocationPicked => pickedLocation != null;

  StoreDetailsViewModel(this.userDataService, this._navigationService,
      this._snackbarService, this._dio);

  initialise() {
    deliveryOption = userDataService.deliveryOption ?? false;
    pickedLocation = userDataService.location;
    address = userDataService.address;
    hints = userDataService.hints;
    locationController.text =
        "${userDataService.location!.latitude}/${userDataService.location!.longitude}";
    notifyListeners();
  }

  setOpeningTime(pickedTime) {
    openingTime = pickedTime;
  }

  setClosingTime(pickedTime) {
    closingTime = pickedTime;
  }

  onNameChanged(value) {
    storeName = value;
  }

  onDeliveryOptionChanged(value) {
    deliveryOption = !deliveryOption;
    notifyListeners();
  }

  onDescriptionChanged(value) {
    description = value;
  }

  onAddressChanged(value) {
    address = value;
  }

  onHintsChanged(value) {
    hints = value;
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

  Future<void> onSelectMap() async {
    pickedLocation =
        await _navigationService.navigateTo(Routes.mapViewRoute) as LatLng?;
    if (pickedLocation != null) {
      locationController.text =
          "${pickedLocation!.latitude}, ${pickedLocation!.longitude}";
    }
    notifyListeners();
  }

  goToMapView() {
    _navigationService.navigateTo(Routes.mapViewRoute);
  }

  save() async {
    var now = DateTime.now();

    try {
      setBusy(true);
      var response = await _dio.post(
        "/store/${userDataService.storeId}/time",
        data: {
          'name': storeName,
          'open': DateFormat("hh:mm a").format(DateTime(now.year, now.month,
              now.day, openingTime!.hour, openingTime!.minute)),
          'close': DateFormat("hh:mm a").format(DateTime(now.year, now.month,
              now.day, closingTime!.hour, closingTime!.minute)),
          'description': description,
          'deliveryOption': deliveryOption,
        },
      );
      userDataService.storeName = response.data['store']['storeName'];
      userDataService.openingTime =
          timeFromString(response.data['store']['openingTime']);
      userDataService.closingTime =
          timeFromString(response.data['store']['closingTime']);
      userDataService.storeDescription = response.data['store']['description'];
      userDataService.deliveryOption = response.data['store']['deliveryOption'];
      setBusy(false);
      _snackbarService.showSnackbar(
        message: response.data['message'],
        duration: Duration(seconds: 1),
      );
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

  saveLocation() async {
    if (isLocationPicked)
      try {
        setBusy(true);
        var response = await _dio.post(
          "/store/updateLocation",
          data: {
            'location': [pickedLocation!.longitude, pickedLocation!.latitude],
            'address': address,
            'hints': hints,
          },
        );
        userDataService.address = response.data['store']['address'];
        userDataService.location =
            latlngFromList(response.data['store']['location']);
        userDataService.hints = response.data['store']['hints'];

        setBusy(false);
        _snackbarService.showSnackbar(
          message: response.data['message'],
          duration: Duration(seconds: 1),
        );
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
