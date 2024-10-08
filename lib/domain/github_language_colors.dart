import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_language_colors.freezed.dart';

@freezed
class GitHubLanguageColors with _$GitHubLanguageColors {
  const factory GitHubLanguageColors({
    required String name,
    required String? color,
  }) = _GitHubLanguageColors;
}
