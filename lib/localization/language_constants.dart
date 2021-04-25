import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ARGENTINIAN = 'arg';
const String ARABIC = 'ar';
const String BRAZILIAN = 'pt';
const String ENGLISH = 'en';
const String FRENCH = 'fr';
const String GERMAN = 'de';
const String RUSSIAN = 'ru';
const String SPANISH = 'es';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}

// Switch language code and county code
Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case ARGENTINIAN:
      return Locale('es', 'AR');
    case ARABIC:
      return Locale(ARABIC, 'SA');
    case BRAZILIAN:
      return Locale(BRAZILIAN, 'BR');
    case FRENCH:
      return Locale(FRENCH, 'FR');
    case GERMAN:
      return Locale(GERMAN, "DE");
    case RUSSIAN:
      return Locale(RUSSIAN, "RU");
    case SPANISH:
      return Locale(SPANISH, 'ES');
    default:
      return Locale(ENGLISH, 'US');
  }
}
