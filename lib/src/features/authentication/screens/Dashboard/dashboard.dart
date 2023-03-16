import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_management/src/features/authentication/screens/Dashboard/MyHeaderDrawer.dart';
import 'package:disaster_management/src/features/volunteer/DisasterList.dart';
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
          'Diseastor  Management',
        ),
        backgroundColor: Color.fromARGB(255, 159, 201, 126),
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
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 249, 246, 246),
              Color.fromARGB(255, 159, 201, 126),
            ])),
        child: Center(
            child: ListView(children: [
          const SizedBox(height: 50),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(tDefaultSize - 10),
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const Text("Disastor Registered",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
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
                              fontWeight: FontWeight.bold, fontSize: 50.0),
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Color.fromARGB(255, 214, 229, 207),
                        progressColor: Color.fromARGB(255, 191, 222, 140),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text("Volunter Registered",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
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
                                fontWeight: FontWeight.normal, fontSize: 50.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Color.fromARGB(255, 214, 229, 207),
                          progressColor: Color.fromARGB(255, 191, 222, 140),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ReportDisasterPage())));
                      },
                      child: Container(
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
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: Icon(Icons.alarm,
                                        size: 100, color: Colors.grey),
                                  ),
                                  Text(
                                    'Report A disastor',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 60),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => DisasterList())));
                      },
                      child: Container(
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
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: Icon(Icons.alarm,
                                        size: 100, color: Colors.grey),
                                  ),
                                  Text(
                                    'Disasters Reported',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
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
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => VolunteerReg())));
                      },
                      child: Container(
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
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: Icon(Icons.alarm,
                                        size: 100, color: Colors.grey),
                                  ),
                                  Text(
                                    'Volunter Registration',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 60),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => GoogleMapScreen())));
                      },
                      child: Container(
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
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: Icon(Icons.map_outlined,
                                        size: 100, color: Colors.grey),
                                  ),
                                  Text(
                                    'Maps',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
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

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}
