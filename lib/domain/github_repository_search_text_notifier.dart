import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_repository_search_text_notifier.g.dart';

@riverpod
class GithubRepositorySearchTextNotifier
    extends _$GithubRepositorySearchTextNotifier {
  @override
  String build() {
    return '';
  }

  // ignore: use_setters_to_change_properties
  void setQuery(String query) {
    state = query;
  }
}
