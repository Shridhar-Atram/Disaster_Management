import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get/get.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:core';

import 'location_controller.dart';

class LocationSearchDialog extends StatelessWidget {
  static const routeName = "/LocationSearchDialog";
  // GoogleMapController? mapController;
  LocationSearchDialog();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 150),
        padding: EdgeInsets.all(5),
        alignment: Alignment.topCenter,
        child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: SizedBox(
              width: 350,
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _controller,
                  textInputAction: TextInputAction.search,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    hintText: 'search_location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(style: BorderStyle.none, width: 0),
                    ),
                    hintStyle: Theme.of(context).textTheme.headline2?.copyWith(
                          fontSize: 16,
                          color: Theme.of(context).disabledColor,
                        ),
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                  ),
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: Theme.of(context).textTheme.bodyText1?.color,
                        fontSize: 20,
                      ),
                ),
                suggestionsCallback: (pattern) async {
                  return await Get.find<LocationController>()
                      .searchLocation(context, pattern);
                },
                itemBuilder: (context, LocationPrediction suggestion) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(children: [
                      Icon(Icons.location_on),
                      Expanded(
                        child: Text(suggestion.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.color,
                                      fontSize: 20,
                                    )),
                      ),
                    ]),
                  );
                },
                onSuggestionSelected: (LocationPrediction suggestion) async {
                  _controller.text = suggestion.description;
                  List<geocoding.Location> locations = await geocoding
                      .locationFromAddress(suggestion.description);
                  LatLng placeLocation =
                      LatLng(locations[0].latitude, locations[0].longitude);
                  Navigator.of(context).pop(placeLocation);
                },
              )),
        ),
      ),
    );
  }
}
