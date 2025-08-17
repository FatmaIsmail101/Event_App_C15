import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  changeTheme(ThemeMode mode) {
    if(mode==themeMode)return;
    themeMode = mode;
    notifyListeners();

  }
  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }
  ///Location

}
