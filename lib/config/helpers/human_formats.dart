import 'package:intl/intl.dart';

class HumanFormats {
  // Formatea un numero EJ: 1000 -> 1K
  static String number(double number) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en',
    ).format(number);

    return formattedNumber;
  }
}
