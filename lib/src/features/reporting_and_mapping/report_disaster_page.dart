import 'package:disaster_management/src/features/reporting_and_mapping/Database/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Disaster'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green[50],
      body: Padding(
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
                contentPadding: EdgeInsets.all(18.0),
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
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await FirestoreService().reportDisaster(
                  context,
                  _selectedArea,
                  _selectedDisasterType,
                  _currentStatus,
                );
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
    );
  }
}
