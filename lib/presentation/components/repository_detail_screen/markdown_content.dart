import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:markdown/markdown.dart';
import 'package:yumemi_code_assignment/data/github_readme_repository.dart';
import 'package:yumemi_code_assignment/presentation/components/shared/error_messages.dart';
import 'package:yumemi_code_assignment/utils/github_launch_url.dart';

class MarkdownContent extends ConsumerWidget {
  const MarkdownContent({
    required this.repo,
    required this.owner,
    super.key,
  });
  final String repo;
  final String owner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gitHubReadme = ref.watch(getRepositoryReadmeProvider(owner, repo));
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: gitHubReadme.when(
          data: (data) {
            return MarkdownBody(
              onTapLink: (_, href, __) {
                if (href != null) {
                  gitHubLaunchUrl(href, context);
                }
              },
              selectable: true,
              extensionSet: ExtensionSet(
                ExtensionSet.gitHubFlavored.blockSyntaxes,
                [
                  EmojiSyntax(),
                  ...ExtensionSet.gitHubFlavored.inlineSyntaxes,
                ],
              ),
              data: data,
              imageBuilder: (uri, _, __) => CachedNetworkImage(
                placeholder: (_, __) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
                imageUrl: uri.toString(),
                errorWidget: (_, url, dynamic __) {
                  // 画像がsvgの場合はjovial svgを使用する
                  return ScalableImageWidget.fromSISource(
                    onError: (_) {
                      return const SizedBox();
                    },
                    si: ScalableImageSource.fromSvgHttpUrl(
                      Uri.parse(url),
                    ),
                  );
                },
              ),
            );
          },
          error: (e, _) {
            return Center(
              child: ErrorMessages(
                error: e,
                onPressed: gitHubReadme.isLoading
                    ? null
                    : () {
                        ref.invalidate(
                          getRepositoryReadmeProvider(owner, repo),
                        );
                        return ref.read(
                          getRepositoryReadmeProvider(owner, repo).future,
                        );
                      },
              ),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
