import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repository_license.freezed.dart';
part 'github_repository_license.g.dart';

@freezed
class RepositoryLicense with _$RepositoryLicense {
  const factory RepositoryLicense({
    @JsonKey(name: 'spdx_id') required String spdxId,
  }) = _RepositoryLicense;

  factory RepositoryLicense.fromJson(Map<String, Object?> json) =>
      _$RepositoryLicenseFromJson(json);
}
