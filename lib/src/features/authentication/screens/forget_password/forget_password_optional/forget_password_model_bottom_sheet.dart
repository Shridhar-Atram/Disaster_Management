import 'package:disaster_management/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:disaster_management/src/features/authentication/screens/forget_password/forget_password_optional/ForgetPasswordBtnWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class ForgetPasswordScreen {
  static Future<dynamic> showmodelbottomsheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tForgetPasswordTitle,
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              tForgetPasswordSubtitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 30.0),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mail_outline_outlined,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const forgetPasswordMailScreen());
              },
              subTitle: tResetViaEmail,
              title: tEmail,
            ),
            const SizedBox(height: 20.0),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              onTap: () {},
              subTitle: tResetViaPhone,
              title: tPhoneNo,
            ),
          ],
        ),
      ),
    );
  }
}
