import 'package:intl/intl.dart';

// RepositoryのStar数をカンマを使ってフォーマットするためのメソッド
String numberWithComma(int num) {
  final formatter = NumberFormat('###,###', 'en_US');
  return formatter.format(num);
}

// RepositoryのStar数をコンパクトにするためのメソッド
String numberCompact(int num) {
  final formatter = NumberFormat.compact();
  return formatter.format(num);
}
