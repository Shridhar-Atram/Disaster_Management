import 'package:disaster_management/src/constants/image_strings.dart';
import 'package:disaster_management/src/constants/sizes.dart';
import 'package:disaster_management/src/constants/text_strings.dart';
import 'package:disaster_management/src/features/authentication/screens/SignUP/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("OR"),
            const SizedBox(height: tFormHeight),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Image(
                    image: AssetImage(tSignInWithGoogle), width: 20.0),
                onPressed: () {},
                label: const Text(LoginWithGoogle),
              ),
            ),
            const SizedBox(height: tFormHeight),
            TextButton(
              onPressed: () => Get.to(() => const SignUpScreen()),
              child: Text.rich(
                TextSpan(
                    text: tDontHaveAnAccount,
                    style: Theme.of(context).textTheme.bodyText1,
                    children: const [
                      TextSpan(
                          text: tSignup, style: TextStyle(color: Colors.blue))
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
