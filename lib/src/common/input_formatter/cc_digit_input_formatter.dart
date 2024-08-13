import 'package:flutter/services.dart';

class CcDigitInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String formatted = _getFormattedString(newValue.text);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _getFormattedString(String text) {
    text = text.replaceAll(RegExp(r'\s+\b|\b\s'), ''); // remove existing spaces
    if (text.length > 16) {
      text = text.substring(0, 16);
    }
    final List<String> chunks = [];
    for (int i = 0; i < text.length; i += 4) {
      final endIndex = i + 4;
      if (endIndex > text.length) {
        chunks.add(text.substring(i));
      } else {
        chunks.add(text.substring(i, endIndex));
      }
    }
    return chunks.join(' ');
  }
}
