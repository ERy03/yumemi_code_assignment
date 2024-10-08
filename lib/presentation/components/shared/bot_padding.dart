import 'package:flutter/material.dart';

class BotPadding extends StatelessWidget {
  const BotPadding({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.12, left: 16, right: 16),
      child: child,
    );
  }
}
