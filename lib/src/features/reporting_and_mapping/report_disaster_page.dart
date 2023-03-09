import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_management/src/features/reporting_and_mapping/Database/firestore_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../../constants/keys.dart';
import 'Notification/notification_service.dart';
import 'Utils/show_images.dart';
import 'disaster_reported_screen.dart';
import 'location_search_dialogue.dart';

class ReportDisasterPage extends StatefulWidget {
  const ReportDisasterPage({super.key});

  @override
  _ReportDisasterPageState createState() => _ReportDisasterPageState();
}

class _ReportDisasterPageState extends State<ReportDisasterPage> {
  String _selectedDisasterType = 'Earthquake';
  String _selectedArea = '';
  String _currentStatus = 'Ongoing';
  final TextEditingController _controller = TextEditingController();
  bool showSpinner = false;

  final List<String> _disasterTypes = [
    'Earthquake',
    'Flood',
    'Wildfire',
    'Tornado',
    'Hurricane',
    'Volcano',
    'Industrial accident',
    'Terrorist attack',
    'Other',
  ];

  final List<String> _statusOptions = [
    'Ongoing',
    'Under control',
    'Resolved',
    'Other',
  ];
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(imagesList.length, (index) {
        Asset asset = imagesList[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  List<Asset> imagesList = <Asset>[];
  String _error = 'No Error Detected';

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: imagesList,
        cupertinoOptions: const CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: const MaterialOptions(
          actionBarColor: "#4CAF50",
          actionBarTitle: "Select Images",
          allViewTitle: "All Images",
          useDetailsView: false,
          selectCircleStrokeColor: "#8BC34A",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      imagesList = resultList;
      _error = error;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    NotificationService().requestPermission();
    NotificationService().getToken();
    NotificationService().initInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Disaster'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green[50],
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Report a disaster',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green[800]!),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: 'Select Addrress',
                    contentPadding: const EdgeInsets.all(18.0),
                  ),
                  onTap: () async {
                    final result = await Navigator.of(context)
                        .pushNamed(LocationSearchDialog.routeName);
                    if (result is LatLng) {
                      List<geocoding.Placemark> placemarks =
                          await geocoding.placemarkFromCoordinates(
                              result.latitude, result.longitude);
                      setState(
                        () {
                          _controller.text =
                              "${placemarks[0].locality}, ${placemarks[0].administrativeArea}, ${placemarks[0].country}";
                          _selectedArea = _controller.text;
                        },
                      );
                    }
                  },
                ),
                SizedBox(height: 16.0),
                FormField<String>(
                  initialValue: _selectedDisasterType,
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Type of Disaster',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[800]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[800]!),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.green[800],
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: state.value,
                          isDense: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              state.didChange(newValue);
                              _selectedDisasterType = newValue!;
                            });
                          },
                          items: _disasterTypes
                              .map((type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(type),
                                  ))
                              .toList(),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                FormField<String>(
                  initialValue: _currentStatus,
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Current Status',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[800]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[800]!),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.green[800],
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: state.value,
                          isDense: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              state.didChange(newValue);
                              _currentStatus = newValue!;
                            });
                          },
                          items: _statusOptions
                              .map((status) => DropdownMenuItem(
                                    value: status,
                                    child: Text(status),
                                  ))
                              .toList(),
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  onTap: loadAssets,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: const Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          left: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          right: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: ListTile(
                        tileColor: Colors.green[50],
                        leading: const Text(
                          'Click to add Images',
                          style: TextStyle(fontSize: 16),
                        ),
                        trailing: const Icon(Icons.photo_library),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return ShowImages(
                              imagesList: imagesList,
                            );
                          },
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Selected Images : ${imagesList.length}",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 4, 153, 9)),
                        ),
                        const Text(
                          "Click to View",
                          style:
                              TextStyle(color: Color.fromARGB(255, 4, 153, 9)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await FirestoreService().reportDisaster(
                      context,
                      _selectedArea,
                      _selectedDisasterType,
                      _currentStatus,
                    );
                    DocumentSnapshot snap = await FirebaseFirestore.instance
                        .collection("usersToken")
                        .doc("Shridhar Atram")
                        .get();
                    String token = snap["fcmToken"];
                    print("Token from firebase $token");

                    NotificationService()
                        .sendPushMessage(token, "Testing", "Testing body");

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (_) => DisasterReportedScreen(
                                  area: _selectedArea,
                                  disasterType: _selectedDisasterType,
                                  currentStatus: _currentStatus,
                                )),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[800],
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Report Disaster'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
