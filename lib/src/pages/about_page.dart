import 'package:flutter/material.dart';
import 'package:flutter_l10n/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/menu_widget.dart';
import '../../generated/l10n.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final appThemeProvider = Provider.of<ThemeProvider>(context);
    final appTheme = appThemeProvider.currentTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).aboutUsPageAppBarTitle),
        backgroundColor: appTheme.appBarTheme.backgroundColor,
      ),
      drawer: MenuWidget(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(S.of(context).formFieldAbout),
        ),
      ),
    );
  }
}
