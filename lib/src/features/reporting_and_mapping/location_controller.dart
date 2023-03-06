import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class NetworkUtilities {
  static Future<http.Response?> fetchUrl(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        return response;
      } else {
        print("Some errror occured");
      }
    } catch (e) {
      debugPrint(e.toString());
      print("In catch block");
    }
    return null;
  }
}

class LocationService {
  LocationService();
  http.Response? response;

  Future<http.Response?> getLocationData(String text) async {
    Uri uri = Uri.https(
      "maps.googleapis.com",
      "maps/api/place/autocomplete/json",
      {
        "input": text,
        "key": "AIzaSyDVCuQ3OOs-zdMhB_9g1E16TOI4eadthOU",
      },
    );
    response = await NetworkUtilities.fetchUrl(uri);

    return response;
  }
}

class LocationController extends GetxController {
  late GoogleMapController _mapController;

  // Define a public method to set the map controller
  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  // Define a method to call the Google Maps Places API to get the details of a place by its ID

  LocationController();
  Placemark _pickPlacemark = Placemark();

  Placemark get pickPlacemark => _pickPlacemark;

  List<LocationPrediction> _predictionList = [];

  Future<List<LocationPrediction>> searchLocation(
      BuildContext context, String text) async {
    if (text != null && text.isNotEmpty) {
      http.Response? response = await LocationService().getLocationData(text);
      var data = jsonDecode(response!.body.toString());
      print("my status is " + data["status"]);
      if (data['status'] == 'OK') {
        _predictionList = [];
        data['predictions'].forEach((prediction) =>
            _predictionList.add(LocationPrediction.fromJson(prediction)));
      } else {
        // ApiChecker.checkApi(response);
      }
    }
    return _predictionList;
  }
}

class LocationPrediction {
  String description;
  String placeId;

  LocationPrediction({required this.description, required this.placeId});

  factory LocationPrediction.fromJson(Map<String, dynamic> json) {
    return LocationPrediction(
      description: json['description'],
      placeId: json['place_id'],
    );
  }
}
