import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_code_assignment/components/domain/github_language_colors.dart';

part 'github_language_colors_repository.g.dart';

class GitHubLanguageColorsRepository {
  const GitHubLanguageColorsRepository(this._dio);

  final Dio _dio;

  Future<List<GitHubLanguageColors>> getLanguageColors() async {
    final url = Uri(
      scheme: 'https',
      host: 'raw.githubusercontent.com',
      path: 'ozh/github-colors/master/colors.json',
    ).toString();

    final response = await _dio.get(url);
    final List<GitHubLanguageColors> languageColors = [];
    final Map<String, dynamic> data = jsonDecode(response.data);

    data.forEach((key, value) {
      languageColors
          .add(GitHubLanguageColors(name: key, color: value['color']));
    });
    return languageColors;
  }
}

// keepAliveはtrueにしておくことでdisposeされずにメモリに保管する
@Riverpod(keepAlive: true)
GitHubLanguageColorsRepository gitHubLanguageColorsRepository(
    GitHubLanguageColorsRepositoryRef ref) {
  return GitHubLanguageColorsRepository(Dio());
}

@Riverpod(keepAlive: true)
Future<List<GitHubLanguageColors>> getLanguageColors(GetLanguageColorsRef ref) {
  return ref.read(gitHubLanguageColorsRepositoryProvider).getLanguageColors();
}
