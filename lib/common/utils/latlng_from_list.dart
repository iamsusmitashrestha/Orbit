import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng latlngFromList(List<dynamic> location) {
  return LatLng(location[1], location[0]);
}
