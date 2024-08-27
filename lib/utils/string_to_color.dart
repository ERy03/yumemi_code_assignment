import 'package:flutter/material.dart';

// APIで取得したプログラミング言語の色を16進数カラーに変更する
Color stringToColor(String stringColor) {
  // '#'を消す
  final stringColorWithoutHash = stringColor.replaceAll('#', '');

  final stringColorWithFF = 'FF$stringColorWithoutHash';

  try {
    final color = Color(int.parse(stringColorWithFF, radix: 16));
    return color;
  } catch (_) {
    return const Color(0xFF808080);
  }
}
