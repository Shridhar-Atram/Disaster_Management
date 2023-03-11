import 'package:disaster_management/src/features/authentication/screens/Profile/Profile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';

class DashboardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () => Get.to(() => const ProfileSceen()),
      ),
      title: Text(
        "Disaster management",
        style: Theme.of(context).textTheme.headline4,
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      // actions: [
      //   Container(
      //     margin: const EdgeInsets.only(right: 20, top: 7),
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(10),
      //       color: tCardBgColor,
      //     ),
      //     child: IconButton(
      //       onPressed: () => Get.to(() => const ProfileSceen()),
      //       icon: const Image(
      //         image: AssetImage(tUserProfileImage),
      //       ),
      //     ),
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
