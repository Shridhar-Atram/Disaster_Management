import 'package:disaster_management/src/constants/sizes.dart';
import 'package:disaster_management/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(height: tFormHeight),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tEmail), prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(height: tFormHeight),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tPhoneNo), prefixIcon: Icon(Icons.numbers)),
            ),
            const SizedBox(height: tFormHeight),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tPassword), prefixIcon: Icon(Icons.fingerprint)),
            ),
            const SizedBox(height: tFormHeight),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
