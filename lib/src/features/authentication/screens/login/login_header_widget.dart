import 'package:disaster_management/src/constants/image_strings.dart';
import 'package:disaster_management/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: const AssetImage(tWelcomeScreenImage),
            height: size.height * 0.2),
        Text(
          tLoginTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(TloginSubtitle, style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
