// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepositoryOwnerImpl _$$RepositoryOwnerImplFromJson(
        Map<String, dynamic> json) =>
    _$RepositoryOwnerImpl(
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
      htmlUrl: json['html_url'] as String,
    );

Map<String, dynamic> _$$RepositoryOwnerImplToJson(
        _$RepositoryOwnerImpl instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'html_url': instance.htmlUrl,
    };
