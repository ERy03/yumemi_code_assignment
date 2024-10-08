// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_code_assignment/data/github_repositories_repository.dart';
import 'package:yumemi_code_assignment/domain/github_repository_search_text_notifier.dart';
import 'package:yumemi_code_assignment/presentation/components/repositories_search_screen/custom_appbar.dart';
import 'package:yumemi_code_assignment/presentation/components/repositories_search_screen/custom_search_bar.dart';
import 'package:yumemi_code_assignment/presentation/components/repositories_search_screen/find_prompt.dart';
import 'package:yumemi_code_assignment/presentation/components/repositories_search_screen/no_github_repositories_found.dart';
import 'package:yumemi_code_assignment/presentation/components/repositories_search_screen/repository_list_tile.dart';
import 'package:yumemi_code_assignment/presentation/components/shared/bot_padding.dart';
import 'package:yumemi_code_assignment/presentation/components/shared/error_messages.dart';
import 'package:yumemi_code_assignment/theme/theme_mode_provider.dart';

class RepositoriesSearchScreen extends ConsumerWidget {
  const RepositoriesSearchScreen({super.key});

  // searchRepositoriesのメソッドで定義した一度のリクエストで取得するrepositoryの数
  //（queryParametersのper_page = 20）
  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(githubRepositorySearchTextNotifierProvider);
    final themeModeState = ref.watch(themeModeNotifierProvider);
    final gitHubRepositoryTotalCount =
        ref.watch(gitHubRepositoryTotalCountProvider(query));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        themeModeProvider: themeModeState,
        context: context,
        toggle: (_) {
          ref.read(themeModeNotifierProvider.notifier).toggle();
        },
      ),
      body: Column(
        children: [
          // 検索バー
          const CustomSearchBar(),
          // Repositoriesリスト
          Expanded(
            child: query.isEmpty
                ? const FindPrompt()
                : gitHubRepositoryTotalCount.when(
                    error: (e, _) {
                      return BotPadding(
                        child: ErrorMessages(
                          error: e,
                          onPressed: gitHubRepositoryTotalCount.isLoading
                              ? null
                              : () {
                                  ref.invalidate(
                                    searchRepositoriesProvider(
                                      queryData: (page: 1, query: query),
                                    ),
                                  );
                                  return ref.read(
                                    searchRepositoriesProvider(
                                      queryData: (page: 1, query: query),
                                    ).future,
                                  );
                                },
                        ),
                      );
                    },
                    loading: () => const BotPadding(
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                    data: (repositoriesTotalCount) {
                      return repositoriesTotalCount == 0
                          ? const NoGitHubRepositoriesFound()
                          : ListView.builder(
                              // Keyを使ってqueryが変更したときにスクロールポジションをリセットする
                              key: ValueKey(query),
                              itemCount: repositoriesTotalCount,
                              itemBuilder: (context, index) {
                                // 20個目のrepositoryをスクロールした際にページ数を繰り上げる
                                final page = index ~/ pageSize + 1;
                                // Repositoryの詳細スクリーンに遷移する際
                                // 実際のRepositoryのindexが必要になるのでindexInPageを使う
                                final indexInPage = index % pageSize;
                                final gitHubRepositoryResponse = ref.watch(
                                  searchRepositoriesProvider(
                                    queryData: (page: page, query: query),
                                  ),
                                );
                                return gitHubRepositoryResponse.when(
                                  data: (gitHubResponse) {
                                    return RepositoryListTile(
                                      gitHubRepositoryModel:
                                          gitHubResponse.items[indexInPage],
                                    );
                                  },
                                  error: (e, _) {
                                    if (indexInPage != 0) return null;
                                    return SafeArea(
                                      top: false,
                                      bottom: false,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: ErrorMessages(
                                          error: e,
                                          onPressed:
                                              gitHubRepositoryResponse.isLoading
                                                  ? null
                                                  : () {
                                                      ref.invalidate(
                                                        searchRepositoriesProvider(
                                                          queryData: (
                                                            page: page,
                                                            query: query
                                                          ),
                                                        ),
                                                      );
                                                      return ref.read(
                                                        searchRepositoriesProvider(
                                                          queryData: (
                                                            page: page,
                                                            query: query
                                                          ),
                                                        ).future,
                                                      );
                                                    },
                                        ),
                                      ),
                                    );
                                  },
                                  loading: () {
                                    if (indexInPage != 0) return null;
                                    return const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
