import 'package:flutter/material.dart';
import 'package:flutter_l10n/src/providers/theme_provider.dart';
import 'package:flutter_l10n/src/widgets/theme_mode_switch_list_tile.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../classes/language.dart';
import '../../generated/l10n.dart';
import '../../localization/language_constants.dart';
import '../widgets/menu_widget.dart';
import '../shared_prefs/user_preferences.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final prefs = new UserPreferences();

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    final appThemeProvider = Provider.of<ThemeProvider>(context);
    final appTheme = appThemeProvider.currentTheme;

    TextStyle _textStyle = TextStyle(
      color: appTheme.textTheme.bodyText1.color,
      fontSize: 18,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settingsPageAppBarTitle),
        backgroundColor: appTheme.appBarTheme.backgroundColor,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: DropdownButton<Language>(
                iconSize: 30,
                hint: Text(
                  S.of(context).formFieldChangeLanguage,
                  style: _textStyle,
                ),
                onChanged: (Language language) {
                  _changeLanguage(language);
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem<Language>(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              e.flag,
                              style: TextStyle(
                                fontSize: 30,
                                color: _textStyle.color,
                              ),
                            ),
                            Text(e.name)
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: ThemeModeSwitchListTile(
              appThemeProvider: appThemeProvider,
              textStyle: _textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
