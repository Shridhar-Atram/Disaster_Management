import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerProvider extends ChangeNotifier {
  List<Marker> _markers = [];

  List<Marker> get markers => _markers;

  void addMarker(Marker marker) {
    _markers.add(marker);
    notifyListeners();
  }

  void removeMarker(Marker marker) {
    _markers.remove(marker);
    notifyListeners();
  }
}
