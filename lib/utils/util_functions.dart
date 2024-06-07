
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:enuaniculturalforummobile/src/models.dart';

class UtilFunctions {
  static Future<CustomButtonState> updateButtonState(
      CustomButtonState state,
      ) async {
    return state;
  }

  /// The function converts a list of integers to a list of strings.
  ///
  /// Args:
  ///   data (List<int>): A list of integers that needs to be converted to a list of strings.
  ///
  /// Returns:
  ///   A new list of strings is being returned, where each element in the original list of integers has
  /// been converted to a string using the `toString()` method.
  static List<String> intListToStringList(List<int> data) {
    return data.map((numbers) => numbers.toString()).toList();
  }

  /// The function converts a list of strings to a list of integers in Dart.
  ///
  /// Args:
  ///   data (List<String>): The parameter `data` is a `List` of `String` objects that contains the data
  /// to be converted to a `List` of `int` objects.
  ///
  /// Returns:
  ///   a list of integers obtained by parsing each element of the input list of strings using the
  /// `int.parse` method.
  static List<int> stringListToIntList(List<String> data) {
    return data.map(int.parse).toList();
  }

  static String removeSpaces(String input) {
    return input.replaceAll(' ', '');
  }

  static bool isDouble(double percent) {
    if (percent.compareTo(percent.toInt()) != 0) {
      // If the percent value is a decimal char
      return true;
    } else {
      // If the percent value is oan Integer
      return false;
    }
  }

  /// The function `formatDate` takes a string representation of a date and an optional pattern, and
  /// returns the formatted date according to the specified pattern and date pattern can be modified.
  /// Returns:
  ///   The formatted date string is being returned.
  static String formatDate(String? date, {String pattern = 'dd MMM yyyy'}) {
    if (date != null) {
      final stringDateToDatetime = DateTime.parse(date);
      final formattedDate = DateFormat(pattern).format(stringDateToDatetime);
      return formattedDate;
    } else {
      return '';
    }
  }

  static String formatTime(String? date, {String pattern = 'hh:mm a'}) {
    if (date != null) {
      final stringDateToDatetime = DateTime.parse(date);
      final formattedTime = DateFormat(pattern).format(stringDateToDatetime);
      return formattedTime;
    } else {
      return '';
    }
  }
  static String capitalizeAllWord(String value) {
    var result = value[0].toUpperCase();
    for (var i = 1; i < value.length; i++) {
      if (value[i - 1] == ' ') {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
      }
    }
    return result;
  }

  static String formatAmount(double amount, {int value = 100000000}) {
    if (amount >= value) {
      return NumberFormat.compact().format(amount);
    } else {
      return NumberFormat('#,##0.00').format(amount);
    }
  }


  static String currency(context) {
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString(), name: 'NGN');
    return format.currencyName.toString();
    // print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
    // print("CURRENCY NAME ${format.currencyName}"); // USD
  }

  static String formatNumber(int amount) {
    if (amount >= 1000000) {
      return NumberFormat.compact().format(amount);
    } else {
      return NumberFormat('#,##0').format(amount);
    }
  }

  static Future<XFile?> pickImage() async {
    return ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 600,
      maxWidth: 600,
    );
  }
  static Future<XFile?> takePhoto() async {
    return ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxHeight: 600,
      maxWidth: 600,
    );
  }


  String convertToCamelCase(String inputString) {
    List<String> words = inputString.split(' ');

    if (words.length > 1) {
      String camelCaseString = words[0].toLowerCase() +
          words.sublist(1).map((word) => word[0].toUpperCase() + word.substring(1)).join();
      return camelCaseString;
    } else {
      return inputString.toLowerCase();
    }
  }
}



class CreditCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    // Remove all non-digits from the input
    text = text.replaceAll(RegExp(r'\D'), '');

    var buffer = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' '); // Insert space after every 4 characters
      }
      buffer.write(text[i]);
    }

    var newText = buffer.toString();
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }


}

class DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    // Remove all non-digits from the input
    text = text.replaceAll(RegExp(r'\D'), '');

    if (text.length > 2) {
      // Insert slash after the second character
      text = text.substring(0, 2) + '/' + text.substring(2);
    }

    // Adjust selection if needed
    var selectionIndex = newValue.selection.baseOffset;
    if (selectionIndex > 3) {
      selectionIndex += (selectionIndex == 5) ? 1 : 2;
    }

    var newText = text.substring(0, min(text.length, 5)); // Ensure length doesn't exceed 5 characters

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: min(selectionIndex, newText.length)),
    );
  }
}
