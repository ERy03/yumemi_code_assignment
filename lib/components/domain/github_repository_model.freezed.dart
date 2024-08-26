// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repository_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GitHubRepositoryModel _$GitHubRepositoryModelFromJson(
    Map<String, dynamic> json) {
  return _GitHubRepositoryModel.fromJson(json);
}

/// @nodoc
mixin _$GitHubRepositoryModel {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get htmlUrl => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  @JsonKey(name: 'stargazers_count')
  int get stargazersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'watchers_count')
  int get watchersCount => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'forks_count')
  int get forksCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_issues_count')
  int get openIssuesCount => throw _privateConstructorUsedError;
  RepositoryOwner get owner => throw _privateConstructorUsedError;
  RepositoryLicense? get license => throw _privateConstructorUsedError;

  /// Serializes this GitHubRepositoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GitHubRepositoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GitHubRepositoryModelCopyWith<GitHubRepositoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitHubRepositoryModelCopyWith<$Res> {
  factory $GitHubRepositoryModelCopyWith(GitHubRepositoryModel value,
          $Res Function(GitHubRepositoryModel) then) =
      _$GitHubRepositoryModelCopyWithImpl<$Res, GitHubRepositoryModel>;
  @useResult
  $Res call(
      {String name,
      String? description,
      @JsonKey(name: 'html_url') String htmlUrl,
      String? homepage,
      @JsonKey(name: 'stargazers_count') int stargazersCount,
      @JsonKey(name: 'watchers_count') int watchersCount,
      String? language,
      @JsonKey(name: 'forks_count') int forksCount,
      @JsonKey(name: 'open_issues_count') int openIssuesCount,
      RepositoryOwner owner,
      RepositoryLicense? license});

  $RepositoryOwnerCopyWith<$Res> get owner;
  $RepositoryLicenseCopyWith<$Res>? get license;
}

/// @nodoc
class _$GitHubRepositoryModelCopyWithImpl<$Res,
        $Val extends GitHubRepositoryModel>
    implements $GitHubRepositoryModelCopyWith<$Res> {
  _$GitHubRepositoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GitHubRepositoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? htmlUrl = null,
    Object? homepage = freezed,
    Object? stargazersCount = null,
    Object? watchersCount = null,
    Object? language = freezed,
    Object? forksCount = null,
    Object? openIssuesCount = null,
    Object? owner = null,
    Object? license = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchersCount: null == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      forksCount: null == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int,
      openIssuesCount: null == openIssuesCount
          ? _value.openIssuesCount
          : openIssuesCount // ignore: cast_nullable_to_non_nullable
              as int,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as RepositoryOwner,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as RepositoryLicense?,
    ) as $Val);
  }

  /// Create a copy of GitHubRepositoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepositoryOwnerCopyWith<$Res> get owner {
    return $RepositoryOwnerCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }

  /// Create a copy of GitHubRepositoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepositoryLicenseCopyWith<$Res>? get license {
    if (_value.license == null) {
      return null;
    }

    return $RepositoryLicenseCopyWith<$Res>(_value.license!, (value) {
      return _then(_value.copyWith(license: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GitHubRepositoryModelImplCopyWith<$Res>
    implements $GitHubRepositoryModelCopyWith<$Res> {
  factory _$$GitHubRepositoryModelImplCopyWith(
          _$GitHubRepositoryModelImpl value,
          $Res Function(_$GitHubRepositoryModelImpl) then) =
      __$$GitHubRepositoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      @JsonKey(name: 'html_url') String htmlUrl,
      String? homepage,
      @JsonKey(name: 'stargazers_count') int stargazersCount,
      @JsonKey(name: 'watchers_count') int watchersCount,
      String? language,
      @JsonKey(name: 'forks_count') int forksCount,
      @JsonKey(name: 'open_issues_count') int openIssuesCount,
      RepositoryOwner owner,
      RepositoryLicense? license});

  @override
  $RepositoryOwnerCopyWith<$Res> get owner;
  @override
  $RepositoryLicenseCopyWith<$Res>? get license;
}

/// @nodoc
class __$$GitHubRepositoryModelImplCopyWithImpl<$Res>
    extends _$GitHubRepositoryModelCopyWithImpl<$Res,
        _$GitHubRepositoryModelImpl>
    implements _$$GitHubRepositoryModelImplCopyWith<$Res> {
  __$$GitHubRepositoryModelImplCopyWithImpl(_$GitHubRepositoryModelImpl _value,
      $Res Function(_$GitHubRepositoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GitHubRepositoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? htmlUrl = null,
    Object? homepage = freezed,
    Object? stargazersCount = null,
    Object? watchersCount = null,
    Object? language = freezed,
    Object? forksCount = null,
    Object? openIssuesCount = null,
    Object? owner = null,
    Object? license = freezed,
  }) {
    return _then(_$GitHubRepositoryModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchersCount: null == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      forksCount: null == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int,
      openIssuesCount: null == openIssuesCount
          ? _value.openIssuesCount
          : openIssuesCount // ignore: cast_nullable_to_non_nullable
              as int,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as RepositoryOwner,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as RepositoryLicense?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GitHubRepositoryModelImpl
    with DiagnosticableTreeMixin
    implements _GitHubRepositoryModel {
  const _$GitHubRepositoryModelImpl(
      {required this.name,
      this.description,
      @JsonKey(name: 'html_url') required this.htmlUrl,
      this.homepage,
      @JsonKey(name: 'stargazers_count') required this.stargazersCount,
      @JsonKey(name: 'watchers_count') required this.watchersCount,
      this.language,
      @JsonKey(name: 'forks_count') required this.forksCount,
      @JsonKey(name: 'open_issues_count') required this.openIssuesCount,
      required this.owner,
      this.license});

  factory _$GitHubRepositoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GitHubRepositoryModelImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @override
  final String? homepage;
  @override
  @JsonKey(name: 'stargazers_count')
  final int stargazersCount;
  @override
  @JsonKey(name: 'watchers_count')
  final int watchersCount;
  @override
  final String? language;
  @override
  @JsonKey(name: 'forks_count')
  final int forksCount;
  @override
  @JsonKey(name: 'open_issues_count')
  final int openIssuesCount;
  @override
  final RepositoryOwner owner;
  @override
  final RepositoryLicense? license;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GitHubRepositoryModel(name: $name, description: $description, htmlUrl: $htmlUrl, homepage: $homepage, stargazersCount: $stargazersCount, watchersCount: $watchersCount, language: $language, forksCount: $forksCount, openIssuesCount: $openIssuesCount, owner: $owner, license: $license)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GitHubRepositoryModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('htmlUrl', htmlUrl))
      ..add(DiagnosticsProperty('homepage', homepage))
      ..add(DiagnosticsProperty('stargazersCount', stargazersCount))
      ..add(DiagnosticsProperty('watchersCount', watchersCount))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('forksCount', forksCount))
      ..add(DiagnosticsProperty('openIssuesCount', openIssuesCount))
      ..add(DiagnosticsProperty('owner', owner))
      ..add(DiagnosticsProperty('license', license));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitHubRepositoryModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.watchersCount, watchersCount) ||
                other.watchersCount == watchersCount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.forksCount, forksCount) ||
                other.forksCount == forksCount) &&
            (identical(other.openIssuesCount, openIssuesCount) ||
                other.openIssuesCount == openIssuesCount) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.license, license) || other.license == license));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      htmlUrl,
      homepage,
      stargazersCount,
      watchersCount,
      language,
      forksCount,
      openIssuesCount,
      owner,
      license);

  /// Create a copy of GitHubRepositoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GitHubRepositoryModelImplCopyWith<_$GitHubRepositoryModelImpl>
      get copyWith => __$$GitHubRepositoryModelImplCopyWithImpl<
          _$GitHubRepositoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitHubRepositoryModelImplToJson(
      this,
    );
  }
}

abstract class _GitHubRepositoryModel implements GitHubRepositoryModel {
  const factory _GitHubRepositoryModel(
      {required final String name,
      final String? description,
      @JsonKey(name: 'html_url') required final String htmlUrl,
      final String? homepage,
      @JsonKey(name: 'stargazers_count') required final int stargazersCount,
      @JsonKey(name: 'watchers_count') required final int watchersCount,
      final String? language,
      @JsonKey(name: 'forks_count') required final int forksCount,
      @JsonKey(name: 'open_issues_count') required final int openIssuesCount,
      required final RepositoryOwner owner,
      final RepositoryLicense? license}) = _$GitHubRepositoryModelImpl;

  factory _GitHubRepositoryModel.fromJson(Map<String, dynamic> json) =
      _$GitHubRepositoryModelImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'html_url')
  String get htmlUrl;
  @override
  String? get homepage;
  @override
  @JsonKey(name: 'stargazers_count')
  int get stargazersCount;
  @override
  @JsonKey(name: 'watchers_count')
  int get watchersCount;
  @override
  String? get language;
  @override
  @JsonKey(name: 'forks_count')
  int get forksCount;
  @override
  @JsonKey(name: 'open_issues_count')
  int get openIssuesCount;
  @override
  RepositoryOwner get owner;
  @override
  RepositoryLicense? get license;

  /// Create a copy of GitHubRepositoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GitHubRepositoryModelImplCopyWith<_$GitHubRepositoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
