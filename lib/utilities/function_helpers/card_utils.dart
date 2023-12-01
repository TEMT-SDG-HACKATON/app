import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';

//card type
enum CardTypeEnum {
  masterCard,
  visa,
  verve,
  americanExpress,
  discover,
  others,
  invalid
}

class CardUtils {
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }

    int year;
    int month;

    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      month = int.parse(value.substring(0, value.length));
      year = -1;
    }
    if ((month < 1) || (month > 12)) {
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearToDigits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      return 'Expiry year is invalid';
    }
    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

  static int convertYearToDigits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();

    return hasYearPassed(year) ||
        convertYearToDigits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearToDigits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static Widget? getCardIcon(
    BuildContext context,
    CardTypeEnum cardType,
  ) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case CardTypeEnum.masterCard:
        img = 'mastercard.png';
        break;
      case CardTypeEnum.visa:
        img = 'visa.png';
        break;
      case CardTypeEnum.verve:
        img = 'verve.png';
        break;
      case CardTypeEnum.americanExpress:
        img = 'american_express.png';
        break;
      case CardTypeEnum.discover:
        img = 'discover.png';
        break;
      case CardTypeEnum.others:
        icon = Icon(Icons.credit_card, size: 24.h, color: AppColors.black);
        break;
      default:
        icon = Icon(Icons.warning, size: 24.h, color: AppColors.black);
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = Padding(
          padding: EdgeInsets.only(right: 3.6.w, left: 2.5.w, bottom: 2.h),
          child: Image.asset(
            'assets/cards/$img',
            width: 36.0.w,
            fit: BoxFit.fitWidth,
          ));
    } else {
      widget = icon;
    }
    return widget;
  }

  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return 'This field is required';
    }

    input = getCleanedNumber(input);

    if (input.length < 8) {
      return 'Number is invalid';
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return 'Number is invalid';
  }

  static CardTypeEnum getCardTypeFromNumber(String input, {String? cardBrand}) {
    CardTypeEnum cardType;
    if (cardBrand == null) {
      if (input.startsWith(RegExp(
          r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
        cardType = CardTypeEnum.masterCard;
      } else if (input.startsWith(RegExp(r'[4]'))) {
        cardType = CardTypeEnum.visa;
      } else if (input.startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
        cardType = CardTypeEnum.verve;
      } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
        cardType = CardTypeEnum.americanExpress;
      } else if (input.startsWith(RegExp(r'((6[45])|(6011))'))) {
        cardType = CardTypeEnum.discover;
      } else if (input.length <= 8) {
        cardType = CardTypeEnum.others;
      } else {
        cardType = CardTypeEnum.invalid;
      }
      return cardType;
    } else {
      if (cardBrand == 'mastercard') {
        cardType = CardTypeEnum.masterCard;
      } else if (cardBrand == 'visa') {
        cardType = CardTypeEnum.visa;
      } else if (cardBrand == 'verve') {
        cardType = CardTypeEnum.verve;
      } else if (cardBrand == 'americanexpress') {
        cardType = CardTypeEnum.americanExpress;
      } else if (cardBrand == 'discover') {
        cardType = CardTypeEnum.discover;
      } else {
        cardType = CardTypeEnum.others;
      }
      return cardType;
    }
  }
}
