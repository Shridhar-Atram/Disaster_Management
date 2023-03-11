import 'package:disaster_management/src/constants/image_strings.dart';
import 'package:disaster_management/src/constants/text_strings.dart';
import 'package:disaster_management/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../login/login_Screen.dart';

class SignUpFooterWidget extends StatefulWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignUpFooterWidgetState();
  }
}

class SignUpFooterWidgetState extends State<SignUpFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(tSignInWithGoogle),
              width: 20.0,
            ),
            label: Text(LoginWithGoogle.toUpperCase()),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.to(() => LoginScreen1());
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: tAlreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(text: tLogin.toUpperCase())
          ])),
        )
      ],
    );
  }
}
