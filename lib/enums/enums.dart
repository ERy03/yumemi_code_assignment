import 'package:flutter/material.dart';
import 'package:yumemi_code_assignment/generated/locale_keys.g.dart';

enum RepositoryDetails {
  issues(LocaleKeys.issues, Icons.mode_standby_outlined, Color(0xff70D370)),
  forks(LocaleKeys.forks, Icons.call_split_outlined, Color(0xff4C8CF7)),
  watchers(LocaleKeys.watchers, Icons.visibility_outlined, Color(0xffF8D866)),
  license(LocaleKeys.license, Icons.balance_outlined, Color(0xffCE4F56));

  const RepositoryDetails(
    this.label,
    this.icon,
    this.color,
  );

  final String label;
  final IconData icon;
  final Color color;
}
