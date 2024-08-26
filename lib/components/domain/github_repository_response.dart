import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:yumemi_code_assignment/components/domain/github_repository_model.dart';

part 'github_repository_response.freezed.dart';
part 'github_repository_response.g.dart';

@freezed
class GitHubRepositoryResponse with _$GitHubRepositoryResponse {
  const factory GitHubRepositoryResponse({
    @JsonKey(name: 'total_count') required int totalCount,
    required List<GitHubRepositoryModel> items,
  }) = _GitHubRepositoryResponse;

  factory GitHubRepositoryResponse.fromJson(Map<String, Object?> json) =>
      _$GitHubRepositoryResponseFromJson(json);
}
