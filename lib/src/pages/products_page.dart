import 'package:flutter/material.dart';
import 'package:flutter_l10n/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/menu_widget.dart';
import '../../generated/l10n.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    final appThemeProvider = Provider.of<ThemeProvider>(context);
    final appTheme = appThemeProvider.currentTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).productsPageAppBarTitle),
        backgroundColor: appTheme.appBarTheme.backgroundColor,
      ),
      drawer: MenuWidget(),
      body: Container(
        child: Center(
          child: Text(""),
        ),
      ),
    );
  }
}
