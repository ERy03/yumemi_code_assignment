import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_code_assignment/domain/github_language_colors.dart';

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

    final response = await _dio.get<dynamic>(url);
    final languageColors = <GitHubLanguageColors>[];
    final data = jsonDecode(response.data as String) as Map<String, dynamic>;

    data.forEach((key, value) {
      languageColors.add(
        // ignore: avoid_dynamic_calls
        GitHubLanguageColors(name: key, color: value['color'] as String?),
      );
    });
    return languageColors;
  }
}

// keepAliveはtrueにしておくことでdisposeされずにメモリに保管する
@Riverpod(keepAlive: true)
GitHubLanguageColorsRepository gitHubLanguageColorsRepository(
  GitHubLanguageColorsRepositoryRef ref,
) {
  return GitHubLanguageColorsRepository(Dio());
}

@Riverpod(keepAlive: true)
Future<List<GitHubLanguageColors>> getLanguageColors(GetLanguageColorsRef ref) {
  return ref.read(gitHubLanguageColorsRepositoryProvider).getLanguageColors();
}
