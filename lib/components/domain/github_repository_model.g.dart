// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitHubRepositoryModelImpl _$$GitHubRepositoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GitHubRepositoryModelImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      htmlUrl: json['html_url'] as String,
      homepage: json['homepage'] as String?,
      stargazersCount: (json['stargazers_count'] as num).toInt(),
      watchersCount: (json['watchers_count'] as num).toInt(),
      language: json['language'] as String?,
      forksCount: (json['forks_count'] as num).toInt(),
      openIssuesCount: (json['open_issues_count'] as num).toInt(),
      owner: RepositoryOwner.fromJson(json['owner'] as Map<String, dynamic>),
      license: json['license'] == null
          ? null
          : RepositoryLicense.fromJson(json['license'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GitHubRepositoryModelImplToJson(
        _$GitHubRepositoryModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'html_url': instance.htmlUrl,
      'homepage': instance.homepage,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'language': instance.language,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.openIssuesCount,
      'owner': instance.owner,
      'license': instance.license,
    };
