class StringFormatting {
  static RegExp onlyNumbersAndOneDecimal() {
    return RegExp(r"^\d*\.?\d{0,2}");
  }

  static bool startsWithAZero(String value) {
    return value[0] == "0";
  }

  static String toTitleCase(String text) {
    return text.split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }
}
