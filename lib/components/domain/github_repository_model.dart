import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:yumemi_code_assignment/components/domain/github_repository_license.dart';
import 'package:yumemi_code_assignment/components/domain/github_repository_owner.dart';

part 'github_repository_model.freezed.dart';
part 'github_repository_model.g.dart';

@freezed
class GitHubRepositoryModel with _$GitHubRepositoryModel {
  const factory GitHubRepositoryModel({
    required String name,
    String? description,
    @JsonKey(name: 'html_url') required String htmlUrl,
    String? homepage,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
    @JsonKey(name: 'watchers_count') required int watchersCount,
    String? language,
    @JsonKey(name: 'forks_count') required int forksCount,
    @JsonKey(name: 'open_issues_count') required int openIssuesCount,
    required RepositoryOwner owner,
    RepositoryLicense? license,
  }) = _GitHubRepositoryModel;

  factory GitHubRepositoryModel.fromJson(Map<String, Object?> json) =>
      _$GitHubRepositoryModelFromJson(json);
}
