import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:orbit/features/profile_setup/models/place.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class MapViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  // LocationData? locData;
  PlaceLocation initialLocation =
      PlaceLocation(latitude: 27.6253, longitude: 85.5561);
  bool get isLocationPicked => pickedLocation != null;

  LatLng? pickedLocation;

  MapViewModel(this._navigationService);

  // Future<LocationData> getCurrentLocation() async {
  //   final locData = await Location().getLocation();
  //   return locData;
  // }

  selectLocation(LatLng position) {
    pickedLocation = position;
    notifyListeners();
  }

  completeSelection() {
    _navigationService.back(result: pickedLocation);
  }
}
