import 'package:flutter_test/flutter_test.dart';

import 'package:yumemi_code_assignment/utils/number_formatter.dart';

void main() {
  group('numberWithComma', () {
    test('formats number with commas correctly', () {
      expect(numberWithComma(1000), '1,000');
      expect(numberWithComma(1000000), '1,000,000');
      expect(numberWithComma(987654321), '987,654,321');
    });

    test('formats small numbers without commas correctly', () {
      expect(numberWithComma(123), '123');
      expect(numberWithComma(45), '45');
      expect(numberWithComma(0), '0');
    });
  });
}
