import 'package:intl/intl.dart';

class HumanFormats {
  // Formatea un numero EJ: 1000 -> 1K
  static String number(double number, {int decimalDigits = 0}) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: decimalDigits,
      symbol: '',
      locale: 'en',
    ).format(number);

    return formattedNumber;
  }
}
