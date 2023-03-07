import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddMarker {
  AddMarker();

  List<Marker> markers = [];

  List<Marker> getMarkers() {
    return markers;
  }

  void addCustomMarkers(double lat, double lon) async {
    // Add your custom marker images to the assets folder
    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(48, 48)), 'assets/images/marker1.png')
        .then((customMarker1) {
      // Add a custom marker at the specified latitude and longitude
      Marker marker1 = Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(lat, lon),
        icon: customMarker1,
        infoWindow: InfoWindow(title: 'Marker 1'),
      );
      markers.add(marker1);
    });
  }
}
