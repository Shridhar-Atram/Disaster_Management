import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

import '../Providers/marker_provider.dart';

class FirestoreService {
  late final FirebaseFirestore _firestore;
  FirestoreService() {
    _firestore = FirebaseFirestore.instance;
  }

  Future<void> reportDisaster(
    BuildContext context,
    String _selectedArea,
    String _selectedDisasterType,
    String _currentStatus,
  ) async {
    try {
      await _firestore.collection('disasters').add(
        {
          'area': _selectedArea,
          'disasterType': _selectedDisasterType,
          'currentStatus': _currentStatus,
        },
      );
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to report disaster: $e')),
      );
    }
  }

  Future<void> getDataFromFirestore(BuildContext context) async {
// Get a reference to the MarkerProvider
    final markerProvider = Provider.of<MarkerProvider>(context, listen: false);

// Retrieve the data from Firestore
    await _firestore.collection('disasters').get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach(
          (document) async {
            // Get the data from the document
            final disasterType = document['disasterType'];
            final area = document['area'];
            final status = document['currentStatus'];
            print(area + "I am printing area let's check if it is correct");

            List<geocoding.Location> locations =
                await geocoding.locationFromAddress(area);

            LatLng placeLocation =
                LatLng(locations[0].latitude, locations[0].longitude);
            BitmapDescriptor customMarker1 =
                BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueViolet);

            // Create a marker on the map for the disaster
            final marker = Marker(
              markerId: MarkerId(disasterType),
              position: placeLocation,
              infoWindow: InfoWindow(
                title: disasterType,
                snippet: 'Area: $area\nStatus: $status',
              ),
              icon: customMarker1,
            );

            // Add the marker to the provider
            markerProvider.addMarker(marker);
          },
        );
      },
    );
  }
}
