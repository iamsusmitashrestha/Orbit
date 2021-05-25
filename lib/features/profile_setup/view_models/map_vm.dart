import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:orbit/features/profile_setup/models/place.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class MapViewModel extends BaseViewModel {
  final NavigationService _navigationService;

  PlaceLocation initialLocation =
      PlaceLocation(latitude: 27.6253, longitude: 85.5561);
  bool get isLocationPicked => pickedLocation != null;
  LatLng? pickedLocation;

  MapViewModel(this._navigationService);

  selectLocation(LatLng position) {
    pickedLocation = position;
    notifyListeners();
  }

  completeSelection() {
    _navigationService.back(result: pickedLocation);
  }
}
