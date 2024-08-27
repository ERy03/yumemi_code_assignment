import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yumemi_code_assignment/generated/locale_keys.g.dart';

// このようにtry catchで囲まないとandroidではalert dialogが表示されない
Future<void> gitHubLaunchUrl(String stringUrl, BuildContext context) async {
  try {
    final url = Uri.parse(stringUrl);
    if (!await launchUrl(url)) {
      if (context.mounted) {
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) => AlertDialog.adaptive(
            title: Text(LocaleKeys.error.tr()),
            content: Text(LocaleKeys.unableToLaunchUrl.tr()),
            actions: [
              TextButton(
                child: Text(LocaleKeys.ok.tr()),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      } else {
        throw Exception('Could not launch $url');
      }
    }
  } catch (_) {
    if (context.mounted) {
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog.adaptive(
          title: Text(LocaleKeys.error.tr()),
          content: Text(LocaleKeys.unableToLaunchUrl.tr()),
          actions: [
            TextButton(
              child: Text(LocaleKeys.ok.tr()),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }
}
