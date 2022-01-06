import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // toTitleCase tests...
  group("", () {
    test("Given a string of 3 words then each words first character is capitalized.", () {
      final String value = "one two three";
      String result = StringFormatting.toTitleCase(value);
      expect(result, "One Two Three");
    });

    test("Given a string of 3 words with characters inbetween then each words first character is capitalized.", () {
      final String value = "one , two / three";
      String result = StringFormatting.toTitleCase(value);
      expect(result, "One , Two / Three");
    });
  });

  // StartsWithAZero tests...
  group("", () {
    test("Given a string that starts with zero then true is returned.", () {
      final String value = "01";
      bool result = StringFormatting.startsWithAZero(value);
      expect(result, true);
    });

    test("Given a string that does not start with zero then false is returned.", () {
      final String value = "10";
      bool result = StringFormatting.startsWithAZero(value);
      expect(result, false);
    });

    test("Given a string that starts with a * character then false is returned.", () {
      final String value = "10";
      bool result = StringFormatting.startsWithAZero(value);
      expect(result, false);
    });
  });
}
