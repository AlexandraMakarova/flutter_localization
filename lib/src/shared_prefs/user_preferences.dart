import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }
  UserPreferences._internal();
  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del _colorSecundario
  get secondaryColor {
    return _prefs.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool value) {
    _prefs.setBool('secondaryColor', value);
  }
}
