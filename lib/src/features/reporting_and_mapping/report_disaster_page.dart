import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

import 'location_search_dialogue.dart';

class ReportDisasterPage extends StatefulWidget {
  const ReportDisasterPage({super.key});

  @override
  _ReportDisasterPageState createState() => _ReportDisasterPageState();
}

class _ReportDisasterPageState extends State<ReportDisasterPage> {
  String _selectedDisasterType = '';
  String _selectedArea = '';
  String _currentStatus = '';
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Report a disaster',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedDisasterType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDisasterType = newValue!;
                });
              },
              items:
                  _disasterTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select Disaster type',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              ),
            ),
            // DropdownButtonFormField<String>(
            //   value: _selectedDisasterType,
            //   decoration: InputDecoration(
            //     labelText: 'Type of Disaster',
            //     border: OutlineInputBorder(),
            //   ),
            //   items: _disasterTypes
            //       .map((type) => DropdownMenuItem(
            //             value: type,
            //             child: Text(type),
            //           ))
            //       .toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       _selectedDisasterType = value!;
            //     });
            //   },
            // ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'Select Addrress',
                contentPadding: EdgeInsets.all(10.0),
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
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _currentStatus,
              decoration: const InputDecoration(
                labelText: 'Current Status of Disaster',
                border: OutlineInputBorder(),
              ),
              items: _statusOptions
                  .map((status) => DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _currentStatus = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement disaster reporting functionality
              },
              child: Text('Report Disaster'),
            ),
          ],
        ),
      ),
    );
  }
}
