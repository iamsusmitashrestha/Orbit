import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orbit/common/widgets/k_busy.dart';
import 'package:orbit/common/widgets/k_error.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/features/profile_setup/view_models/map_vm.dart';
import 'package:stacked/stacked.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MapViewModel>.reactive(
      viewModelBuilder: () => locator<MapViewModel>(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          actions: [
            if (model.isLocationPicked)
              IconButton(
                icon: Icon(
                  Icons.check,
                ),
                onPressed: model.completeSelection,
              ),
          ],
        ),
        body: model.isBusy
            ? KBusy()
            : model.hasError
                ? KError(
                    error: model.modelError,
                    onPressed: model.getCurrentUserLocation,
                  )
                : GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        model.currentLocation.latitude!,
                        model.currentLocation.longitude!,
                      ),
                      zoom: 16,
                    ),
                    onTap: model.selectLocation,
                    markers: model.pickedLocation == null
                        ? {}
                        : {
                            Marker(
                              markerId: MarkerId('m1'),
                              position: (model.pickedLocation)!,
                            ),
                          },
                  ),
      ),
    );
  }
}
