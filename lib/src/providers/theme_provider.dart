import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _darkTheme = false;

  ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeProvider(int theme) {
    switch (theme) {
      case 1: //Light
        _darkTheme = false;
        _currentTheme = ThemeData.light();
        break;

      case 2: //Dark
        _darkTheme = true;
        _currentTheme = _darkThemeSettings;
        break;
    }
  }

  Future setDarkTheme(bool value) async {
    _darkTheme = value;
    if (value) {
      _currentTheme = _darkThemeSettings;
    } else {
      _currentTheme = ThemeData.light();
    }
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
    notifyListeners();
  }

  final _darkThemeSettings = ThemeData.dark().copyWith(
    accentColor: Color.fromRGBO(8, 130, 93, 1),
    appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(8, 130, 93, 1)),
  );
}
