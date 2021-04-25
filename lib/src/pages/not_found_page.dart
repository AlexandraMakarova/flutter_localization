import 'package:flutter/material.dart';
import 'package:flutter_l10n/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/menu_widget.dart';

class NotFoundPage extends StatefulWidget {
  NotFoundPage({Key key}) : super(key: key);

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    final appThemeProvider = Provider.of<ThemeProvider>(context);
    final appTheme = appThemeProvider.currentTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.appBarTheme.backgroundColor,
        title: Text("Not Found"),
      ),
      drawer: MenuWidget(),
      body: Container(
        child: Center(
          child: Text("Sorry, We couldn't found your page"),
        ),
      ),
    );
  }
}
