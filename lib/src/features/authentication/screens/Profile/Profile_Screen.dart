import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_management/src/constants/image_strings.dart';
import 'package:disaster_management/src/constants/sizes.dart';
import 'package:disaster_management/src/constants/text_strings.dart';
//import 'package:disaster_management/src/features/DashboardNew/Screens/homescreen.dart';
import 'package:disaster_management/src/features/authentication/screens/Dashboard/dashboard.dart';
import 'package:disaster_management/src/features/authentication/screens/Profile/update_profile_screen.dart';
import 'package:disaster_management/src/features/authentication/screens/Profile/widget/profile_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../reporting_and_mapping/google_map_screen.dart';
import '../../../reporting_and_mapping/report_disaster_page.dart';
import '../../../volunteer/VolunteerReg.dart';
import '../model/userModel.dart';
//import '../../models/user_model.dart';

class ProfileSceen extends StatefulWidget {
  const ProfileSceen({super.key});

  @override
  State<ProfileSceen> createState() => _ProfileSceenState();
}

class _ProfileSceenState extends State<ProfileSceen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(Dashboard());
            },
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          tProfile,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(image: AssetImage(tprofileImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: tPrimaryColor,
                      ),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () =>
                          Get.to(() => const UpdateProfileScreen()),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: tPrimaryColor,
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      child: const Text(
                        tEditProfile,
                        style: TextStyle(color: tDarkColor),
                      ))),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              //menu
              ProfileMenu(
                title: 'Report a diseastor',
                icon: LineAwesomeIcons.cog,
                onPress: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const ReportDisasterPage();
                    }),
                  );
                },
                endIcon: false,
              ),
              ProfileMenu(
                title: 'Maps',
                icon: LineAwesomeIcons.map,
                onPress: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GoogleMapScreen(),
                    ),
                  );
                },
                endIcon: false,
              ),
              ProfileMenu(
                title: 'soon',
                icon: LineAwesomeIcons.cog,
                onPress: () {},
                endIcon: false,
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenu(
                title: 'Volunter Registration',
                icon: LineAwesomeIcons.cog,
                onPress: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VolunteerReg(),
                    ),
                  );
                },
                endIcon: false,
              ),
              ProfileMenu(
                title: 'Logout',
                textColor: Colors.red,
                icon: LineAwesomeIcons.alternate_sign_out,
                onPress: () {
                  _signOut();
                },
                endIcon: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}
