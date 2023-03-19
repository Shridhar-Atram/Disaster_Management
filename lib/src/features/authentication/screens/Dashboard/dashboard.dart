import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_management/src/features/authentication/screens/Dashboard/MyHeaderDrawer.dart';
import 'package:disaster_management/src/features/volunteer/DisasterList.dart';
import 'package:disaster_management/src/features/volunteer/VolunteerList.dart';
import 'package:disaster_management/src/features/volunteer/VolunteerReg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../constants/sizes.dart';
import '../../../reporting_and_mapping/google_map_screen.dart';
import '../../../reporting_and_mapping/report_disaster_page.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late int countIn = 0;
  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;
  late int users = 0;
  void getNoOfDisasters() async {
    await FirebaseFirestore.instance.collection("disasters").get().then(
      (value) {
        setState(() {
          countIn = value.docs.length;
        });
      },
    );
  }

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen(
      (User? user) {
        _user.value = user;
        print("user id ${user?.email}");
      },
    );
  }

  void getNoOfUser() async {
    await FirebaseFirestore.instance.collection("users").get().then(
      (value) {
        users = value.docs.length;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getNoOfDisasters();
    getNoOfUser();
    initAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Disaster  Management',
        ),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            MyHeaderDrawer(),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text("Log out"),
              onLongPress: () {
                _signOut();
              },
            ),
            ListTile(
                leading: const Icon(
                  Icons.list,
                ),
                title: const Text("Volunteers Available"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VolunteerList(),
                    ),
                  );
                }),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 218, 233, 215),
              Colors.green,
            ])),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(tDefaultSize - 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Disaster Registered",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CircularPercentIndicator(
                          radius: 70.0,
                          animation: true,
                          animationDuration: 1200,
                          lineWidth: 15.0,
                          percent: 0.4,
                          center: Text(
                            "$countIn",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50.0,
                                color: Colors.black),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Color.fromARGB(255, 214, 229, 207),
                          progressColor: Colors.green.shade400,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Volunteer Registered",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.black)),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: CircularPercentIndicator(
                            radius: 70.0,
                            animation: true,
                            animationDuration: 1200,
                            lineWidth: 15,
                            percent: 0.4,
                            center: Text(
                              "$users",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 50.0,
                                  color: Colors.black),
                            ),
                            circularStrokeCap: CircularStrokeCap.butt,
                            backgroundColor: Color.fromARGB(255, 214, 229, 207),
                            progressColor: Colors.green.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                primary: false,
                crossAxisCount: 2,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ReportDisasterPage())));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.report_problem_outlined,
                            size: 70,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Report Disaster',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: 'Montserrat'),
                          )
                        ],
                      ),
                      color: Color.fromARGB(255, 220, 241, 198),
                    ),
                  ),
                  // SizedBox(
                  //   width: 0.000001,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => DisasterList())));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sync_problem_rounded,
                            color: Colors.grey,
                            size: 70,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Disaster Reported',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: 'Montserrat'),
                          )
                        ],
                      ),
                      color: Color.fromARGB(255, 220, 241, 198),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => VolunteerReg())));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.app_registration_sharp,
                            size: 70,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Volunteer Registration',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: 'Montserrat'),
                          )
                        ],
                      ),
                      color: Color.fromARGB(255, 220, 241, 198),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => GoogleMapScreen())));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.map_outlined,
                            size: 70,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Maps',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: 'Montserrat'),
                          )
                        ],
                      ),
                      color: Color.fromARGB(255, 220, 241, 198),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}




// ===================================================

