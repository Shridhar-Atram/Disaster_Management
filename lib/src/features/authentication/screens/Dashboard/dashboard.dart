import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_management/src/features/authentication/screens/Dashboard/Widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// void countDocuments() async {
//   QuerySnapshot _myDoc =
//       await Firestore.instance.collection('product').getDocuments();
//   List<DocumentSnapshot> _myDocCount = _myDoc.documents;
//   print(_myDocCount.length); // Count of Documents in Collection
// }
//Firestore.instance.collection('disasters').snapshots().length.toString();
class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late int countIn;

  void getNoOfDisasters() async {
    await FirebaseFirestore.instance.collection("disasters").get().then(
      (value) {
        countIn = value.docs.length;
      },
    );
  }

  @override
  void initState() {
    getNoOfDisasters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppbar(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 249, 246, 246),
              Color.fromARGB(255, 159, 201, 126),
            ])),
        child: Center(
            child: ListView(children: [
          SizedBox(height: 50),
          CircularPercentIndicator(
            radius: 130.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 15.0,
            percent: 0.4,
            center: Text(
              "Disaster Registered ${countIn}",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Color.fromARGB(255, 214, 229, 207),
            progressColor: Color.fromARGB(255, 191, 222, 140),
          ),
          const SizedBox(height: 50),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  width: 80,
                ),
                Container(
                  child: SafeArea(child: Row()),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(width: 50),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 220, 241, 198),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 159, 201, 126),
                              offset: Offset(3.0, 3.0),
                              blurRadius: 3.0,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.computer_outlined,
                              size: 150, color: Colors.grey),
                          Text(
                            'Report A diseastor',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 60),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 220, 241, 198),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 159, 201, 126),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 2.0,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.alarm_add_rounded,
                              size: 150, color: Colors.grey),
                          Text(
                            'Report A diseastor',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 220, 241, 198),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 159, 201, 126),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 2.0,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.person_outlined,
                              size: 150, color: Colors.grey),
                          Text(
                            'Volunter Registration',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 60),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 220, 241, 198),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 159, 201, 126),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 2.0,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.map_outlined,
                              size: 150, color: Colors.grey),
                          Text(
                            "Maps",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ))
        ])),
      ),
    );
  }
}
