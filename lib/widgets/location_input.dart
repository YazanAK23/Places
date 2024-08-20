import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {

  Location? _pickedLocation;
  bool _isGettingLocation = false;

  void _getCurrentLocation()async{
    Location location = Location();

bool _serviceEnabled;
PermissionStatus permissionGranted;
LocationData locationData;

_serviceEnabled = await location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled = await location.requestService();
  if (!_serviceEnabled) {
    return;
  }
}

permissionGranted = await location.hasPermission();
if (permissionGranted == PermissionStatus.denied) {
  permissionGranted = await location.requestPermission();
  if (permissionGranted != PermissionStatus.granted) {
    return;
  }

}
setState(() {
_isGettingLocation = true;
  
});
locationData = await location.getLocation();

setState(() {
_isGettingLocation = false;
  
});
(log(locationData.latitude.toString()));
(log(locationData.longitude.toString()));

  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
            'No Location Chosen',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          );

          if (_isGettingLocation) {
            previewContent = const Center(
              child: CircularProgressIndicator(),
            );
          }
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: previewContent
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: Icon(Icons.location_on),
              label: Text('Get Current Location'),
            ),
             TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text('Select On Map'),
            ),
          ],
        ),
      ],
    );
  }
}
