import 'dart:async';
import 'package:dio/dio.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_code_assignment/domain/github_repository_response.dart';

part 'github_repositories_repository.g.dart';

typedef QueryData = ({String query, int page});

class GitHubRepositoriesRepository {
  const GitHubRepositoriesRepository(this._dio);

  final Dio _dio;

  Future<GitHubRepositoryResponse> searchRepositories({
    required QueryData queryData,
    CancelToken? cancelToken,
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.github.com',
      path: 'search/repositories',
      queryParameters: {
        'page': "${queryData.page}",
        'q': queryData.query,
        'per_page': "20",
      },
    ).toString();
    final option = Options(headers: {"accept": "application/vnd.github+json"});
    final response =
        await _dio.get(url, cancelToken: cancelToken, options: option);
    return GitHubRepositoryResponse.fromJson(response.data);
  }
}

@riverpod
GitHubRepositoriesRepository gitHubRepositoriesRepository(
    GitHubRepositoriesRepositoryRef ref) {
  return GitHubRepositoriesRepository(Dio());
}

@riverpod
AsyncValue<int> gitHubRepositoryTotalCount(
    GitHubRepositoryTotalCountRef ref, String query) {
  return ref
      .watch(searchRepositoriesProvider(queryData: (page: 1, query: query)))
      .whenData((value) => value.totalCount);
}

@riverpod
Future<GitHubRepositoryResponse> searchRepositories(
  SearchRepositoriesRef ref, {
  required QueryData queryData,
}) async {
  // 参考：https://riverpod.dev/docs/case_studies/cancel
  // http リクエストをキャンセルするためのdioオブジェクト
  final cancelToken = CancelToken();

  // このproviderが破棄される時にHttpリクエストをCancelする
  ref.onDispose(() {
    cancelToken.cancel();
  });

  // debouncing
  // ユーザーがqueryをタイプするとすぐAPIが呼び出されなくするためのdebouncing
  await Future.delayed(const Duration(milliseconds: 500));

  // 下記のExceptionはRiverpodでキャッチされる
  if (cancelToken.isCancelled) throw Exception('Cancelled');

  return ref
      .watch(gitHubRepositoriesRepositoryProvider)
      .searchRepositories(queryData: queryData, cancelToken: cancelToken);
}
