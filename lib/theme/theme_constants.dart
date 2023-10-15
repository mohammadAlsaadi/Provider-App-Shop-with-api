import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:statemanagement/utils/colors/color.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        backgroundColor: darkThemeBackgroundColor,
        iconTheme: IconThemeData(color: white)),
    drawerTheme: DrawerThemeData(backgroundColor: darkThemeBackgroundColor));
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
      backgroundColor: appBarColor, iconTheme: IconThemeData(color: white)),
  drawerTheme: DrawerThemeData(
    backgroundColor: appBarColor,
  ),
);

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? darkTheme : lightTheme;
  }
}
