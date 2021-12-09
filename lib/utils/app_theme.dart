import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor;
  static Color secondaryColor;
  static Color tertiaryColor;
  static Color boxColor;
  static Color letterColor;
  static Color backgroundColor;

  //App theme
  getTheme(bool isChange) async {
    if (isChange == false) {
      //Light theme
      primaryColor = Color(0xFF321A47);
      secondaryColor = Color(0xFF3c1f55);
      tertiaryColor = Color(0xFFeae8ec);
      boxColor = Color(0xFF0f0715);
      backgroundColor = Colors.white;
      letterColor = Color(0XFF0b032d);
    } else {
      //Dark theme
      primaryColor = Color(0XFF111111);
      secondaryColor = Color(0xFF171717);
      tertiaryColor = Color(0XFF111111);
      boxColor = Color(0xFF7B7B7B);
      backgroundColor = Color(0xFF171717);
      letterColor = Color(0xFFeae8ec);
    }
  }
}
