import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/features/profile/view_models/searched_profile_vm.dart';
import 'package:stacked/stacked.dart';

class SearchedMapView extends ViewModelWidget<SearchedProfileViewModel> {
  final num latitude;
  final num longitude;
  final String storeName;
  // final List<num> location;

  SearchedMapView(
      {required this.storeName,
      required this.latitude,
      required this.longitude});
  @override
  Widget build(BuildContext context, SearchedProfileViewModel model) {
    return model.isBusy
        ? KBusy()
        : GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(latitude.toDouble(), longitude.toDouble()),
              zoom: 16,
            ),
            markers: {
              Marker(
                infoWindow: InfoWindow(
                  title: storeName,
                ),
                markerId: MarkerId(
                  'm1',
                ),
                position: LatLng(latitude.toDouble(), longitude.toDouble()),
              ),
            },
          );
  }
}
