import 'package:flutter/material.dart';

class LocationView extends StatefulWidget {
  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  String _previewImgUrl = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          child: _previewImgUrl == null
              ? Text("No Location chosen", textAlign: TextAlign.center)
              : Image.network(
                  _previewImgUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          children: [
            TextButton.icon(
              icon: Icon(
                Icons.location_on,
              ),
              label: Text('Current Location'),
              onPressed: () {},
              // onPressed: _getCurrentUserLocation,
            ),
            TextButton.icon(
              icon: Icon(
                Icons.map,
              ),
              label: Text('Select on Map'),
              onPressed: () {},

              // onPressed: _selectOnMap,
            ),
          ],
        )
      ],
    );
  }
}
