import 'package:flutter/material.dart';
import 'package:flutter_l10n/src/providers/theme_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../../main.dart';

import '../../classes/language.dart';
import '../../generated/l10n.dart';
import '../../localization/language_constants.dart';
import '../widgets/menu_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _date = '';
  String _name = '';
  String _email = '';
  String _ammount = '';
  Timer _debounce;

  final _textInputCtlr = TextEditingController();
  final _ammountInputController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 60),
      lastDate: DateTime(DateTime.now().year + 1),
      locale: Localizations.localeOf(context),
    );
    if (picked != null) {
      setState(() {
        String formattedDate = DateFormat.yMMMd().format(picked);
        _textInputCtlr.text = formattedDate;
        _date = _textInputCtlr.text;
      });
    }
  }

  String _formatNumber(String s) {
    if (Localizations.localeOf(context).toString() == 'es_AR') {
      return new NumberFormat.currency(
        name: "ARG",
        customPattern: '\u00A4#,##0.00\u00A0',
        symbol: r'$',
      ).format(double.parse(s));
    }
    return NumberFormat.simpleCurrency(
            locale: Localizations.localeOf(context).toString())
        .format(double.parse(s));
  }

  @override
  Widget build(BuildContext context) {
    final appThemeProvider = Provider.of<ThemeProvider>(context);
    final appTheme = appThemeProvider.currentTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).homePageAppBarTitle),
        backgroundColor: appTheme.appBarTheme.backgroundColor,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
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
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      drawer: MenuWidget(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            _mainForm(context),
            Divider(),
            _createPerson(),
          ],
        ),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Center(
                child: Text(
                  S.of(context).homePageMainFormTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return S.of(context).formFieldRequired;
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: S.of(context).formFieldName,
                hintText: S.of(context).formFieldNameHint,
                suffixIcon: Icon(Icons.accessibility),
                icon: Icon(Icons.account_circle),
              ),
              onChanged: (String value) {
                _name = value;
                setState(() {
                  print(_name);
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (val) {
                if (val.isEmpty) {
                  return S.of(context).formFieldRequired;
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: S.of(context).formFieldEmail,
                hintText: S.of(context).formFieldEmailHint,
                suffixIcon: Icon(Icons.alternate_email),
                icon: Icon(Icons.email),
              ),
              onChanged: (value) => setState(() {
                print(_email);
                _email = value;
              }),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _textInputCtlr,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: S.of(context).formFieldDOB,
                suffixIcon: Icon(Icons.perm_contact_cal_outlined),
                icon: Icon(Icons.calendar_today_outlined),
              ),
              onTap: () async {
                FocusScope.of(context).requestFocus(new FocusNode());
                await _selectDate(context);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (val) {
                if (val.isEmpty) {
                  return S.of(context).formFieldRequired;
                }
                return null;
              },
              controller: _ammountInputController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: S.of(context).formFieldPrice,
                hintText: S.of(context).formFieldPriceHint,
                suffixIcon: Icon(Icons.money),
                icon: Icon(Icons.monetization_on_outlined),
              ),
              onChanged: (String string) {
                if (_debounce?.isActive ?? false) _debounce.cancel();
                _debounce = Timer(const Duration(milliseconds: 700), () {
                  if (string != '' || string != '') {
                    string = '${_formatNumber(string)}';
                    _ammountInputController.value = TextEditingValue(
                      text: string,
                      selection: TextSelection.collapsed(offset: string.length),
                    );
                    setState(() {
                      _ammount = _ammountInputController.value.text;
                    });
                  }
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {},
              height: 50,
              shape: StadiumBorder(),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  S.of(context).formFieldSubmitInfo,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createPerson() {
    return Card(
      child: Column(
        children: [
          Text('$_name'),
          Text('$_email'),
          Text('$_date'),
          Text('$_ammount'),
        ],
      ),
    );
  }
}
