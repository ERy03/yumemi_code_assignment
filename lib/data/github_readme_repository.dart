import 'dart:async';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_readme_repository.g.dart';

class GithubReadmeRepository {
  const GithubReadmeRepository(this._dio);

  final Dio _dio;

  Future<String> getRepositoryReadme({
    required String owner,
    required String repo,
    CancelToken? cancelToken,
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.github.com',
      path: 'repos/$owner/$repo/readme',
    ).toString();
    final option = Options(
      headers: {'Accept': 'application/vnd.github.raw+json'},
      responseType: ResponseType.plain,
    );
    final response =
        await _dio.get<dynamic>(url, cancelToken: cancelToken, options: option);
    return response.data as String;
  }
}

@riverpod
GithubReadmeRepository gitHubReadmeRepository(GitHubReadmeRepositoryRef ref) {
  return GithubReadmeRepository(Dio());
}

@riverpod
Future<String> getRepositoryReadme(
  GetRepositoryReadmeRef ref,
  String owner,
  String repo,
) {
  // Timer based Caching
  // https://codewithandrea.com/articles/flutter-riverpod-data-caching-providers-lifecycle/#caching-with-timeout

  // このproviderはauto disposeされるのでそれを阻止する
  final link = ref.keepAlive();

  Timer? timer;
  final cancelToken = CancelToken();

  ref.onDispose(() {
    timer?.cancel();
    cancelToken.cancel();
  });

  // Cacheを破棄するTimerをスタートさせる
  ref.onCancel(() {
    // 30秒のタイマースタート
    timer = Timer(const Duration(seconds: 30), link.close);
  });

  // providerが再びlistenされたらCacheを破棄せずタイマーをキャンセルする
  ref.onResume(() {
    timer?.cancel();
  });

  return ref
      .read(gitHubReadmeRepositoryProvider)
      .getRepositoryReadme(owner: owner, repo: repo, cancelToken: cancelToken);
}
