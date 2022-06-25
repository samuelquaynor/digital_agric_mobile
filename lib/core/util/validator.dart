/// Check text inputs for valid data
class Validator {
  /// Validate amount, has to be more than 0.00
  static String? amount(String? value) {
    try {
      final amount = double.parse(value!);
      if (amount.isNaN) {
        return 'Amount is not in digits';
      } else if (amount < 0.01) {
        return 'Enter a valid amount';
      }
      return null;
    } on FormatException {
      return 'An amount is required';
    }
  }

  /// Validates Password inputs to ensure they are more than 6 characters
  static String? password(String? value) {
    if (value!.isEmpty) return 'Password is required.';
    return null;
  }

  /// Name validator
  static String? name(String? value) {
    const pattern = r'(^[a-zA-Z ]*$)';
    final regExp = RegExp(pattern);
    if (regExp.hasMatch(value!)) {
      if (value.trim().isNotEmpty) {
        return null;
      } else {
        return 'Full name is required';
      }
    } else {
      return 'Punctuations and numbers are not allowed!';
    }
  }

  /// Pattern checks for valid phone Numbers
  static String? phoneNumber(String? value) {
    const pattern = r'^((?!2(1|2|5)|5([1-3]|6|8))(2[0-8]|5[0-9]))\d{7}$';
    final regExp = RegExp(pattern);
    if (regExp.hasMatch(value!) && value.length == 9) {
      return null;
    } else {
      return 'Phone number is invalid!';
    }
  }

  /// Pattern checks for valid email address
  static String? email(String? value) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regExp = RegExp(pattern);
    if (regExp.hasMatch(value!)) {
      return null;
    } else {
      return 'Email is invalid!';
    }
  }

  /// Validates pin input,
  /// Must be 4 characters and all numbers
  static String? pin(String? value) {
    try {
      if (value!.length == 4 && int.parse(value) >= 0) {
        return null;
      } else {
        return '${4 - value.length} digits more';
      }
    } on FormatException {
      return 'PIN should be a number❌';
    }
  }

  /// Validates code input,
  /// Must be six characters and all numbers
  static String? code(String? value) {
    try {
      if (value!.length == 6 && int.parse(value) >= 0) {
        return null;
      } else {
        return '${6 - value.length} digits more';
      }
    } on FormatException {
      return 'Code should be a number❌';
    }
  }
}
