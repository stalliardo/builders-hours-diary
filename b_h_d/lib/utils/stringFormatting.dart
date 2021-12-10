class StringFormatting {
  static RegExp onlyNumbersAndOneDecimal() {
    return RegExp(r"^\d*\.?\d{0,2}");
  }
}
