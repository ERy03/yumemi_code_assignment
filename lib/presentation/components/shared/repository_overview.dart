import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_code_assignment/data/github_language_colors_repository.dart';
import 'package:yumemi_code_assignment/domain/github_repository_model.dart';
import 'package:yumemi_code_assignment/utils/number_formatter.dart';
import 'package:yumemi_code_assignment/utils/string_to_color.dart';

class RepositoryOverview extends ConsumerWidget {
  const RepositoryOverview({
    super.key,
    required this.gitHubRepositoryModel,
  });

  final GitHubRepositoryModel gitHubRepositoryModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const verticalSpacing = SizedBox(
      height: 5,
    );
    const horizontalSpacing = SizedBox(
      width: 3,
    );

    final colorList = ref.watch(getLanguageColorsProvider);

    return SafeArea(
      top: false,
      bottom: false,
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context).dividerColor, width: 0))),
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // ユーザーのロゴとユーザーネーム
              Row(
                children: <Widget>[
                  CachedNetworkImage(
                    height: 32,
                    width: 32,
                    imageUrl: gitHubRepositoryModel.owner.avatarUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      height: 32,
                      width: 32,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Text(
                    gitHubRepositoryModel.owner.login,
                    overflow: TextOverflow.ellipsis,
                  ))
                ],
              ),

              verticalSpacing,

              // Repository名
              Text(
                gitHubRepositoryModel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              verticalSpacing,

              // Repository description
              // * Description can be null
              Visibility(
                visible: gitHubRepositoryModel.description != null,
                child: Text(
                  gitHubRepositoryModel.description ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ),

              verticalSpacing,

              // Star数とプログラミング言語
              Row(
                children: <Widget>[
                  // Stars
                  const Icon(
                    Icons.star_outline,
                    size: 18,
                  ),
                  horizontalSpacing,
                  Text(
                    numberWithComma(gitHubRepositoryModel.stargazersCount),
                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(
                    width: 15,
                  ),

                  // プログラミング言語
                  Visibility(
                    visible: gitHubRepositoryModel.language != null,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: stringToColor(colorList.when(
                              // gitHubRepositoryModelのプログラミング言語 == colorList内のプログラミング言語のインデックスを探す
                              data: (colors) {
                                final index = colors.indexWhere((element) =>
                                    element.name ==
                                    gitHubRepositoryModel.language);
                                if (index == -1) {
                                  return "#808080";
                                } else {
                                  return colors[index].color ?? "#808080";
                                }
                              },
                              error: (_, __) => "#808080",
                              loading: () => "#808080"))),
                    ),
                  ),

                  horizontalSpacing,

                  Visibility(
                    visible: gitHubRepositoryModel.language != null,
                    child: Text(
                      gitHubRepositoryModel.language ?? '',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
