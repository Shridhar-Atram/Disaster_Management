import 'dart:async';

import 'package:disaster_management/src/features/reporting_and_mapping/location_search_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

import 'add_marker.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = [];
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(17.277693, 74.1843535), zoom: 12);
  late LatLng _searchLocation;

  Future<void> addCustomMarkers(double lat, double lon) async {
    BitmapDescriptor customMarker1 =
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);

    Marker marker1 = Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(lat, lon),
      icon: customMarker1,
      infoWindow: const InfoWindow(title: 'Disaster here'),
    );

    _markers.add(marker1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ListTile(
          leading: const Icon(
            Icons.location_on,
          ),
          title: const Text("Search"),
          onTap: () async {
            final result = await Navigator.of(context)
                .pushNamed(LocationSearchDialog.routeName);

            if (result is LatLng) {
              setState(
                () {
                  _searchLocation = result;
                  _markers.clear();
                  _markers.add(
                    Marker(
                      markerId: const MarkerId('search'),
                      position: _searchLocation,
                      infoWindow: const InfoWindow(title: "Location"),
                    ),
                  );
                },
              );
              _goToSearchLocation();
            }
          },
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        markers: Set.from(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToSearchLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _searchLocation,
          zoom: 14,
        ),
      ),
    );
  }
}
