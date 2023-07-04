import 'package:flutter/material.dart';

import '../mytheme_preference.dart';

class ThemeProvider extends ChangeNotifier {
  late bool _isDark;
  late Color _mainColor;
  late MyThemePreferences _preferences;
  bool get isDark => _isDark;
  Color get mainColor => _mainColor;

  ThemeProvider() {
    _isDark = false;
    _preferences = MyThemePreferences();
    getPreferences();
    getMainColor();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  void getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }

  set mainColor(Color value) {
    _mainColor = value;
    _preferences.setMainColor(value);
    notifyListeners();
  }

  void getMainColor() async {
    _mainColor = Color(await _preferences.getMainColor());
    notifyListeners();
  }
}
