import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class ProfileSetupViewModel extends BaseViewModel {
  final TextEditingController locationController = TextEditingController();

  final NavigationService _navigationService;

  LatLng? pickedLocation;
  bool get isLocationPicked => pickedLocation != null;

  ProfileSetupViewModel(this._navigationService);

  Future<void> onSelectMap() async {
    pickedLocation = await _navigationService.navigateTo(Routes.mapViewRoute);
    if (pickedLocation != null) {
      locationController.text =
          "${pickedLocation!.latitude}, ${pickedLocation!.longitude}";
    }
    notifyListeners();
  }

  onButtonClick() {
    _navigationService.navigateTo(Routes.categoryViewRoute);
  }
}
