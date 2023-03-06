import 'package:disaster_management/src/constants/sizes.dart';
import 'package:disaster_management/src/constants/text_strings.dart';
import 'package:disaster_management/src/features/authentication/screens/SignUP/Form_header_widget.dart';
import 'package:disaster_management/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/image_strings.dart';

class forgetPasswordMailScreen extends StatelessWidget {
  const forgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(children: [
              const SizedBox(
                height: tDefaultSize * 4,
              ),
              const FormHeaderWidget(
                image: ForgetPassword,
                title: tForgetPassword,
                subTitle: tForgetPasswordSubtitle,
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: 30.0,
              ),
              const SizedBox(height: tFormHeight),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text(tEmail),
                        hintText: tEmail,
                        prefixIcon: Icon(Icons.mail_outline_rounded)),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                      height: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const OTPScreen());
                          },
                          child: const Text(tNext)))
                ],
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
