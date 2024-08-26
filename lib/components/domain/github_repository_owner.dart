import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'github_repository_owner.freezed.dart';
part 'github_repository_owner.g.dart';

@freezed
class RepositoryOwner with _$RepositoryOwner {
  const factory RepositoryOwner({
    required String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    @JsonKey(name: 'html_url') required String htmlUrl,
  })= _RepositoryOwner;

  factory RepositoryOwner.fromJson(Map<String, Object?> json) => _$RepositoryOwnerFromJson(json);
}
