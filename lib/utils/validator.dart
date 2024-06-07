/// Class of validation functions that the app will use
///   - This class should be used as a mixin using the `with` keyword
class Validators {
  final phoneNumberRegExp = RegExp(
    r'^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{9})$',
  );
  final emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  );
  final zipCodeRegExp = RegExp(r'^[0-9]{5}(?:-[0-9]{4})?$');
  final dateRegExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');
  final mustContainCapital = RegExp('^(?=.*?[A-Z])');
  final mustContainNumber = RegExp('^(?=.*?[0-9])');
  final mustContainCharacter = RegExp(r'^(?=.*?[#?!@$%^&*-])');

  String? validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegExp.hasMatch(value.trim())) {
      return 'Email is invalid';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value!.trim().isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!phoneNumberRegExp.hasMatch(value.trim())) {
      return 'Phone number is invalid';
    }
    return null;
  }

  String? validateDate(String? value) {
    if (value!.trim().isEmpty) {
      return 'Date cannot be empty';
    } else if (!dateRegExp.hasMatch(value.trim())) {
      return 'Date is invalid.\nFormat: 2015-05-26(YYYY-MM-DD)';
    }
    return null;
  }
  String? validateEmptyField(String? value) {
    if (value!.trim().isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  String? validateZip(String? value) {
    if (value!.trim().isEmpty) {
      return 'Zip code cannot be empty';
    } else if (!zipCodeRegExp.hasMatch(value.trim())) {
      return 'Zip code is invalid';
    }
    return null;
  }

  String? validateInteger(String value) {
    if (value.isEmpty) {
      return 'Please enter a value';
    }
    final numericValue = int.tryParse(value);
    if (numericValue == null || numericValue <= 0) {
      return 'Please enter a positive number';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password is too short';
    } else if (!mustContainCapital.hasMatch(value.trim())) {
      return 'Password must contain at least one upper case';
    } else if (!mustContainNumber.hasMatch(value.trim())) {
      return 'Password must contain at least one digit';
    } else if (!mustContainCharacter.hasMatch(value.trim())) {
      return 'at least one special character';
    }
    return null;
  }
  String? validateBvn(String? value) {
    if (value!.trim().isEmpty) {
      return 'Field cannot be empty';
    }else if (int.tryParse(value) == null) {
      return 'Field should be a valid number';
    } else if (value.length < 11) {
      return 'Field should be 11 digits';
    }
    return null;
  }

  String? validateNewPassword(String? value, String? newValue) {
    if (value!.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password is too short';
    } else if (!mustContainCapital.hasMatch(value.trim())) {
      return 'Password must contain at least one upper case';
    } else if (!mustContainNumber.hasMatch(value.trim())) {
      return 'Password must contain at least one digit';
    } else if (!mustContainCharacter.hasMatch(value.trim())) {
      return 'at least one special character';
    } else if (value.trim() == (newValue ?? '').trim()) {
      return 'New password cannot be the same as old';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? newValue) {
    if (value!.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password is too short';
    } else if (!mustContainCapital.hasMatch(value.trim())) {
      return 'Password must contain at least one upper case';
    } else if (!mustContainNumber.hasMatch(value.trim())) {
      return 'Password must contain at least one digit';
    } else if (!mustContainCharacter.hasMatch(value.trim())) {
      return 'at least one special character';
    } else if (value.trim() != (newValue ?? '').trim()) {
      return 'Password does not match';
    }
    return null;
  }

  String? validateEmptyTextField(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field cannot be empty';
    } else if (value.contains(' ')) {
      return 'This field cannot contain blank spaces';
    } else if (RegExp(r'[!@#,.<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return 'This field can only contains alphabets';
    }
    return null;
  }

  String? validateUserName(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field cannot be empty';
    } else if (value.contains(' ')) {
      return 'This field cannot contain blank spaces';
    } else if (value.length <= 4) {
      return 'Username too small';
    }
    return null;
  }

  String? validateReferralCode(String? value) {
    if (value!.trim().isEmpty) {
      return 'Referral code is required';
    } else if (value.length <= 7) {
      return 'Invalid referral code';
    }
    return null;
  }

  String? validateShippingAdrress({String? street,String? city, String? state, String? postCode}) {
    if (street == '' || city == '' || state == '' || postCode == '' ) {
      return 'Invalid Address, please select a valid\nCompany address';
    }
    return null;
  }
}

class FieldValidator {
  static String? validateText(
    String value, {
    String? error,
    num? maxCharacters,
  }) {
    if (value.isEmpty) {
      return error ?? 'This field cannot be empty';
    }

    if (maxCharacters != null && value.length >= maxCharacters) {
      return 'max $maxCharacters';
    }
    return null;
  }

  static String? hasValidUrl(String value) {
    const pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter url';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid url';
    }
    return null;
  }

}

/// validation for cards visa or master
