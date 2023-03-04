import 'package:disaster_management/src/comman_widgets/fade_in_animation/Fade_in_Animaion_Controller.dart';
import 'package:disaster_management/src/comman_widgets/fade_in_animation/animation_design.dart';
import 'package:disaster_management/src/comman_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:disaster_management/src/constants/colors.dart';
import 'package:disaster_management/src/constants/sizes.dart';
import 'package:disaster_management/src/features/authentication/screens/SignUP/sign_up.dart';
import 'package:disaster_management/src/features/authentication/screens/login/login_Screen.dart';
import 'package:flutter/material.dart';

import 'package:disaster_management/src/constants/image_strings.dart';
import 'package:disaster_management/src/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

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
              padding: const EdgeInsets.all(tDefaultSize),
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
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
