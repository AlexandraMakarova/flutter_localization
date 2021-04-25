import 'package:flutter/material.dart';
import 'package:flutter_l10n/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../routes/route_names.dart';
import '../../generated/l10n.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    final appThemeProvider = Provider.of<ThemeProvider>(context);
    final appTheme = appThemeProvider.currentTheme;

    TextStyle _textStyle = TextStyle(
      color: appTheme.textTheme.bodyText1.color,
      fontSize: 18,
    );

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: (appThemeProvider.darkTheme)
                    ? AssetImage('assets/menu-img-dark.jpg')
                    : AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              height: 100,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard_rounded,
                color: appTheme.accentColor, size: 30),
            title:
                Text(S.of(context).productsPageAppBarTitle, style: _textStyle),
            trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigate to select route
              Navigator.pushNamed(context, productsRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.home, color: appTheme.accentColor, size: 30),
            title: Text(S.of(context).homePageAppBarTitle, style: _textStyle),
            trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, homeRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: appTheme.accentColor, size: 30),
            title:
                Text(S.of(context).aboutUsPageAppBarTitle, style: _textStyle),
            trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading:
                Icon(Icons.settings, color: appTheme.accentColor, size: 30),
            title: Text(
              S.of(context).settingsPageAppBarTitle,
              style: _textStyle,
            ),
            trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, settingsRoute);
              // Avoid to get back to the previos route
              // Navigator.pushReplacementNamed(context, settingsRoute);
            },
          ),
          Divider(
            color: appTheme.accentColor,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: appTheme.accentColor,
              ),
              title: Text(
                (appThemeProvider.darkTheme)
                    ? S.of(context).switchToLightMode
                    : S.of(context).switchToDarkMode,
                style: TextStyle(
                  color: _textStyle.color,
                  fontSize: _textStyle.fontSize,
                ),
              ),
              trailing: Switch.adaptive(
                value: appThemeProvider.darkTheme,
                onChanged: (value) {
                  appThemeProvider.setDarkTheme(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
