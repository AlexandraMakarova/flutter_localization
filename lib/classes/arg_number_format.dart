import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

main() {
  var argentina = NumberSymbols(
      NAME: "es_AR",
      DECIMAL_SEP: ',',
      GROUP_SEP: '.',
      PERCENT: '%',
      ZERO_DIGIT: '0',
      PLUS_SIGN: '+',
      MINUS_SIGN: '-',
      EXP_SYMBOL: 'E',
      PERMILL: '\u2030',
      INFINITY: '\u221E',
      NAN: 'NaN',
      DECIMAL_PATTERN: '#,##0.###',
      SCIENTIFIC_PATTERN: '#E0',
      PERCENT_PATTERN: '#,##0\u00A0%',
      CURRENCY_PATTERN: '\u00A4#,##0.00\u00A0',
      DEF_CURRENCY_CODE: r'$');

  numberFormatSymbols['es_AR'] = argentina;
  var f = NumberFormat.currency(locale: 'es_AR');
  print(f.format(1234));
}
