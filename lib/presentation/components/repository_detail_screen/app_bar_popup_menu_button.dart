import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yumemi_code_assignment/generated/locale_keys.g.dart';
import 'package:yumemi_code_assignment/utils/github_launch_url.dart';

class AppBarPopupMenuButton extends StatefulWidget {
  const AppBarPopupMenuButton({
    required this.htmlUrl,
    required this.repoAuthor,
    required this.repoTitle,
    super.key,
  });

  final String htmlUrl;
  final String repoAuthor;
  final String repoTitle;

  @override
  State<AppBarPopupMenuButton> createState() => _AppBarPopupMenuButtonState();
}

class _AppBarPopupMenuButtonState extends State<AppBarPopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: const Offset(-175, 0),
      style: const MenuStyle(
        elevation: WidgetStatePropertyAll(1),
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(
            Icons.more_horiz,
          ),
        );
      },
      menuChildren: <Widget>[
        Column(
          children: [
            MenuItemButton(
              style: const ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(210, 50)),
              ),
              trailingIcon: Icon(
                Icons.ios_share_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              child: Text(
                LocaleKeys.shareVia.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: () async {
                // iPad用にsharePositionOriginのパラメーターが必要
                // https://pub.dev/packages/share_plus#:~:text=the%20CoreFoundationKeys%20documentation.-,iPad,-share_plus%20requires%20iPad
                final box = context.findRenderObject() as RenderBox?;
                await Share.share(
                  widget.htmlUrl,
                  subject: context.locale == const Locale('ja')
                      ? '${widget.repoAuthor}の${widget.repoTitle}リポジトリをチェックする'
                      :
                      // ignore: lines_longer_than_80_chars
                      "Check out ${widget.repoAuthor}'s ${widget.repoTitle} repository",
                  sharePositionOrigin:
                      box!.localToGlobal(Offset.zero) & box.size,
                );
              },
            ),
            const Divider(
              height: 0,
            ),
            MenuItemButton(
              style: const ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(210, 50)),
              ),
              trailingIcon: Icon(
                Icons.public_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              child: Text(
                LocaleKeys.viewOnGitHub.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: () async {
                await gitHubLaunchUrl(widget.htmlUrl, context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
