import 'package:flutter/material.dart';

class DashboardCategories {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategories(this.title, this.heading, this.subHeading, this.onPress);

  static List<DashboardCategories> list = [
    DashboardCategories("js", "Java Script", "10 lessons", null),
    DashboardCategories("F", "Flutter", "10 lessons", null),
    DashboardCategories("H", "Html", "10 lessons", null),
    DashboardCategories("K", "Kotlin", "10 lessons", null),
    DashboardCategories("P", "Python", "10 lessons", null),
  ];

  Null get image => null;
}
