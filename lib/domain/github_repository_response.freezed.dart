// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repository_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GitHubRepositoryResponse _$GitHubRepositoryResponseFromJson(
    Map<String, dynamic> json) {
  return _GitHubRepositoryResponse.fromJson(json);
}

/// @nodoc
mixin _$GitHubRepositoryResponse {
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  List<GitHubRepositoryModel> get items => throw _privateConstructorUsedError;

  /// Serializes this GitHubRepositoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GitHubRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GitHubRepositoryResponseCopyWith<GitHubRepositoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitHubRepositoryResponseCopyWith<$Res> {
  factory $GitHubRepositoryResponseCopyWith(GitHubRepositoryResponse value,
          $Res Function(GitHubRepositoryResponse) then) =
      _$GitHubRepositoryResponseCopyWithImpl<$Res, GitHubRepositoryResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount,
      List<GitHubRepositoryModel> items});
}

/// @nodoc
class _$GitHubRepositoryResponseCopyWithImpl<$Res,
        $Val extends GitHubRepositoryResponse>
    implements $GitHubRepositoryResponseCopyWith<$Res> {
  _$GitHubRepositoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GitHubRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GitHubRepositoryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GitHubRepositoryResponseImplCopyWith<$Res>
    implements $GitHubRepositoryResponseCopyWith<$Res> {
  factory _$$GitHubRepositoryResponseImplCopyWith(
          _$GitHubRepositoryResponseImpl value,
          $Res Function(_$GitHubRepositoryResponseImpl) then) =
      __$$GitHubRepositoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount,
      List<GitHubRepositoryModel> items});
}

/// @nodoc
class __$$GitHubRepositoryResponseImplCopyWithImpl<$Res>
    extends _$GitHubRepositoryResponseCopyWithImpl<$Res,
        _$GitHubRepositoryResponseImpl>
    implements _$$GitHubRepositoryResponseImplCopyWith<$Res> {
  __$$GitHubRepositoryResponseImplCopyWithImpl(
      _$GitHubRepositoryResponseImpl _value,
      $Res Function(_$GitHubRepositoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GitHubRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? items = null,
  }) {
    return _then(_$GitHubRepositoryResponseImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GitHubRepositoryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GitHubRepositoryResponseImpl
    with DiagnosticableTreeMixin
    implements _GitHubRepositoryResponse {
  const _$GitHubRepositoryResponseImpl(
      {@JsonKey(name: 'total_count') required this.totalCount,
      required final List<GitHubRepositoryModel> items})
      : _items = items;

  factory _$GitHubRepositoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GitHubRepositoryResponseImplFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  final List<GitHubRepositoryModel> _items;
  @override
  List<GitHubRepositoryModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GitHubRepositoryResponse(totalCount: $totalCount, items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GitHubRepositoryResponse'))
      ..add(DiagnosticsProperty('totalCount', totalCount))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitHubRepositoryResponseImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalCount, const DeepCollectionEquality().hash(_items));

  /// Create a copy of GitHubRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GitHubRepositoryResponseImplCopyWith<_$GitHubRepositoryResponseImpl>
      get copyWith => __$$GitHubRepositoryResponseImplCopyWithImpl<
          _$GitHubRepositoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitHubRepositoryResponseImplToJson(
      this,
    );
  }
}

abstract class _GitHubRepositoryResponse implements GitHubRepositoryResponse {
  const factory _GitHubRepositoryResponse(
          {@JsonKey(name: 'total_count') required final int totalCount,
          required final List<GitHubRepositoryModel> items}) =
      _$GitHubRepositoryResponseImpl;

  factory _GitHubRepositoryResponse.fromJson(Map<String, dynamic> json) =
      _$GitHubRepositoryResponseImpl.fromJson;

  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  List<GitHubRepositoryModel> get items;

  /// Create a copy of GitHubRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GitHubRepositoryResponseImplCopyWith<_$GitHubRepositoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
