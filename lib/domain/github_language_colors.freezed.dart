// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_language_colors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GitHubLanguageColors {
  String get name => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  /// Create a copy of GitHubLanguageColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GitHubLanguageColorsCopyWith<GitHubLanguageColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitHubLanguageColorsCopyWith<$Res> {
  factory $GitHubLanguageColorsCopyWith(GitHubLanguageColors value,
          $Res Function(GitHubLanguageColors) then) =
      _$GitHubLanguageColorsCopyWithImpl<$Res, GitHubLanguageColors>;
  @useResult
  $Res call({String name, String? color});
}

/// @nodoc
class _$GitHubLanguageColorsCopyWithImpl<$Res,
        $Val extends GitHubLanguageColors>
    implements $GitHubLanguageColorsCopyWith<$Res> {
  _$GitHubLanguageColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GitHubLanguageColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GitHubLanguageColorsImplCopyWith<$Res>
    implements $GitHubLanguageColorsCopyWith<$Res> {
  factory _$$GitHubLanguageColorsImplCopyWith(_$GitHubLanguageColorsImpl value,
          $Res Function(_$GitHubLanguageColorsImpl) then) =
      __$$GitHubLanguageColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? color});
}

/// @nodoc
class __$$GitHubLanguageColorsImplCopyWithImpl<$Res>
    extends _$GitHubLanguageColorsCopyWithImpl<$Res, _$GitHubLanguageColorsImpl>
    implements _$$GitHubLanguageColorsImplCopyWith<$Res> {
  __$$GitHubLanguageColorsImplCopyWithImpl(_$GitHubLanguageColorsImpl _value,
      $Res Function(_$GitHubLanguageColorsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GitHubLanguageColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = freezed,
  }) {
    return _then(_$GitHubLanguageColorsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GitHubLanguageColorsImpl
    with DiagnosticableTreeMixin
    implements _GitHubLanguageColors {
  const _$GitHubLanguageColorsImpl({required this.name, required this.color});

  @override
  final String name;
  @override
  final String? color;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GitHubLanguageColors(name: $name, color: $color)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GitHubLanguageColors'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('color', color));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitHubLanguageColorsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, color);

  /// Create a copy of GitHubLanguageColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GitHubLanguageColorsImplCopyWith<_$GitHubLanguageColorsImpl>
      get copyWith =>
          __$$GitHubLanguageColorsImplCopyWithImpl<_$GitHubLanguageColorsImpl>(
              this, _$identity);
}

abstract class _GitHubLanguageColors implements GitHubLanguageColors {
  const factory _GitHubLanguageColors(
      {required final String name,
      required final String? color}) = _$GitHubLanguageColorsImpl;

  @override
  String get name;
  @override
  String? get color;

  /// Create a copy of GitHubLanguageColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GitHubLanguageColorsImplCopyWith<_$GitHubLanguageColorsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
