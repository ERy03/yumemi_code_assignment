import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_code_assignment/utils/string_to_color.dart';

void main() {
  group('stringToColor', () {
    test('converts valid String to Color', () {
      expect(stringToColor('#FFFFFF'), const Color(0xFFFFFFFF));
      expect(stringToColor('#000000'), const Color(0xFF000000));
      expect(stringToColor('#FF0000'), const Color(0xFFFF0000));
      expect(stringToColor('#00FF00'), const Color(0xFF00FF00));
      expect(stringToColor('#0000FF'), const Color(0xFF0000FF));
    });

    test('handles String colors without #', () {
      expect(stringToColor('FFFFFF'), const Color(0xFFFFFFFF));
      expect(stringToColor('000000'), const Color(0xFF000000));
    });

    test('returns default color for invalid String colors', () {
      expect(stringToColor('#GGGGGG'), defaultColor);
      expect(stringToColor('XYZ123'), defaultColor);
      expect(stringToColor('#12345G'), defaultColor);
    });
  });
}
