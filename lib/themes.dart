import 'package:flutter/material.dart';

class MyThemes {
  static final primary = Color(0xff2bb616);
  static final primaryColor = Colors.green.shade300;

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black87,
      colorScheme: ColorScheme.dark(primary: primary),
      primaryColorDark: primaryColor,
      dividerColor: Colors.white70);

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade50,
      colorScheme: ColorScheme.light(primary: primary),
      primaryColor: primaryColor,
      dividerColor: Colors.black54);
}
