import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

import '../Providers/marker_provider.dart';

class FirestoreService {
  late final FirebaseFirestore _firestore;
  List<String> downloadUrls = [];

  FirestoreService() {
    _firestore = FirebaseFirestore.instance;
  }
  Future<void> reportDisaster(
    BuildContext context,
    String selectedArea,
    String selectedDisasterType,
    String currentStatus,
    String district,
    List<Asset> images,
  ) async {
    try {
      await uploadImagesToFirestore(images);
      await _firestore.collection('disasters').add(
        {
          'area': selectedArea,
          'disasterType': selectedDisasterType,
          'currentStatus': currentStatus,
          'district': district,
          'ImageUrls': downloadUrls,
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
            // Get the data from the documentxs
            final disasterType = document['disasterType'];
            final area = document['area'];
            final status = document['currentStatus'];

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

  Future<String> uploadImageToFirebase(
      Asset asset, FirebaseStorage storage) async {
    final byteData = await asset.getByteData();

    final tempFile =
        File("${(await getTemporaryDirectory()).path}/${asset.name}");

    final file = await tempFile.writeAsBytes(
      byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
    );

    // Upload the image to Firebase Storage
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageReference = storage.ref().child("images/$fileName.jpg");
    final uploadTask =
        await storageReference.putFile(file).whenComplete(() => null);
    String downloadUrl = await uploadTask.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<void> uploadImagesToFirestore(List<Asset> images) async {
    FirebaseStorage storage = FirebaseStorage.instance;

    for (Asset image in images) {
      String downloadUrl = await uploadImageToFirebase(image, storage);
      downloadUrls.add(downloadUrl);
    }
  }
}
