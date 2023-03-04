import 'package:disaster_management/src/constants/image_strings.dart';
import 'package:disaster_management/src/constants/sizes.dart';
import 'package:disaster_management/src/constants/text_strings.dart';
import 'package:disaster_management/src/features/authentication/screens/SignUP/Form_header_widget.dart';
import 'package:disaster_management/src/features/authentication/screens/SignUP/Sign_up_footer_widget.dart';
import 'package:disaster_management/src/features/authentication/screens/SignUP/Sign_up_form_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: const [
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  imageHeight: 0.15,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
