class ValidationHelper {
  static isValidEmail(String? input) {
    if (input == null || input.isEmpty) {
      return false;
    }
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  static bool isValidPassword(String? input) {
    if (input == null || input.isEmpty) {
      return false;
    }
    // String pattern =
    //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    // RegExp regExp = RegExp(pattern);
    // return regExp.hasMatch(input);
    return input.length >= 8;
  }

  static bool isValidPhone(String? input) {
    if (input == null || input.isEmpty) {
      return false;
    }
    // for phone number of length 10
    final RegExp regex = RegExp(r'^[0][7|8|9][0|1]\d{7}$');
    // for phone number of length 11
    final RegExp regex2 = RegExp(r'^[0][7|8|9][0|1]\d{8}$');
    // regex.hasMatch(input)?debugPrint("$input validated"):debugPrint("$input invalidated");
    return regex.hasMatch(input) || regex2.hasMatch(input);
    // return regex2.hasMatch(input);
  }
}
