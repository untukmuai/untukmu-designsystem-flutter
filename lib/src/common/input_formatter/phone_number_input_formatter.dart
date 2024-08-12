import 'package:flutter/services.dart';

class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove all characters except digits
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Check if the length is greater than 14 (for +62-XXX-XXXX-XXXX)
    if (digitsOnly.length > 13) {
      return oldValue;
    }

    // Format the string based on the number of digits
    String formattedText = '+62';
    if (digitsOnly.isNotEmpty && digitsOnly.length >= 2) {
      formattedText += '-${digitsOnly.substring(2, digitsOnly.length)}';
    }
    if (digitsOnly.length > 3) {
      formattedText =
          '+62-${digitsOnly.substring(2, 5)}-${digitsOnly.substring(5)}';
    }
    if (digitsOnly.length > 7) {
      formattedText =
          '+62-${digitsOnly.substring(2, 5)}-${digitsOnly.substring(5, 9)}-${digitsOnly.substring(9)}';
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
