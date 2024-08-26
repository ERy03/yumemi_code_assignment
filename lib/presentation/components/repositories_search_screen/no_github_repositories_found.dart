import 'package:flutter/material.dart';
import 'package:yumemi_code_assignment/presentation/components/shared/bot_padding.dart';

class NoGitHubRepositoriesFound extends StatelessWidget {
  const NoGitHubRepositoriesFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const BotPadding(
      child: Center(
          child: Text(
        //TODO  Localization
        "No GitHub Repositories Found",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.1),
      )),
    );
  }
}
