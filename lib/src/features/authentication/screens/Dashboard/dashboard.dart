// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:disaster_management/src/constants/colors.dart';
import 'package:disaster_management/src/constants/image_strings.dart';
import 'package:disaster_management/src/constants/sizes.dart';
import 'package:disaster_management/src/constants/text_strings.dart';
import 'package:disaster_management/src/features/authentication/screens/Dashboard/Widget/appbar.dart';
import 'package:disaster_management/src/features/authentication/screens/Dashboard/Widget/banners.dart';
import 'package:disaster_management/src/features/authentication/screens/Dashboard/Widget/categories.dart';
import 'package:disaster_management/src/features/authentication/screens/Dashboard/Widget/top_courses.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const DashboardAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardCardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tDashboardTitle,
                style: txtTheme.bodyText2,
              ),
              Text(
                tDashboardHeading,
                style: txtTheme.headline2,
              ),
              SizedBox(
                height: tDashboardCardPadding,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(width: 4)),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Text(
                      tDashboardSearch,
                      style: txtTheme.headline2
                          ?.apply(color: Colors.grey.withOpacity(0.5)),
                    ),
                    const Icon(
                      Icons.mic,
                      size: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: tDashboardCardPadding,
              ),
              //Categories
              Topcategories(txtTheme: txtTheme),
              const SizedBox(height: tDashboardCardPadding),
              //baners
              dashboardbanners(txtTheme: txtTheme),
              const SizedBox(
                height: tDashboardCardPadding,
              ),

              //top Course
              Text(tDashboardTopCourses,
                  style: txtTheme.headline4?.apply(fontSizeFactor: 1.2)),
              Topcourse(txtTheme)
            ],
          ),
        ),
      ),
    );
  }
}
