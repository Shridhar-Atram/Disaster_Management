import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_management/src/constants/sizes.dart';
import 'package:disaster_management/src/constants/text_strings.dart';
import 'package:disaster_management/src/features/authentication/controllers/signup_controller.dart';
import 'package:disaster_management/src/features/authentication/models/user_model.dart';
import 'package:disaster_management/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

final controller = Get.put(SignUpController());
final _auth = FirebaseAuth.instance;
final _formKey = GlobalKey<FormState>();
String? errorMessage;

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              validator: (value) {
                RegExp regex = RegExp(r'^.{5,}$');
                if (value!.isEmpty) {
                  return ("FUll Name cannot be empty");
                }
                if (!regex.hasMatch(value)) {
                  return ("Enter Valid Name");
                }
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(height: tFormHeight),
            TextFormField(
              controller: controller.email,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Please Enter Your Email");
                }
                // reg expression for email validation
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Please Enter a valid email");
                }
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(tEmail), prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(height: tFormHeight),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                  label: Text(tPhoneNo), prefixIcon: Icon(Icons.numbers)),
            ),
            const SizedBox(height: tFormHeight),
            TextFormField(
              controller: controller.passwordEditingController,
              validator: (value) {
                RegExp regex = new RegExp(r'^.{8,}$');
                if (value!.isEmpty) {
                  return ("Password is required for Sign Up");
                }
                if (!regex.hasMatch(value)) {
                  return ("Enter Valid Password(Min. 8 Character)");
                }
              },
              decoration: const InputDecoration(
                  label: Text(tPassword), prefixIcon: Icon(Icons.key_sharp)),
            ),
            const SizedBox(height: tFormHeight),
            TextFormField(
              controller: controller.confirmPasswordEditingController,
              validator: (value) {
                // ignore: unrelated_type_equality_checks
                if (controller.confirmPasswordEditingController.text !=
                    controller.passwordEditingController) {
                  return "Password don't match";
                }
                return null;
              },
              decoration: const InputDecoration(
                  label: Text("Confirm Password"),
                  prefixIcon: Icon(Icons.key_sharp)),
            ),
            const SizedBox(height: tFormHeight),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final user = UserModel(
                        email: controller.email.text.trim(),
                        password:
                            controller.passwordEditingController.text.trim(),
                        fullName: controller.fullName.text.trim(),
                        phoneNo: controller.phoneNo.text.trim());
                    SignUpController.instance.createUser(user);
                  }
                },
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
