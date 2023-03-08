import 'package:disaster_management/src/constants/colors.dart';
import 'package:disaster_management/src/constants/image_strings.dart';
import 'package:disaster_management/src/constants/sizes.dart';
import 'package:disaster_management/src/constants/text_strings.dart';
import 'package:disaster_management/src/features/authentication/screens/Profile/update_profile_screen.dart';
import 'package:disaster_management/src/features/authentication/screens/Profile/widget/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../reporting_and_mapping/google_map_screen.dart';
import '../../../reporting_and_mapping/report_disaster_page.dart';

class ProfileSceen extends StatelessWidget {
  const ProfileSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
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
              Text(
                tProfileHeading,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(tProfileSubHeading,
                  style: Theme.of(context).textTheme.bodyText2),
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
                onPress: () {},
                endIcon: false,
              ),
              ProfileMenu(
                title: 'Maps',
                icon: LineAwesomeIcons.map,
                onPress: () {},
                endIcon: false,
              ),
              ProfileMenu(
                title: 'Upcoming',
                icon: LineAwesomeIcons.cog,
                onPress: () {},
                endIcon: false,
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenu(
                title: 'Upcoming',
                icon: LineAwesomeIcons.cog,
                onPress: () {},
                endIcon: false,
              ),
              ProfileMenu(
                title: 'Logout',
                textColor: Colors.red,
                icon: LineAwesomeIcons.alternate_sign_out,
                onPress: () {},
                endIcon: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
