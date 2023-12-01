import 'package:intl/intl.dart';

class AmountHelper {

  static String formatAmount(dynamic value,
      {String? sign = '₦', bool enableDecimal = true}) {
    if (value == null) {
      return '';
    } else if (value == '') {
      return '${sign}0.0';
    } else {
      var formatter = enableDecimal
          ? NumberFormat("#,##0.0", "en_US")
          : NumberFormat("#,##0", "en_US");
      if (value is double) {
        String formattedAmount = formatter.format(value);
        return "$sign$formattedAmount";
      } else {
        double amount = double.parse(cleanStringAndExtractNumbers(value.toString()));
        String formattedAmount = formatter.format(amount);
        return "$sign$formattedAmount";
      }
    }
  }

  static String cleanStringAndExtractNumbers(String input) {
    return input.replaceAll(RegExp('[^0-9]'), '');
  }
}
