// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home Page`
  String get homePageAppBarTitle {
    return Intl.message(
      'Home Page',
      name: 'homePageAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get homePageMainFormTitle {
    return Intl.message(
      'Personal Information',
      name: 'homePageMainFormTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get formFieldName {
    return Intl.message(
      'Name',
      name: 'formFieldName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get formFieldNameHint {
    return Intl.message(
      'Enter your name',
      name: 'formFieldNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get formFieldEmail {
    return Intl.message(
      'Email',
      name: 'formFieldEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get formFieldEmailHint {
    return Intl.message(
      'Enter your email',
      name: 'formFieldEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get formFieldDOB {
    return Intl.message(
      'Date of Birth',
      name: 'formFieldDOB',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get formFieldPrice {
    return Intl.message(
      'Price',
      name: 'formFieldPrice',
      desc: '',
      args: [],
    );
  }

  /// `Product Price`
  String get formFieldPriceHint {
    return Intl.message(
      'Product Price',
      name: 'formFieldPriceHint',
      desc: '',
      args: [],
    );
  }

  /// `Required Field`
  String get formFieldRequired {
    return Intl.message(
      'Required Field',
      name: 'formFieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Submit Info`
  String get formFieldSubmitInfo {
    return Intl.message(
      'Submit Info',
      name: 'formFieldSubmitInfo',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get productsPageAppBarTitle {
    return Intl.message(
      'Products',
      name: 'productsPageAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUsPageAppBarTitle {
    return Intl.message(
      'About Us',
      name: 'aboutUsPageAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsPageAppBarTitle {
    return Intl.message(
      'Settings',
      name: 'settingsPageAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get formFieldChangeLanguage {
    return Intl.message(
      'Change Language',
      name: 'formFieldChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get switchToDarkMode {
    return Intl.message(
      'Dark mode',
      name: 'switchToDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Light mode`
  String get switchToLightMode {
    return Intl.message(
      'Light mode',
      name: 'switchToLightMode',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply a dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.`
  String get formFieldAbout {
    return Intl.message(
      'Lorem Ipsum is simply a dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
      name: 'formFieldAbout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'SA'),
      Locale.fromSubtags(languageCode: 'de', countryCode: 'DE'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'AR'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'ES'),
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'FR'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}