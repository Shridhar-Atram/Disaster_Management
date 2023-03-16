import 'dart:async';

import 'package:disaster_management/src/features/reporting_and_mapping/location_search_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';

import 'Database/firestore_service.dart';
import 'Providers/marker_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final markerProvider = Provider.of<MarkerProvider>(context, listen: false);

    return Theme(
      data: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black54, // Change color here
          ),
          backgroundColor: Colors.green,
          title: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: const [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Search"),
                  ],
                ),
              ),
            ),
            onTap: () async {
              final result = await Navigator.of(context)
                  .pushNamed(LocationSearchDialog.routeName);

              if (result is LatLng) {
                setState(
                  () {
                    _searchLocation = result;
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
        body: Consumer<MarkerProvider>(
          builder: (context, provider, child) {
            return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _initialPosition,
              markers: Set.from(provider.markers),
              onMapCreated: (GoogleMapController controller) async {
                _controller.complete(controller);
                await FirestoreService().getDataFromFirestore(context);
              },
            );
          },
        ),
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
