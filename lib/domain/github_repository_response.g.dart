// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitHubRepositoryResponseImpl _$$GitHubRepositoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GitHubRepositoryResponseImpl(
      totalCount: (json['total_count'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => GitHubRepositoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GitHubRepositoryResponseImplToJson(
        _$GitHubRepositoryResponseImpl instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'items': instance.items,
    };
