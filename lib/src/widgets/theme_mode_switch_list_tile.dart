import 'package:flutter/material.dart';
import 'package:flutter_l10n/src/providers/theme_provider.dart';

import '../../generated/l10n.dart';

class ThemeModeSwitchListTile extends StatelessWidget {
  const ThemeModeSwitchListTile({
    Key key,
    @required this.appThemeProvider,
    @required TextStyle textStyle,
  })  : _textStyle = textStyle,
        super(key: key);

  final ThemeProvider appThemeProvider;
  final TextStyle _textStyle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: appThemeProvider.currentTheme.accentColor,
      title: Text(
        (appThemeProvider.darkTheme)
            ? S.of(context).switchToLightMode
            : S.of(context).switchToDarkMode,
        style: TextStyle(
          color: _textStyle.color,
          fontSize: _textStyle.fontSize,
        ),
      ),
      value: appThemeProvider.darkTheme,
      onChanged: (value) {
        appThemeProvider.setDarkTheme(value);
      },
    );
  }
}
