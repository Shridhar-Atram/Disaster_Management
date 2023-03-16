// ignore_for_file: prefer_const_constructors, implementation_imports, unused_import, duplicate_ignore, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_management/src/constants/image_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/image_provider.dart';

import '../model/userModel.dart';

//import '../../model/userModel.dart';

// ignore: use_key_in_widget_constructors
class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  User? user;
  UserModel loggedInUser = UserModel();

  Future<void> getUser() async {
    user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      setState(() {
        this.loggedInUser = UserModel.fromMap(value.data());
      });
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: duplicate_ignore
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(tprofileImage)),
            ),
          ),
          Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              )),
          (Text(
            "${loggedInUser.email}",
            style: TextStyle(color: Colors.grey[200], fontSize: 14),
          ))
        ],
      ),
    );
  }
}
