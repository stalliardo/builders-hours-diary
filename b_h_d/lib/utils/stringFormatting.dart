class StringFormatting {
  static RegExp onlyNumbersAndOneDecimal() {
    return RegExp(r"^\d*\.?\d{0,2}");
  }

  static bool startsWithAZero(String value) {
    return value[0] == "0";
  }
}
