import 'package:disaster_management/src/comman_widgets/fade_in_animation/Fade_in_Animaion_Controller.dart';
import 'package:disaster_management/src/comman_widgets/fade_in_animation/animation_design.dart';
import 'package:disaster_management/src/comman_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:disaster_management/src/constants/colors.dart';
import 'package:disaster_management/src/constants/sizes.dart';
import 'package:disaster_management/src/features/authentication/screens/SignUP/sign_up.dart';
import 'package:disaster_management/src/features/authentication/screens/login/login_Screen.dart';
import 'package:disaster_management/src/features/volunteer/VolunteerReg.dart';
import 'package:flutter/material.dart';

import 'package:disaster_management/src/constants/image_strings.dart';
import 'package:disaster_management/src/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../../../reporting_and_mapping/google_map_screen.dart';
import '../../../reporting_and_mapping/report_disaster_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            animate: TAnimatePosition(
                bottomAfter: 0,
                bottomBefore: -100,
                leftBefore: 0,
                leftAfter: 0,
                topAfter: 0,
                topBefore: 0,
                rightAfter: 0,
                rightBefore: 0),
            child: Container(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                        image: const AssetImage(tWelcomeScreenImage),
                        height: height * 0.6),
                    Column(
                      children: [
                        Text(tWelcomeTitle,
                            style: Theme.of(context).textTheme.headline3),
                        Text(tWelcomeSubTitle,
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Get.to(() => const LoginScreen()),
                            child: Text(tLogin.toUpperCase()),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const SignUpScreen()),
                            child: Text(tSignup.toUpperCase()),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() =>  VolunteerReg()),
                            child: Text('Volunteer Registration'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountEmail: Text("vivekmote3416@gmail.com"),
                accountName: Text("Vivek Mote"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "V",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dangerous_outlined),
              title: const Text('Report a disaster'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const ReportDisasterPage();
                  }),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text("Map"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GoogleMapScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
