import 'package:flutter/material.dart';

import './FinalVolunteer.dart';

class Volunteer {
  late int id;
  late String name;
  late String cnumber;
  late String district;
  Volunteer(this.id, this.name, this.cnumber, this.district);
}

class VolunteerList extends StatefulWidget {
 VolunteerList({Key? key}) : super(key: key);

  @override
  State<VolunteerList> createState() => _VolunteerListState();
}

class _VolunteerListState extends State<VolunteerList> {
  List volunteers = [
    Volunteer(1, "Shruti", "1234567890", "Pune"),
    Volunteer(2, "Shrutika", "1234567890", "Nashik"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Volunteers Available"),
        ),
        body: Container(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: volunteers.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                //  Map thisItem = volunteers[i];
                //  final s1 = volunteers[i].district;
                final sortedVol = volunteers
                  ..sort((item1, item2) =>
                      item1.district.compareTo(item2.district));
                final volunteer = sortedVol[i];
                return FinalVolunteer(
                    volunteer.name, volunteer.cnumber, volunteer.district);
              }),
        ));
  }
}
