import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
}
