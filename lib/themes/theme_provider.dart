import 'package:baseleal/themes/darkmode.dart';
import 'package:baseleal/themes/lightmode.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

final box = Hive.box('myBox');
ThemeData getStoredTheme() {
  final storedTheme = box.get('theme');
  if (storedTheme == 'lightmode') {
    return lightmode;
  } else if (storedTheme == null) {
    return lightmode;
  } else {
    return darkmode;
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = getStoredTheme();

  get getTheme => _themeData;

  bool get isLightmode => _themeData == lightmode;

  // geting the theme
  ThemeData get getThemeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkmode;
      box.put('theme', 'darkmode');
    } else {
      themeData = lightmode;
      box.put('theme', 'lightmode');
    }
  }
}
