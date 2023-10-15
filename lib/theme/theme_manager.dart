import 'package:flutter/material.dart';
import 'package:statemanagement/theme/theme_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class ThemeManager with ChangeNotifier {
//   ThemeData _themeMode = ThemeData.dark();
//   ThemeData get themeMode => _themeMode;
//   void toggleTheme(bool isDark) {
//     _themeMode = isDark ? ThemeData.dark() : ThemeData.light();

//     notifyListeners();
//   }
// }

class DarkThemePreference {
  static const thrmeState = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(thrmeState, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(thrmeState) ?? false;
  }
}

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
