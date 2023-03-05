//Use this inside main Theme to call Light or dark Modes
import 'dart:ui';

import 'package:disaster_management/src/constants/colors.dart';
import 'package:disaster_management/src/utils/theme/widget_themes/text_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();
  static InputDecorationTheme LightInputDecorationTheme = const InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: tSecondaryColor,
      floatingLabelStyle: TextStyle(color: tSecondaryColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: tSecondaryColor),
      ));

  static InputDecorationTheme darkInputDecorationTheme = const InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: tPrimaryColor,
      floatingLabelStyle: TextStyle(color: tPrimaryColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: tPrimaryColor),
      ));
}
